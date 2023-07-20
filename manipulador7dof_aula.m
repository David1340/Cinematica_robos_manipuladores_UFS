clc
clear
close all

%% comprimentos dos elos
ef = 0.2;
L = [0.075,0.075,0.075,0.075,0.075,0.075,0.075];
%% Variáveis do manipulador
q = zeros(7,1);
q(2) = pi/4;
q(4) = pi/4;
q(6) = pi/4;
q(7) = pi/4;
%q = 2*pi*rand(7,1);
%% parâmetros de DH
a = [0,0,0,0,0,L(6),L(7)];
alpha = [pi/2,-pi/2,pi/2,-pi/2,pi/2,pi/2,0];
d = [L(1),0,L(2) + L(3),0,L(4) + L(5),0,0];
theta = [pi/2 + q(1),q(2),q(3),q(4),q(5),pi/2 + q(6),q(7)];

% Matriz de transformações
A1 = matriz_homogenea(d(1),a(1),alpha(1),theta(1));
A2 = matriz_homogenea(d(2),a(2),alpha(2),theta(2));
A3 = matriz_homogenea(d(3),a(3),alpha(3),theta(3));
A4 = matriz_homogenea(d(4),a(4),alpha(4),theta(4));
A5 = matriz_homogenea(d(5),a(5),alpha(5),theta(5));
A6 = matriz_homogenea(d(6),a(6),alpha(6),theta(6));
A7 = matriz_homogenea(d(7),a(7),alpha(7),theta(7));

T1 = A1;
T2 = T1*A2;
T3 = T2*A3;
T4 = T3*A4;
T5 = T4*A5;
T6 = T5*A6;
T7 = T6*A7;

% pontos de interesse
p0_0 = [0;0;0;1];
p1_1 = [0;0;0;1];
p2_2 = [0;0;L(2);1];
p3_3 = [0;0;0;1];
p4_4 = [0;0;L(4);1];
p5_5 = [0;0;0;1];
p6_6 = [0;0;0;1];
p7_7 = [0;0;0;1];

%pe1_3 = [0;ef;ef;1];
%pe2_3 = [0,0,ef,1]';
%pe3_3 = [0,0,-ef,1]';
%pe4_3 = [0,ef,-ef,1]';

%pe1_0 = T3*pe1_3;
%pe2_0 = T3*pe2_3;
%pe3_0 = T3*pe3_3;
%pe4_0 = T3*pe4_3;

p1_0 = T1*p1_1;
p2_0 = T2*p2_2;
p3_0 = T3*p3_3;
p4_0 = T4*p4_4;
p5_0 = T5*p5_5;
p6_0 = T6*p6_6;
p7_0 = T7*p7_7;

%Plot do manipulador

plot3([p0_0(1),p1_0(1),p2_0(1),p3_0(1),...
  p4_0(1),p5_0(1),p6_0(1),p7_0(1)]...
  ,[p0_0(2),p1_0(2),p2_0(2),p3_0(2),...
  p4_0(2),p5_0(2),p6_0(2),p7_0(2)]...
  ,[p0_0(3),p1_0(3),p2_0(3),p3_0(3),...
  p4_0(3),p5_0(3),p6_0(3),p7_0(3)],'-*','markersize',5);

hold on
  
%plot3([pe1_0(1),pe2_0(1),pe3_0(1),pe4_0(1)]...
%  ,[pe1_0(2),pe2_0(2),pe3_0(2),pe4_0(2)]...
% ,[pe1_0(3),pe2_0(3),pe3_0(3),pe4_0(3)])
  
grid on
xlabel('x')
ylabel('y')
zlabel('z')
axis equal