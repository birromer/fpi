function y = ATMF(I, alpha, tamJanela)
    %calcula numero de pixeis em volta do pixel analisado
    abertura = ((tamJanela-1)/2);
    %obtem tamanho da imagem
    [nLinhas, nColunas, nDim] = size(I); 
    filtrado = I;
    nRemovidos = round(alpha * tamJanela * tamJanela); %calcula numero de valores a serem removidos após ordenação dos valores
    for k = 1 : 3 %iterando pelos tres canais de cores da imagem
        for  i = abertura +1 : nLinhas - abertura %iterando por todos pixeis da imagem que cabem dentro da janela recebida como parametro
            for j = abertura +1 : nColunas - abertura
                %obtem pixeis da janela
                janela = I(i-abertura : i+abertura, j-abertura : j+abertura, k);
                %transforma em um vetor unidimensional
                janela = janela( : )';
                %ordena os valores
                janela = sort(janela);
                %remove os maiores e menores valores de acordo com o alpha oferecido
                janela  = janela(nRemovidos+1 : size(janela,2) - nRemovidos);
                %obtem o novo valor do pixel analisado atraves da media dos valores do vetor resultante
                novoValor = round(mean(janela,2));
                %substitui o valor na imagem filtrada
                filtrado(i,j,k) = novoValor;
            end
        end
    end
    y =  uint8(filtrado);
end