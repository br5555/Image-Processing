function img_with_rect = plot_rect_on_image(S1, S2, mi, mj)
    figure();

    imshow(imrotate(S2,0));colormap(gray);
    hold on;
    img_with_rect =rectangle('Position',[mj, mi, size(S1,2) ,size(S1, 1)],'EdgeColor','r');
    hold off;
    
end