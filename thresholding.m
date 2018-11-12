function image_out = thresholding(im, tvalue)
    
    % Itera por todos os elementos da matriz
    for i = 1:numel(im)
        % se o valor do pixel for maior que o valor de thresholding 
        % passado, ele vira preto
        if im(i) > tvalue
            im(i) = 1;
        % se n�o, vira branco
        else
            im(i) = 0;
        end
    end
    
    % o double � necess�rio para dizer que a imagem � do tipo 2 bits
    image_out = double(im);
end