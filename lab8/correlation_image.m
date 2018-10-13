function correlation_rate= correlation_image(img_obj, img_nat, x, y)
    height_img = size(img_nat,1);
    width_img = size(img_nat,2);

    delta_h = size(img_obj,1);
    delta_w = size(img_obj,2);
    num_elems = (delta_h)*(delta_w);

    if (delta_h + y > height_img)
        delta_h = height_img - y;
        if(delta_h <= 0)
            
            correlation_rate = 0;
            return;
        end
    end

    if (delta_w + x > width_img)
        delta_w = width_img - x;
        if(delta_w <= 0)
            
            correlation_rate = 0;
            return;
        end
    end
    img1_cut = img_obj(1:delta_h, 1:delta_w);
    img2_cut = img_nat(1+y:y+delta_h, 1+x:x+delta_w);
    
    
    correlation_rate = corr2(img1_cut,img2_cut)/num_elems;
    if isnan(correlation_rate)
        correlation_rate = 0;
    end

end