function  ImgSuavizada = filtgauss(x,y,sigma,nomeImagem)
    % x e y sao tamanho da janela, sigma é o desvio
    ImgOriginal = imread(nomeImagem);
    ImgSuavizada = zeros(size(ImgOriginal));
    I = double(ImgOriginal);
    boxSize = x*y;
    wcol = (ceil(-x/2):floor(x/2));
    wlin = (ceil(-y/2):floor(y/2));
    [X,Y] = meshgrid(wlin, wcol);
    kernel = exp((-1)*(X.^2 - Y.^2)/2*((sigma)^2)) / 2*pi*((sigma)^2);
    Img=padarray(I, [floor(x/2) floor(y/2)]);
    for k = 1 : 3
        for i = 1 : size(Img,1) - (size(kernel,1) -1)
         	for j = 1 : size(Img,2) - (size(kernel,2) -1)
            	soma=0;
                for ki = 0 : size(kernel,1)-1
                    for kj = 0 : size(kernel,2)-1
                        conv = Img(i+ki, j+kj, k) * kernel(ki+1,kj+1);
                        soma = (soma+conv);
                    end
                end
                ImgSuavizada(i,j,k) = soma/boxSize; 
            end
        end
    end
    ImgSuavizada = uint8(ImgSuavizada);
end