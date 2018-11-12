function psnr = PSNR(I1, I2)
    I1 = double(I1);
    I2 = double(I2);
    psnr = [0,0,0];
    for k = 1:3 %itera pelos 3 canais de cor
        %seleciona canal
        I1k = I1(:,:,k);
        I2k = I2(:,:,k);
        %calcula numerador do calculo do psnr com maiores e menores valores da imagem orignal
        A = (max(max(I1k))) - (min(min(I1k)));
        %calcula variância do ruido
        V2 = std2(I1k - I2k);
        %retorna psnr
        psnr(k) = 10 * log10(A^2 / V2^2);
    end
    psnr = mean(psnr);
end