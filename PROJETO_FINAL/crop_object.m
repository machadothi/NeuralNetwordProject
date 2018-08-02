function [I_cropped] = crop_object(I)
    %LEITURA DO ARQUIVO E EXTRAÇÃO DO PRIMEIRO QUADRANTE DA IMAGEM
    Im = imread(I);
    Im = imcrop(Im,[size(Im(:,:,1),2)/2 0 size(Im(:,:,1),2)/2 size(Im(:,:,1),1)/2]);
    
    %EXTRACÃO DA COMPONENTE VERMELHA
    rmat=Im(:,:,1);
    
    %CONVERTING TO B&W
    levelr = 0.45;
    i1=im2bw(rmat,levelr);
    
    %PREENCHIMENTO DOS BURACOS
    I_stop = imfill(i1,'holes'); %to stop signs
    
    Icomp = imcomplement(i1); %PARA PLACAS VERDES
    I_green = imfill(Icomp,'holes');%PARA PLACAS VERDES
    
    %PREENCHIMENTO DOS BURACOS RESTANTES COM DISCOS
    %PARA REDUÇÃO DE RUÍDOS
    se_stop = strel('disk', 30);
    se_green = strel('disk', 25);   
    
    Io_stop = imopen(I_stop,se_stop);
    Io_green = imopen(I_green,se_green);
    
    [labeled_stop,numObjects_stop] = bwlabel(Io_stop,4);
    [labeled_green,numObjects_green] = bwlabel(Io_green,4);
    
    stats_stop = regionprops(labeled_stop,'BoundingBox');
    stats_green = regionprops(labeled_green,'BoundingBox');
    
    I_stop_cropped=imcrop(Im,stats_stop.BoundingBox);
    I_green_cropped=imcrop(Im,stats_green.BoundingBox);
    
    %ESSE TRECHO RETORNA O MELHOR RESULTADO, OU SEJA
    %A MENOR IMAGEM PRODUZIDA A PARTIR DA UTILIZAÇÃO DO COMPLEMENTO
    % OU NÃO
    if(size(I_stop_cropped,1)<size(I_green_cropped,1))
        figure, imshow(I_stop_cropped)
        I_cropped=I_stop_cropped;
    else
        figure, imshow(I_green_cropped)
        I_cropped=I_green_cropped;
    end
end