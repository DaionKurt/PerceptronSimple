
Grupo1 = [0.5 0.7 0.8;
          1.4 1.8 1.6];
Grupo2 = [1.5 2.0;
          0.8 1.0];
Grupo3 = [0.3 0.0 -0.3;
          0.5 0.2 0.8];
Grupo4 = [-0.5 -1.5;
          -1.5 -2.2];

plot(Grupo1(1,:),Grupo1(2,:),'bo')
hold on
grid on
plot(Grupo2(1,:),Grupo2(2,:),'r*')
plot(Grupo3(1,:),Grupo3(2,:),'g+')
plot(Grupo4(1,:),Grupo4(2,:),'mx')

text(0,1.5,'Grupo 1')
text(1.5,0,'Grupo 2')
text(-1,0.5,'Grupo 3')
text(0,-1,'Grupo 4')
title('Elementos')
xlabel('P(X)')
ylabel('P(Y)')

a = [0 0]';
b = [0 1]';
c = [1 0]';
d = [1 1]';
P = [Grupo1 Grupo2 Grupo3 Grupo4];
T = [repmat(a,1,length(Grupo1)) repmat(b,1,length(Grupo2)) ...
     repmat(c,1,length(Grupo3)) repmat(d,1,length(Grupo4)) ];
%plotpv(P,T);
net = perceptron;
net = train(net,P,T);
plotpc(net.IW{1},net.b{1});

%Prueba
p = [0.5 0.43 0.5 0.58;
    0.36 0.3 0.26 0.28];
salida2 = sim(net,p);
disp('Resultados: ');
disp(salida2)
pesos = net.iw{1,1};
bias = net.b{1};
disp('Pesos: ');
disp(pesos);
disp('Bias: ');
disp(bias);
figure('Name','Resultados de prueba','NumberTitle','off')
plotpv(p,salida2);
title('Resultados de prueba')
xlabel('P(X)')
ylabel('P(Y)')
hold on; plotpc(pesos,bias);