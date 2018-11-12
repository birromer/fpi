function u = questao2
	% Imagens em escala de cinza
	I = imread('lena_gray.bmp');
	f = figure, subplot(2,3,1), imshow(I), title("Original");
	subplot(2,3,4), imhist(I);

	I2 = contrast_stretching(I);
	subplot(2,3,2), imshow(I2), title("Contrast stretching");
	subplot(2,3,5), imhist(I2);

	I3 = hist_eq2(I);
	subplot(2,3,3), imshow(I3), title("Histogram equalization");
	subplot(2,3,6), imhist(I3);

	% Imagens coloridas
	I = imread('color.jpg');
	f = figure, subplot(2,3,1), imshow(I), title("Original");
	subplot(2,3,4), imhist(I), title("Histograma original");

	hsv = rgb2hsv(I);
	V = hsv(:,:,3);
	hsv(:,:,3) = contrast_stretching(V);
	rgb_Img = hsv2rgb(hsv);
	subplot(2,3,2), imshow(rgb_Img), title("Constrast stretching");
	subplot(2,3,5), imhist(rgb_Img), title("Histograma apos CS");


	hsv(:,:,3) = hist_eq2(V);
	rgb_Img = hsv2rgb(hsv);
	subplot(2,3,3), imshow(rgb_Img), title("Histogram equalization");
	subplot(2,3,6), imhist(rgb_Img), title("Histograma apos HE");
end