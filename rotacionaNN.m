%Invoca rotacao da matriz f atraves do angulo alfa em graus
function g = rotacionaNN(f,alfa)
	anguloRad = alfa * pi/180;
	g= transf(f, anguloRad);
	end


	%Devolve matriz B resultante da rotacao da imagem im por um angulo alfa
	%utilizando interpolacao de neares neighbor
	function [B] = transf(f, alfa)

	[m, n, k] = size(f);

	%Define a matriz B de saida pela diagonal de f
	dmax = ceil(sqrt(m^2+n^2));
	B = uint8(ones(dmax,dmax,3));


	for a=1:dmax
		for b=1:dmax
			
			%calcula coordenada da matriz de entrada correspondente a
			%coordenada da matriz de saida e arredonda para o vizinho inteiro
			%mais proximo
			i = round((a-dmax/2)*cos(alfa) + (b-dmax/2)*sin(alfa) + m/2);
			j = round(-(a-dmax/2)*sin(alfa) + (b-dmax/2)*cos(alfa) + n/2);
			
			if ((i > 0) && (i <= m) && (j > 0) && (j <= n))
				B(a,b,:)=f(i,j,:);
			end
		end
	end

end


