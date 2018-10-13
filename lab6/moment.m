function rez = moment(img,n)

for i=1:size(img,2)
    [h,x] = imhist(img(:,i));
    p = h./sum(h);
    if n == 1
            rez(1,i)= sum(p.*x);
    elseif n == 2
            e = sum(p.*x);
            rez(1,i)= sum(p.*(x-e).^2);
    else
            e = sum(p.*x);
            v = sum(p.*(x-e).^2);
            rez(1,i) = (sqrt(v))^(-n)*sum(p.*(x-e).^n);
        
     end
end

end