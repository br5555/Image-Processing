function ene = energijaSignala(img, offset)

    img = im2double(img);
    
    imgFT = fft2(img);
    imgFT = imgFT/(numel(imgFT));
    
    %stavi DC u sredinu
    imgFT = fftshift(imgFT);
    %postavi sredinu u nulu
    imgFT(ceil(end/2), ceil(end/2)) = 0;
    img = abs(ifft2(imgFT));
    
    img_cut1 = img(offset(2)+1 : end, offset(1)+1:end);
    img_cut2 = img(1:end-offset(2), 1:end-offset(1));
    
    [h, ~] = hist3([img_cut1(:), img_cut2(:)]);
    
    p = h/sum(h(:));
    ene = sum(sum(p.*p));
end