function g = ttest_random_select(KIRC_reference,KIRC_tumor)
gene=zeros(1,size(KIRC_reference,1)); %����0��������ĿΪ������
a=size(KIRC_reference,2);  %������������
b=size(KIRC_tumor,2);   %������������
for l=1:100
    A=randperm(b,a);%%%��tumor�����ȡ��
    B=KIRC_tumor(:,A);
for i=1:size(KIRC_reference,1)
    [h,m]=ttest(KIRC_reference(i,:),B(i,:));
    if h==1
        gene(i)=gene(i)+1;% ���������죬�����ֵ+1
    else gene(i)=gene(i);
    end
end
end
g=find(gene==100); %�ҵ�100�������ѡ������������Ļ����±�,g�ĳ��Ȳ�һ����geneһ��

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



