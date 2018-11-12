function [snr1, snr2, psnr1, psnr2] = questao3a(nome1, nome2)
    %le as imagens parametros
    I1 = imread(nome1);
    I2 = imread(nome2);

    %aplica ruido sal e pimenta nas imagens
    SaP1 = imnoise(I1, 'salt & pepper',  0.1);
    SaP2 = imnoise(I2, 'salt & pepper',  0.2);

    %aplica ruido gaussiano nas imagens
    SG1 = imnoise(SaP1, 'gaussian',  0.1);
    SG2 = imnoise(SaP2, 'gaussian', 0.02);
    %figure, imshow(SG1)
    %imsave
    %figure, imshow(SG2)
    %imsave
    
    %aplica filtro alpha trimmed mean
    AT1= ATMF(SG1, 0.25, 3);
    AT2= ATMF(SG2, 0.25, 3);
    %figure, imshow(AT1)
    %imsave
    %figure, imshow(AT2)
    %imsave
    
    %testa ruido com SNR
    snr1 = SNR(I1, AT1);
    snr2 = SNR(I2, AT2);
    
    %testa ruido com PSNR 
    psnr1 = PSNR(I1, AT1);
    psnr2 = PSNR(I2, AT2);
    
    figure, subplot(2,2,1), imshow(I1), title('Original')
    legendaRuidosa1 = compose(['SNR = ', num2str(SNR(I1,SG1)), '\n', 'PSNR = ', num2str(PSNR(I1,SG1))]);
    subplot(2,2,2), imshow(SG1), title('Ruidosa (0.1 e 0.01)'), xlabel(legendaRuidosa1)
    legendaFiltrada1 = compose(['SNR = ', num2str(snr1), '\nPSNR = ', num2str(psnr1)]);
    subplot(2,2,3), imshow(AT1), title('Filtrada'), xlabel(legendaFiltrada1)
    %imsave
    
    figure, subplot(2,2,1), imshow(I2), title('Original')
    legendaRuidosa2 = compose(['SNR = ', num2str(SNR(I2,SG2)), '\n', 'PSNR = ', num2str(PSNR(I2,SG2))]);
    subplot(2,2,2), imshow(SG2), title('Ruidosa (0.2 e 0.02)'), xlabel(legendaRuidosa2)
    legendaFiltrada2 = compose(['SNR = ', num2str(snr2), '\nPSNR = ', num2str(psnr2)]);
    subplot(2,2,3), imshow(AT2), title('Filtrada'), xlabel(legendaFiltrada2)
    %imsave
end

