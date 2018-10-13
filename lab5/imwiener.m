function [restore_img] = imwiener(img_blur ,psf,  K)

    hf = fft2(psf,size(img_blur,1),size(img_blur,2));

    if(size(K,1)==1 && size(K,2)==1)
        K = K*ones(size(hf,1),size(hf,2));
    end
    

        h_weiner = zeros(size(hf,1), size(hf,2));
        for i = 1: size(hf,1)
            for j = 1: size(hf,2)
              h_weiner(i,j) = (hf(i,j)^2)/( hf(i,j)^2 + K(i,j));  
            end
        end
        h_weiner = h_weiner.*(1./hf);

        restore_img = real(ifft2(fft2(img_blur).*h_weiner));


    
end