table1: .hnd.h[`core.hdb] "select time, price from trade where date = 2013.01.02, sym =`SPY, time within (04:00:00,09:27:00)"
select close: last price by 1 xbar time.second from table1
.hnd.h[`core.hdb] "funcPeihan :{[x] select close: last price, size: sum size by 1 xbar time.minute, sym,date from trade where date = x, sym=`AB}"
.hnd.h[`core.hdb] "datePeihan :date[where date>2013.01.01]"
.hnd.h[`core.hdb] "datePeihan :datePeihan[where datePeihan<2013.02.01]"
.hnd.h[`core.hdb] "select close: last price, size: sum size by 1 xbar time.minute, sym from trade where date = 2013.01.02, sym=`AAPL"
.hnd.h[`core.hdb] "datePeihan[0]"
.hnd.h[`core.hdb] "raze funcPeihan '[datePeihan]"
datescsv: h(".hnd.h[`core.hdb] \"select sym, date, time, price, size from trade where date = 2013.01.02, sym =`AAPL, time <= 09:27:00\"")
h: hopen`:108.60.133.23:5003:peihan:kxGuest95
save `datescsv.csv
.hnd.h[`core.hdb] "date"
table1: h("select from (.hnd.h[`core.hdb] \"select close: last price by 1 xbar time.minute, sym, date from trade where date = 2013.02.01,sym=`SPY\") where not cond like \"N*\"")
h("select from (.hnd.h[`core.hdb] \"select close: last price by 1 xbar time.minute from trade where date = 2015.02.10,sym=`BAC\") where not cond like \"N*\"")
.hnd.h[`core.hdb] "select sym, link.name, link.ex from trade where date=2015.02.10,sym=`BAC"
table1: h(".hnd.h[`core.hdb] \"select price: last price by 1 xbar time.minute from trade where date=2015.02.09,sym=`A\"")
select minute,price from table1
table1: update delta:{0,1_deltas x} price from table1
