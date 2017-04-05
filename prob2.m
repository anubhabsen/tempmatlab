I = double(imread('LAKE.TIF'));

image1 = I(45: 52, 420: 427);
image2 = I(298: 305, 427: 434);
image3 = I(230: 237, 30: 37);

qm = [16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99;];

basis = create_mat_dct();

num = 1;
num = myfunct(image1, num, basis, qm);
num = myfunct(image2, num, basis, qm);
num = myfunct(image3, num, basis, qm);

function num = myfunct(im, num, basis, qm)

    dctoutput = myDCT(im, basis);
    quantdctoutput = myDCT_quantization(dctoutput, qm, 2);
    recdeq = myDCT_dequantization(quantdctoutput, qm, 2);
    reconstruct = myIDCT(recdeq, basis);

    subplot(3, 5, num);
    imshow(uint8(im));
    num = num + 1;

    subplot(3, 5, num);
    imshow(uint8(dctoutput));
    num = num + 1;

    subplot(3, 5, num);
    imshow(uint8(quantdctoutput));
    num = num + 1;

    subplot(3, 5, num);
    imshow(uint8(recdeq));
    num = num + 1;

    subplot(3, 5, num);
    imshow(uint8(reconstruct));
    num = num + 1;
end