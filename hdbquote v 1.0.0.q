h: hopen`:108.60.133.23:5003:peihan:kxGuest95;

setDateList:{[start;end]
    date: h(".hnd.h[`core.hdb] `date");
    dateList:: date[where date within (start;end)];
};

makeMinuteBar :{[x;y]
    strtemp1:"select from (.hnd.h[`core.hdb] \"select sym,date,time,bbprice,bbsize,baprice,basize from nbbo where date = ";
    datetemp: string x;
    strtemp2:", sym = `";
    symtemp: string y;
    strtemp3:", time within (09:30:00,16:01:00)\") where cond = \"A\")";
    table1: h(strtemp1,datetemp,strtemp2,symtemp,strtemp3);
    table1: select FBP: first bbprice, LBP: last bbprice, FBS: first bbsize, LBS: last bbsize, FAP: first baprice, LAP: last baprice, FAS: first basize, LAS: last basize by 1 xbar time.minute, sym, date from table1
    fullsec:aj[`minute;([]minute:(09:30 + til `int$(16:01-09:30)));select sym, date ,minute, FBP, LBP, FBS, LBS, FAP, LAP, FAS, LAS from table1];
    fullsec: update sym: y, date: x, FBP: 0e, LBP: 0e, FBS: 0i, LBS: 0i, FAP: 0e, LAP: 0e, FAS: 0i, LAS: 0i from fullsec where sym like "";
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
