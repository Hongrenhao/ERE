function g = ttest_random_select(KIRC_reference,KIRC_tumor)
gene=zeros(1,size(KIRC_reference,1)); %生成0向量，数目为基因数
a=size(KIRC_reference,2);  %正常组样本数
b=size(KIRC_tumor,2);   %肿瘤组样本数
for l=1:100
    A=randperm(b,a);%%%从tumor随机抽取列
    B=KIRC_tumor(:,A);
for i=1:size(KIRC_reference,1)
    [h,m]=ttest(KIRC_reference(i,:),B(i,:));
    if h==1
        gene(i)=gene(i)+1;% 若显著差异，则基因值+1
    else gene(i)=gene(i);
    end
end
end
g=find(gene==100); %找到100次随机挑选都是显著差异的基因下标,g的长度不一定和gene一致

end

rng(0)
x=randperm(8,4);
y=randperm(8,4);
z=randperm(8,4);
x
y
z
rng(0)
x1=randperm([8:19],4);
y1=randperm(8,4);
z1=randperm(8,4);
x1
y1
z1



