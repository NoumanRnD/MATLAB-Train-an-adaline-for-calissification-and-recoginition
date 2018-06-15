function [  ] = solution2(  )
clear;
clc;
%Get the data from file
data=open('class.mat');
x=data.s;     %input pattern
t=data.t;     %Target
ts=data.ts;   %Testing pattern
n=15;
m=3;
%Initialize the Weight matrix
w=zeros(n,m);
b=zeros(m,1);
%Intitalize learning rate and threshold value
alpha=1;
theta=0;
%Plot for Input Pattern
figure(1);
k=1;
for i=1:2
    for j=1:4
        charplot(x(k,:),10+(j-1)*10,20-(i-1)*10,5,3);
        k=k+1;
    end  
end
axis([0 55 0 25]);
title('Input Pattern for Training');
con=1;
epoch=0;
while con
    con=0;
    for I=1:8
        for j=1:m
            yin(j)=b(j,1);
            for i=1:n
                yin(j)=yin(j)+w(i,j)*x(I,i);
            end
            if yin(j)>theta
               y(j)=1;
            end
            if yin(j) <=theta & yin(j)>=-theta
               y(j)=0;
            end
            if yin(j)<-theta
               y(j)=-1;
            end
        end        
        if y(1,:)==t(I,:)
            w=w;b=b;
        else
            con=1;
            for j=1:m
                b(j,1)=b(j,1)+alpha*t(I,j);
                for i=1:n
                    w(i,j)=w(i,j)+alpha*t(I,j)*x(I,i);
                end
            end
        end
    end
    epoch=epoch+1;
end
disp('Number of Epochs:');
disp(epoch);
%Testing the network with test pattern
%Plot for test pattern
figure(2);
k=1;
for i=1:2
    for j=1:4
        charplot(ts(k,:),10+(j-1)*10,20-(i-1)*10,5,3);
        k=k+1;
    end  
end
axis([0 55 0 25]);
title('Noisy Input Pattern for Testing');
for I=1:8
    for j=1:m
        yin(j)=b(j,1);
        for i=1:n
            yin(j)=yin(j)+w(i,j)*ts(I,i);
        end
        if yin(j)>theta
            y(j)=1;
        end
        if yin(j) <=theta & yin(j)>=-theta
            y(j)=0;
        end
        if yin(j)<-theta
            y(j)=-1;
        end
    end
    for i=1:8
        if t(i,:)==y(1,:)
            or(I)=i;
        end
    end  
end
%Plot for test output pattern
figure(3);
k=1;
for i=1:2
    for j=1:4
        charplot(x(or(k),:),10+(j-1)*10,20-(i-1)*10,5,3);
        k=k+1;
    end  
end
axis([0 55 0 25]);
title('Classified Output Pattern');







