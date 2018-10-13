function correlation_rotate_rate = correlation_rotate_image(img_obj, img_nat, angle_rot)
    img_obj_rot = imrotate(img_obj, angle_rot);

    correlation_rotate_rate = correlation_image(img_obj_rot, img_nat,1,1);

end