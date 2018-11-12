function out = bayer(im)
	% Tamanho da matriz de thresholding que funcionar� como m�scara
	num=64;
	M=num*num;
	% Itera��es na cria��o de matrizes de Bayer at� o num�ro desejado 
	% Importante ressaltar que este n�mero deve ser igual � num
	B2=[1 2; 3 0];
	B4=[4*B2+1 4*B2+2; 4*B2+3 4*B2+0];
	B8=[4*B4+1 4*B4+2; 4*B4+3 4*B4+0];
	B16=[4*B8+1 4*B8+2; 4*B8+3 4*B8+0];
	B32=[4*B16+1 4*B16+2; 4*B16+3 4*B16+0];
	B64=[4*B32+1 4*B32+2; 4*B32+3 4*B32+0];

	% Matriz de thresholding utilizada como m�scara
	T=round(255*(B64+0.5)/M);
	y=zeros(512,512);

	% Itera��o pela imagem pegando o valor corresponde de T para thresholding
	for i=1:1:512
		for j=1:1:512
			if im(i,j)> T((mod(i,num)+1), (mod(j,num)+1));
					y(i,j)=1;
				else
					y(i,j)=0;
			end
		end
	end
	out = double(y);

end