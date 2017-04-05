function output = myDCT_dequantization(imDCT, qm, c)

output = round(double(imDCT) .* (double(c) .* double(qm)));

