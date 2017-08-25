clc;
clear all;
close all;
A=[];
fol=dir('E:\final project data\pca\16\*.jpg');  
for i=1:length(fol)
    file1=strcat('E:\final project data\pca\16\',fol(i).name);
        Data=imread(file1);
        Data_gray=rgb2gray(Data);
        Data_grayD=im2double(Data_gray);
        Data_mean=mean(Data_grayD);
        [a ,b]=size(Data_gray);
        Data_meanNew=repmat(Data_mean,a,1);
        DataAdjust=Data_grayD-Data_meanNew;
        cov_data=cov(DataAdjust);
        D1=eig(cov_data)
        d2=D1';
        D2=sort(d2,'descend');
        feature_vector=D2(1:35);
       
      A=[A;feature_vector];
end
%xlswrite('traindata_30.xlsx',A);


        
