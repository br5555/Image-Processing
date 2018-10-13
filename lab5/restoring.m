function [restore_img] = restoring(img_blur, psf, pseudo, K)
    hf = fft2(psf,size(img_blur,1),size(img_blur,2));


    if ~pseudo
        restore_img = real(ifft2(fft2(img_blur)./hf));

    else

        hfps = zeros(size(hf,1), size(hf,2));
        for i = 1: size(hf,1)
            for j = 1: size(hf,2)
                if(abs(hf(i,j)) > K)
                    hfps(i,j) = 1./abs(hf(i,j)); 
                else
                    hfps(i,j) = 0;
                end
        end
        end

        restore_img = real(ifft2(fft2(img_blur).*hfps));


    end
end