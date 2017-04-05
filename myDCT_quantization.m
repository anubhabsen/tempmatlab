function output = myDCT_quantization(imDCT, qm, c)

output = round(imDCT ./ (c .* qm));