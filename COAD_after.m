close all;
clear ;
clc

load COADnormal
load COADcase



caseprofile1=COADcase;
controlprofile1=COADnormal;
gene_num=size(controlprofile1,1);


load g11_new 
load g22_new

data_all=[caseprofile1];
reference_data=controlprofile1;

a1=1:72;
a2=73:226;
a3=227:237;
a4=238:265;
a5=266:320;
a6=321:357;
a7=358:419;

stages={a1,a2,a3,a4,a5,a6,a7};
for i=1:length(stages)
    shang_all_time_all_gene(:,stages{i})=jisuan_shang_all_befork_sdensity2(g11,g22,reference_data,caseprofile1(:,stages{i}));   
end 


% shang_all_time_all_gene=jisuan_shang_all_befork_sdensity2(g11,g22,reference_data,caseprofile1);
SNG_size=size(shang_all_time_all_gene);
case_result=zeros(1,SNG_size(2));
for t=1:SNG_size(2)
        [sort_Node_entrop,idx]=sort(shang_all_time_all_gene(:,t),'descend');
        case_result(t)=mean(sort_Node_entrop(1:floor(SNG_size(1)*0.05)));                   %Ñ¡È¡Ç°300ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îªï¿½Åºï¿½Ö¸ï¿½ê£¬ï¿½ï¿½ï¿½Ô¸ï¿½ï¿½ï¿½Êµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿?
end
figure;
plot(1:SNG_size(2),case_result(1:SNG_size(2)),'k-','LineWidth',3);
save('shang_all_time_all_gene_COAD_3','shang_all_time_all_gene')  %3ÊÇ·Ö½×¶ÎÄâºÏ³öÀ´µÄìØÖµ