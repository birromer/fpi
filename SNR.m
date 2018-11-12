function snr = SNR(I1, I2)
    I1 = double(I1);
    I2 = double(I2);
    snr = [0,0,0];
    for k = 1:3
        %seleciona canal
        I1k = I1(:,:,k);
        I2k = I2(:,:,k);
        %calcula variância da imagem original
        V1 = std2(I1k);
        %calcula variância do ruido
        V2 = std2(I1k - I2k);
        %retorna snr
        snr(k) = 10 * log10(V1^2 / V2^2);
    end
    snr = mean(snr);
end