I = double(imread('LAKE.TIF'));

basis = create_mat_dct();
qm = [16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62;
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 104 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 112 100 103 99;
];

entrops = [];
c = linspace(1, 10, 10);
entr = [];
rms = [];

for val = c

    temp = [];
    i = 1;
    while( i <= 512 )
        j = 1;
        while( j <= 512 )
            imcrop = I(i: i + 7, j: j + 7);
            dctoutput = myDCT(imcrop, basis);
            quantdctoutput = myDCT_quantization(myDCT(imcrop, basis), qm, val);
            recdeq = myDCT_dequantization(quantdctoutput, qm, val);
            reconstruct = myIDCT(recdeq, basis);
            temp(i: i + 7, j: j + 7) = reconstruct;
            j = j + 8;
        end
        i = i + 8;
    end

    enttemp = My_entropy(temp);
    rmstemp = RMSE(I, temp);
    rms = [rms rmstemp];
    entrops = [entrops enttemp];
    entr = [entr entropy(temp)];
end

figure
plot(rms, entrops);
xlabel('rmse');
ylabel('entropy');
