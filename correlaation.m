
clc
close all
clear all
testdata=dir('E:\final project data\dataclasses\class7\*.jpg');  
traindata=dir('E:\final project data\dataclasses\traindata\*.jpg');
max=[];
 for i=1:length(testdata)
        file1=strcat('E:\final project data\dataclasses\class7\',testdata(i).name);
        test1=imread(file1);
        test=rgb2gray(test1);
        A=[];
        for j=1:length(traindata)
             filename=strcat('E:\final project data\dataclasses\traindata\',traindata(j).name) ;
                 train = imread(filename);
                 train=rgb2gray(train);
                 coeff=corr2(test,train);
                 co=[coeff,j];
                 A=[A;co];

            
        end
             C=A';
            [d1,d2]=sort(C(1,:),'descend');
             B= C(:,d2);
             im_index=B(2,1);
             max=[max;B(1,1)];
             filename=strcat('E:\final project data\dataclasses\traindata\',traindata(im_index).name);
             match=imread(filename);
            figure, imshowpair(test1,match,'montage');
 end
 max=max';
 