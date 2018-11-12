function out = contrast_sretching(image)
  doubleImage = double(image);

  limits = stretchlim(doubleImage);

  lower = limits(1);
  higher = limits(2);

  minPixel = min(min(doubleImage));
  maxPixel = max(max(doubleImage));

  newImage = (doubleImage - minPixel)*((higher-lower)/(maxPixel-minPixel)) + lower;

  out = newImage;
end
