clc
clear
close all

%% comprimentos dos elos
ef = 0.2;
l1 = 2;
l2 = 2;
l3 = 0.5;

%% Variáveis do manipulador
q1 = 0;
q2 = pi/4;
q3 = pi/2;

%% parâmetros de DH
a1 = 0;
a2 = 0;
a3 = 0;
alpha1 = pi/2;
alpha2 = pi/2;
alpha3 = pi/2;
d1 = l1;
d2 = 0;
d3 = l2+l3;
theta1 = pi/2 + q1;
theta2 = pi/2 + q2;
theta3 = pi/2 + q3;

% Matriz de transformações
A1 = matriz_homogenea(d1,a1,alpha1,theta1);
A2 = matriz_homogenea(d2,a2,alpha2,theta2);
A3 = matriz_homogenea(d3,a3,alpha3,theta3);

T1 = A1;
T2 = T1*A2;
T3 = T2*A3;

% pontos de interesse
p0_0 = [0;0;0;1];
p1_1 = [0;0;0;1];
p2_2 = [0;0;l2;1];
p3_3 = [0;0;0;1];

pe1_3 = [0;ef;ef;1];
pe2_3 = [0,0,ef,1]';
pe3_3 = [0,0,-ef,1]';
pe4_3 = [0,ef,-ef,1]';

pe1_0 = T3*pe1_3;
pe2_0 = T3*pe2_3;
pe3_0 = T3*pe3_3;
pe4_0 = T3*pe4_3;

p1_0 = T1*p1_1;
p2_0 = T2*p2_2;
p3_0 = T3*p3_3;

%Plot do manipulador

plot3([p0_0(1),p1_0(1),p2_0(1),p3_0(1)]...
  ,[p0_0(2),p1_0(2),p2_0(2),p3_0(2)]...
  ,[p0_0(3),p1_0(3),p2_0(3),p3_0(3)],'.-','markersize',30);

hold on
  
plot3([pe1_0(1),pe2_0(1),pe3_0(1),pe4_0(1)]...
  ,[pe1_0(2),pe2_0(2),pe3_0(2),pe4_0(2)]...
 ,[pe1_0(3),pe2_0(3),pe3_0(3),pe4_0(3)])
  
hold on
grid on
xlabel('x')
ylabel('y')
zlabel('z')
axis equal