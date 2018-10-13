function rez = entropija(ulaz)


for i=1:size(ulaz,2)
       [h,~]=imhist(ulaz(:,i));
       p_u=h/sum(h);
       log2_pu=log2(p_u);
       for j=1:size(log2_pu,1)
            if log2_pu(j) == -inf
                log2_pu(j) =0;
            end
       end
       rez(1,i)=(-sum(sum(p_u.*log2_pu)));
end
end