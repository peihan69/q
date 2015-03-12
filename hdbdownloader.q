h: hopen`:108.60.133.23:5003:peihan:kxGuest95;

setDateList:{[start;end]
    date: h(".hnd.h[`core.hdb] `date");
    dateList:: date[where date within (start;end)];
};

makeMinuteBar :{[x;y]
    strtemp1:"select from (.hnd.h[`core.hdb] \"select sym,date,time,price,size,cond,ex,corr from trade where date = ";
    datetemp: string x;
    strtemp2:", sym = `";
    symtemp: string y;
    strtemp3:", time within (09:30:00,16:01:00), corr < 9\") where not cond like \"*N*\", not cond like \"*4*\", not ex =\"D\"";
    table1: h(strtemp1,datetemp,strtemp2,symtemp,strtemp3);
    table1: select open: first price, high: max price, low: min price, close: last price, size:sum size by 1 xbar time.minute, sym, date from table1;
    fullsec:aj[`minute;([]minute:(09:30 + til `int$(16:01-09:30)));select sym, date ,minute, open, high, low, close from table1];
    fullsec: fullsec lj 1!(select minute, size from table1);
    fullsec: update open: 0e^fullsec.open, high: 0e^fullsec.high,low: 0e^fullsec.low,close: 0e^fullsec.close, size: 0i^fullsec.size from fullsec;
    fullsec: update sym: y, date: x from fullsec where sym like "";
    fullsec
};

setDateList [2013.01.01;2013.01.09];
outputdir: `:Z:/Peihan/data/test;
symblist: ("SS"; enlist ",") 0:`:C:/Users/Administrator/Desktop/universe.csv;

i:0; while[i<count symblist;
    temp: ([] str: ());
    j:0; while[j<count dateList; `temp insert enlist `symblist.sym[i]; j:j+1];
    combined: raze makeMinuteBar '[dateList;temp[`str]];
    outname:`$((string `temp[`str][0]),".csv");
    outname:` sv outputdir, outname;
    outname 0: .h.tx[`csv;combined];
    i:i+1];
