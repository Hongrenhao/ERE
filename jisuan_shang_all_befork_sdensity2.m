function shang=jisuan_shang_all_befork_sdensity2(g1,g2,reference_data,data)
% a=size(data,2);
% k1=sqrt((a-1)/a);
for i=1:size(g1,1)
    p_reference1(i,:)= ksdensity(reference_data(g1(i),:),reference_data(g1(i),:));
    p_reference2(i,:)= ksdensity(reference_data(g2(i),:),reference_data(g2(i),:));
    p1(i,:) = ksdensity(data(g1(i),:),data(g1(i),:));
    p2(i,:) = ksdensity(data(g2(i),:),data(g2(i),:));
end
he1=sum(p_reference1,2);
he2=sum(p_reference2,2);
he11=sum(p1,2);
he21=sum(p2,2);
for i=1:size(p_reference1,1)
    for j=1:size(p_reference1,2)        
        p_reference1(i,j)=p_reference1(i,j)/he1(i);
        p_reference2(i,j)=p_reference2(i,j)/he2(i);
    end
end
 for i=1:size(p1,1)
    for j=1:size(p1,2)        
        p1(i,j)=p1(i,j)/he11(i);
        p2(i,j)=p2(i,j)/he21(i);
    end
 end
for i1=1:size(g1)
    for j1=1:size(p2,2)
        w=zeros(1,1);
        for k=1:size(p_reference1,2)
            v=p_reference1(i1,k)*log(p_reference1(i1,k)/p2(i1,j1));
            w=w+v;
        end
        shang1(i1,j1)=w;%%%%%%%%%%���ɶԳƵ�
    end
end
for i1=1:size(g1)
    for j1=1:size(p1,2)
        w=zeros(1,1);
        for k=1:size(p_reference2,2)
            v=p_reference2(i1,k)*log(p_reference2(i1,k)/p1(i1,j1));
            %w=w+v*1/k1;
            w=w+v;
        end
%         if w==inf
%             w=1000;
%         end
        shang2(i1,j1)=w;%%%%%%%%%%���ɶԳƵ�
    end
end
shang=(shang1+shang2)/2;

end

