function [A] = matriz_homogenea(d,a,alpha,theta)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
A = zeros(4,4);
A(1,:) = [cos(theta),-sin(theta)*cos(alpha),sin(theta)*sin(alpha),a*cos(theta)];
A(2,:) = [sin(theta),cos(theta)*cos(alpha),-cos(theta)*sin(alpha),a*sin(theta)];
A(3,:) = [0,sin(alpha),cos(alpha),d];
A(4,:) = [0,0,0,1];
end

