function E = my_entropy(im)

    im = uint8(im);
    p = imhist(im);
    p = p ./ sum(p);
    p = p + (p == 0);
    E = -sum(p.*log2(p));

end