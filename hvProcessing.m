function output=hvProcessing(Rimg,len,row,column,flag1,flag2)

tempimg=horizon(Rimg,len,row,column,flag1,flag2);
output=vertical(tempimg,len,row,column,flag1,flag2);