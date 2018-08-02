clear;clc;close all

%CADA PONTO CORRESPONDE A [TIPO MAX_RED MAX_GREEN]

data = [0 30 104;0 21 104 ;0 137 153 ;1	247	21;...
    1 183 50 ;1 159 32; 1 172 245; 1	203	58 ;0	35	185];
%data = data./255;

%   O   TIPO DA PLACA
%  / \  w1, w2, b
% O   O MAX_R, MAX_G

w1 = rand;
w2 = rand;
b = rand;

% treinando a rede neural

learning_rate = 0.3;

for i = 1:10000
    rnd_idx = round(randi([1 length(data)],1)); 
    test_p = data(rnd_idx,:)/10;
    x = w1*test_p(2) + w2*test_p(3) + b;
    predic = sigmf(x,[1,0])
    data(rnd_idx,:)
    target = test_p(1)*1sig0;
    cost = (predic - target)^2;
    
    dcost_dpredic = 2*(predic - target);
    dpredic_dx = sigmf(x,[1,0])*(1-sigmf(x,[1,0]));
    dx_dw1 = test_p(2);
    dx_dw2 = test_p(3);
    dx_db = 1;
    
    dcost_dw1 = dcost_dpredic * dpredic_dx * dx_dw1;
    dcost_dw2 = dcost_dpredic * dpredic_dx * dx_dw2;
    dcost_db = dcost_dpredic * dpredic_dx * dx_db;
    
    w1 = w1 - learning_rate*dcost_dw1;
    w2 = w2 - learning_rate*dcost_dw2;
    b = b - learning_rate*dcost_db;
    
end