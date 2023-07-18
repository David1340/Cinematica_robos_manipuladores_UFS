clc
clear
close all

%% comprimentos dos elos
l1 = 10;
l2 = 10;

%% Variáveis do manipulador
q1 = pi/4;
q2 = pi/4;

%% parâmetros de DH
a1 = l1;
a2 = l2;
alpha1 = 0;
alpha2 = 0;
d1 = 0;
d2 = 0;
theta1 = 2*pi*rand(1,1);
theta2 = 2*pi*rand(1,1);

% Matriz de transformações
A1 = matriz_homogenea(d1,a1,alpha1,theta1);
A2 = matriz_homogenea(d2,a2,alpha2,theta2);

T1 = A1;
T2 = T1*A2;


% pontos de interesse
p0_0 = [0;0;0;1];
p1_1 = [0;0;0;1];
p2_2 = [0;0;0;1];


p1_0 = T1*p1_1;
p2_0 = T2*p2_2;

%Plot do manipulador

plot([p0_0(1),p1_0(1),p2_0(1)]...
  ,[p0_0(2),p1_0(2),p2_0(2)]);

hold on
grid on
scatter([p0_0(1),p1_0(1),p2_0(1)]...
  ,[p0_0(2),p1_0(2),p2_0(2)]);