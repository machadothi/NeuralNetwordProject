function [int_r,int_g] = alert_sgn_comp(image)

%ESTA FUNÇÃO RETORNA OS VALOR DE INTESIDADE MÁXIMO
%DA COMPONENTO VERMELHA E VERDE

sgn = imread(image);

sgn_red = sgn(:,:,1);
sgn_green = sgn(:,:,2);
sgn_blue = sgn(:,:,3);

[h_sgn_red , x] = imhist(sgn_red);
h_sgn_green = imhist(sgn_green);
h_sgn_blue = imhist(sgn_blue);

[num_p_r,int_r]=max(h_sgn_red(10:end-20));
[num_p_g,int_g]=max(h_sgn_green(10:end-20));
[num_p__b,int_b]=max(h_sgn_blue(10:end-20));

int_r = int_r+10;
int_g = int_g+10;
int_b = int_b+10;
figure(1)
plot(x,h_sgn_red,'red',x,h_sgn_green,'green',x,h_sgn_blue,'blue')

end