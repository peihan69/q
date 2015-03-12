h: hopen`:108.60.133.23:5003:peihan:kxGuest95;
datelist: h(".hnd.h[`core.hdb] \" date[where date>2013.01.01]\"");
datelist: datelist[where datelist<2013.07.01];
outputdir: `:Z:/Peihan/data/SPY;
funcPeihan :{[x] 
    strtemp1:"select from (.hnd.h[`core.hdb] \"select sym,date,time,price,cond from trade where date = ";
    datetemp: string x;
    strtemp2:",sym=`SPY, time within (09:30:00,16:00:00)\") where not cond like \"N*\"";
    table1: h(strtemp1,datetemp,strtemp2);
    table1: select close: last price by 1 xbar time.minute, sym, date from table1;
    fullsec:aj[`minute;([]minute:(09:30 + til `int$(16:01-09:30)));table1];
	outname:`$(string x),".csv";
	outname:` sv outputdir, outname;
	outname 0: .h.tx[`csv;fullsec];
}
funcPeihan '[datelist]
