function [image_out]=clustered(im)

im = im2double(im);
% Matriz para utilização de Clustered Dot
clusterMatrix= [24 10 12 26 35 47 49 37;
                08 00 02 14 45 59 61 51;
                22 06 04 16 43 57 63 53;
                30 20 18 28 33 41 55 39;
                34 46 48 36 25 11 13 27;
                44 58 60 50 09 01 03 15;
                42 56 62 52 23 07 05 17;
                32 40 54 38 31 21 19 29;]/64;

% Faz com que a máscara tenha o mesmo tamanho da imagem (512x512)
mask = repmat(clusterMatrix,64,64);
image_out = double(im>mask);

end