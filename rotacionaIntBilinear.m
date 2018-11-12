%Invoca rotacao da matriz f atraves do angulo alfa em graus
function g = rotacionaIntBilinear(f,alfa)
	anguloRad = alfa * pi/180;
	g= transf(f, anguloRad);
	end

	%Devolve matriz B resultante da rotacao da imagem im por um angulo alfa
	%utilizando interpolacao bilinear
	function [B] = transf(f, alfa)

	[m, n, k] = size(f);

	%Define a matriz B pela diagonal de f
	dmax = ceil(sqrt(m^2+n^2));
	B = uint8(ones(dmax,dmax,3));

	for a=1:dmax
		for b=1:dmax

			%calcula coordenadas do ponto da matriz de entrada que correspondem a
			%matriz de saida atraves da rotacao
			i = ((a-dmax/2)*cos(alfa) + (b-dmax/2)*sin(alfa) + m/2);
			j = (-(a-dmax/2)*sin(alfa) + (b-dmax/2)*cos(alfa) + n/2);
			
			
			if ((i >= 1) && (i <= m) && (j >= 1) && (j <= n))
				%seleciona coordenadas inteiras ao redor do ponto
				i1 = floor(i);
				i2 = ceil(i);
				j1 = floor(j);
				j2 = ceil(j);
				
				%calcula pesos de deslocamento em x e y
				dx = i - i1;
				dy = j - j1;
				
				%interpola linearmente em x
				xv1 = f(i1,j1,:)*dx+f(i1,j2,:)*(1-dx);
				xv2 = f(i2,j1,:)*dx+f(i2,j2,:)*(1-dx);
				
				%interpola linearmente em y
				pix = xv1*dy+xv2*(1-dy);
				
				B(a,b,:) = pix;
			end
		end
	end
end

