Here is a program to download data from kdb server. 

hopen opens a port to the kdb server from local. Please use your own username and password.

setDateList is to change the date range with start and end.

makeMinuteBar is the core function that is used to pull data from server, make minute bar, and then fill empty minutes with the closest minute.
Right now it generates open, high, low, close and size.
Note: due to the build in function, if there is no trade in one minute, the size will be the closest one instead of zero.

outputdir is the directory path that you want to save data.

symblist is a local csv file containing the symbols you want. My sample file has a column name of sym.

After you have set all these variables to your own, run the while loop at the bottom.

This program can be used in studio: (download from http://code.kx.com/wiki/StudioForKdb%2B)
or Qstudio: (download from http://www.timestored.com/qstudio/files/setup.exe)