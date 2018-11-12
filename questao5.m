function o = questao5
	f=imread('autumn.tif');

	B= escalaNN(f,2);
	imwrite(B,'autumn2NN.tif');

	B= escalaNN(f,3);
	imwrite(B,'autumn3NN.tif');

	g = escalaIB(f,2);
	imwrite(g,'autumn2IB.tif');

	g=escalaIB(f,3);
	imwrite(g,'autumn3IB.tif');

	f2NN=imread('autumn2NN.tif');
	f3NN=imread('autumn3NN.tif');

	f2IB=imread('autumn2IB.tif');
	f3IB=imread('autumn3IB.tif');

	g=rotacionaIntBilinear(f2NN,5);
	imwrite(g,'autumn5IB.tif');

	g=rotacionaIntBilinear(f3IB,45);
	imwrite(g,'autumn45IB.tif');

	g=rotacionaNN(f3NN,5);
	imwrite(g,'autumn5NN.tif');

	g=rotacionaNN(f2IB,45);
	imwrite(g,'autumn45NN.tif');
end