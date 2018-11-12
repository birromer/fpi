function ImgSaida=hist_eq2(ImgEntrada)
  [M,N]=size(ImgEntrada);
  for i=1:256
    h(i)=sum(sum(ImgEntrada == i-1));
  end;

  ImgSaida=ImgEntrada;
  s=sum(h);
  for i=1:256
    posicoes=find(ImgEntrada==i-1);
    ImgSaida(posicoes)=sum(h(1:i))/s*255;
  end
end
