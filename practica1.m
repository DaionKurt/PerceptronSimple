entradas = [0 0 0 0 1 1 1 1;
            0 0 1 1 0 0 1 1;
            0 1 0 1 0 1 0 1];
sal_des =  [0 0 0 1 1 1 1 1];

plotpv(entradas,sal_des);
net = perceptron;
net = train(net,entradas,sal_des);
plotpc(net.IW{1},net.b{1});

prueba = [0.9 0.1 0.4 0.5;
          0.9 0.2 0.3 0.7;
          0.8 0.1 0.5 0.6];
salida2 = sim(net,prueba);
figure();
plotpv(prueba,salida2); 
hold on; plotpc(net.IW{1},net.b{1});
disp('Resultados:');
disp(salida2);
pesos = net.iw{1,1};
bias = net.b{1};
disp('Pesos: ');
disp(pesos);
disp('Bias: ');
disp(bias);

% clc
% entradas = [3 3 3 -1 -1 -1;1 0 -1 1 0 -1];
% sal_des = [0 0 0 1 1 1];
% red = newp(minmax(entradas),1);
% red = train(red,entradas,sal_des);
% pesos = red.iw{1,1};
% bias = red.b{1};
% plotpv(entradas,sal_des);
% hold on; 
% plotpc(pesos,bias);
% 
% prueba = [2 -1; -0.5 -0.5];
% salida2 = sim(red,prueba);
% disp(prueba);
% disp(salida2);
% pesos = red.iw{1,1};
% bias = red.b{1};
% figure();
% plotpv(prueba,salida2);
% hold on; plotpc(pesos,bias);