function k = HSVim(im)
	img = rgb2hsv(im);
	h = img(:,:,1); % Hue channel
	s = img(:,:,2); % Saturation channel
	v = img(:,:,3); % Value channel

	k = figure; subplot(2,2,1), imshow(img,[]), title('Original')
	subplot(2,2,2), imshow(h,[]), title('Matiz(tonalidade)')
	subplot(2,2,3), imshow(s,[]), title('Saturação')
	subplot(2,2,4) , imshow(v,[]), title('Valor(brilho)')

	figure;
	subplot(3,1,1),imhist(h);
	subplot(3,1,2),imhist(s);
	subplot(3,1,3),imhist(v);

	return;
end