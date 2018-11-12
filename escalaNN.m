%Devolve matriz B resultante do escalamento da imagem im por um escalar s utilizando interpolacao de nearest
%neighbor
function [B] = escalaNN(im, s)
	[m,n,k] = size(im);
	a = m*s;
	b = n*s;

	for i=1:a
		for j=1:b
			%coordenada i fracionaria eh mapeada para o inteiro mais proximo
			if(i/s)-floor(i/s)>=0.5
				u = min(n,ceil(i/s));
			else
				u = max(1,floor(i/s));
			end			
			%coordenada j analoga a coordenada i
			if(j/s)-floor(j/s)>=0.5
				v = min(n,ceil(j/s));
			else
				v = max(1,floor(j/s));
			end
			
			%Elemento B(i,j)
		   B(i,j,:) = im(u,v,:);
		end
	end
end