function i = RGBim(im)
	img = im;
	r = img(:,:,1); % Red channel
	g = img(:,:,2); % Green channel
	b = img(:,:,3); % Blue channel
	a = zeros(size(img, 1), size(img, 2));

	jr = cat(3, r, a, a);
	jg = cat(3, a, g, a);
	jb = cat(3, a, a, b);

	i = figure; subplot(2,2,1), imshow(img), title('Original')
	subplot(2,2,2), imshow(jr), title('Camada vermelha')
	subplot(2,2,3), imshow(jg), title('Camada verde')
	subplot(2,2,4) , imshow(jb), title('Camada azul')

	figure;
	subplot(3,1,1),imhist(r);
	subplot(3,1,2),imhist(g);
	subplot(3,1,3),imhist(b);
	return;
end