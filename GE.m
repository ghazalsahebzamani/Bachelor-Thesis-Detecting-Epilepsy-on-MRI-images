function [ Q ] = GE( V )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Q=zeros(size(V));
Q(:,1)=V(:,1)./norm(V(:,1));
Q(:,2)=V(:,2)-(Q(:,1)'*V(:,2)).*Q(:,1);
Q(:,2)=Q(:,2)./norm(Q(:,2));
Q(:,3)=V(:,3)-(Q(:,1)'*V(:,3)).*Q(:,1)-(Q(:,2)'*V(:,3)).*Q(:,2);
Q(:,3)=Q(:,3)./norm(Q(:,3));
end