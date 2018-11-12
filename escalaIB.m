%Devolve matriz B resultante do escalamento da imagem im por um escalar s
%utilizando interpolacao bilinear
function [B] = escalaIB(im, s)
	[m,n,k] = size(im);
	a = m*s;
	b = n*s;

	for i=1:a
		for j=1:b
			%posicoes dos vertices a serem interpolados da matriz de entrada
			pos1 = max(1,ceil(i/s));
			pos2 = min(m,ceil(i/s)+1);
			pos3 = max(1,ceil(j/s));
			pos4 = min(n,ceil(j/s)+1);
			
			%valor dos vertices
			x1 = im(pos1,pos3,:);
			x2 = im(pos1,pos4,:);
			x3 = im(pos2,pos3,:);
			x4 = im(pos2,pos4,:);

		   %pesos definidos deslocamento de x e y dentro do bloco delimitado
		   %pelos vertices da interpolacao
			deslocx1 = (pos3*s - j)/(s+1);
			deslocx2 = 1-deslocx1;
			deslocy1 = (pos1*s - i)/(s+1);
			deslocy2 = 1-deslocy1;

			%interpolacao linear em x
			xv1 = x1*deslocx1+ x2*deslocx2;
			xv2 = x3*deslocx1+ x4*deslocx2; 

			%interpolacao linear em y
			pix = xv1*deslocy1+xv2*deslocy2;

			B(i,j,:) = pix;
			
		end
	end

end