function [ SQ ] = my_skewness( img,m )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
a=histogram(img,256);
bin=a.BinEdges + a.BinWidth/2;
bin(1,1)=0;
bin=bin(1:size(bin,2)-1);
p=a.Values;
p=p/(sum(p)-p(1,1));
SQ=((bin-m).^3).*p;
SQ=sum(SQ);
close all
end

