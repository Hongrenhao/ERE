function [g1,g2]=find_nonzero(data)
num=0;
for i=1:size(data,1)
    for j=i+1:size(data,1)
        if data(i,j)~=0
            num=num+1;
            g1(num,1)=i;
            g2(num,1)=j;
        end
    end
end
end