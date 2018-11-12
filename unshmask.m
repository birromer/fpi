function unshMask(x,y,sigma,nomeImagem)
    %imagem original
    imgOriginal = imread(nomeImagem);
    figure, imshow(imgOriginal);
    imsave
    %imagem borrada com o filtro Gaussiano
    imgSuavizada = filtgauss(x,y,sigma,nomeImagem);
    figure, imshow(imgSuavizada);
    imsave
    imgSharp = zeros(size(imgOriginal));    
    for k = 1 : 3
        for i = 1 : size(imgOriginal,1)
            for j = 1 : size(imgOriginal,2)
                imgUnsharp(i,j,k)=imgOriginal(i,j,k)-imgSuavizada(i,j,k);
                imgSharp(i,j,k) = imgOriginal(i,j,k) + imgUnsharp(i,j,k);
            end
        end
    end
    %imagem para visualização dos contornos
    imgUnsharp = uint8(imgUnsharp);
    figure, imshow(imgUnsharp);
    imsave
    %imagem final contrastada
    imgSharp = uint8(imgSharp);
    figure, imshow(imgSharp);
    imsave
end
