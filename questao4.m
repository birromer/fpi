function o = questao4
	% Leitura das imagens:
	image1 = imread('liftingbody.png');
	image2 = imread('cameraman.tif');
	image3 = imread('circuit.tif');

	% Imagens redimensionadas preparadas para ordered ditherings
	i1r = imresize(image1,[512 512]);
	i2r = imresize(image2,[512 512]);
	i3r = imresize(image3,[512 512]);

	% Thresholding com valor de 128:
	thr = 128;
	image1_thr = thresholding(image1, thr);
	image2_thr = thresholding(image2, thr);
	image3_thr = thresholding(image3, thr);

	% Bayer Dispersed dots:
	image1_bayerDD = bayer(i1r);
	image2_bayerDD = bayer(i2r);
	image3_bayerDD = bayer(i3r);

	% Clustered dots:
	image1_bayerCD = clustered(i1r);
	image2_bayerCD = clustered(i2r);
	image3_bayerCD = clustered(i3r);

	% Resultados do thresholding
	figure('NumberTitle', 'off', 'Name', 'Thresholding'), imshowpair(image1, image1_thr, 'montage'), title('Thresholding');
	figure('NumberTitle', 'off', 'Name', 'Thresholding'), imshowpair(image2, image2_thr, 'montage'), title('Thresholding');
	figure('NumberTitle', 'off', 'Name', 'Thresholding'), imshowpair(image3, image3_thr, 'montage'), title('Thresholding');

	% Resultados do bayer dispersed dot:
	figure('NumberTitle', 'off', 'Name', 'Dispersed Dot'), imshowpair(i1r, image1_bayerDD, 'montage'), title('Dispersed Dot');
	figure('NumberTitle', 'off', 'Name', 'Dispersed Dot'), imshowpair(i2r, image2_bayerDD, 'montage'), title('Dispersed Dot');
	figure('NumberTitle', 'off', 'Name', 'Dispersed Dot'), imshowpair(i3r, image3_bayerDD, 'montage'), title('Dispersed Dot');

	% Resultados do bayer clustered dot:
	figure('NumberTitle', 'off', 'Name', 'Clustered Dot'), imshowpair(i1r, image1_bayerCD, 'montage'), title('Clustered Dot');
	figure('NumberTitle', 'off', 'Name', 'Clustered Dot'), imshowpair(i2r, image2_bayerCD, 'montage'), title('Clustered Dot');
	figure('NumberTitle', 'off', 'Name', 'Clustered Dot'), imshowpair(i3r, image3_bayerCD, 'montage'), title('Clustered Dot');

end