function [ m ] = my_mean( img)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
a=histogram(img,256);
%close all
bin=a.BinEdges + a.BinWidth/2;
bin(1,1)=0;
bin=bin(1:size(bin,2)-1);
p=a.Values;
p=p/(sum(p)-p(1,1));
m=p.*bin;
m=sum(m);
%close all
end
