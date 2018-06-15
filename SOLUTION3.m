clc;
clear;
%Get Input Pattern from file
data=open('comp.mat');
x=data.x;
t=data.t;
%Input,Hidden and Output layer definition
n=63;
m=63;
h=24;
%Initialize weights and bias
v=rand(63,24) - (0.5);
v1=zeros(n,h);
b1=rand(1,h)—0.5;
b2=rand(1,m)—0.5;
w=rand(h,m)—0.5;
w1=zeros(h,m);
alpha=0.4;
mf=0.3;
con=1;
epoch=0;
while con
    e=0;
    for I=1:10
        %Feed forward
        for j=1:h
            zin(j)=b1(j);
            for i=1:n
                zin(j)=zin(j)+x(I,i)*v(i,j);
            end
            z(j)=bipsig(zin(j));
        end
        for k=1:m
            yin(k)=b2(k);
        for j=1:h
                yin(k)=yin(k)+z(j)*w(j,k);
            end
            y(k)=bipsig(yin(k));
            ty(I,k)=y(k);
        end
        %Backpropagation of Error
        for k=1:m
            delk(k)=(t(I,k)-y(k))*bipsig1(yin(k));
        end
        for j=1:h
            for k=1:m
        			delw(j,k)=alpha*delk(k)*z(j)+mf*(w(j,k)—w1(j,k));
         			delinj(j)=delk(k)*w(j,k);
            end
        end
        delb2=alpha*delk;        
        for j=1:h
            delj(j)=delinj(j)*bipsig1(zin(j));
        end
        for j=1:h
            for i=1:n
                delv(i,j)=alpha*delj(j)*x(I,i)+mf*(v(i,j)–v1(i,j));
            end
        end
        delb1=alpha*delj;
        w1=w;
        v1=v;
        %Weight updation
        w=w+delw;
        b2=b2+delb2;
        v=v+delv;
        b1=b1+delb1;
        for k=1:k
       e=e+(t(I,k)—y(k))^2;
    end
    end
    if e<0.005
        con=0;
    end
    epoch=epoch+1;
    if epoch==30
        con=0;
    end
    xl(epoch)=epoch;
    yl(epoch)=e;
end
disp('Total Epoch Performed');
disp(epoch);
disp('Error');
disp(e);
figure(1);
k=1;
for i=1:2
  for j=1:5
        charplot(x(k,:),10+(j–1)*15,30–(i–1)*15,9,7);
        k=k+1;
    end  
end
title('Input Pattern for Compression');
axis([0 90 0 40]);
figure(2);
plot(xl,yl);
xlabel('Epoch Number');
ylabel('Error');
title('Conversion of Net');
%Output of Net after training
for I=1:10
    for j=1:h
        zin(j)=b1(j);
        for i=1:n
            zin(j)=zin(j)+x(I,i)*v(i,j);
        end
        z(j)=bipsig(zin(j));
    end
    for k=1:m
        yin(k)=b2(k);
        for j=1:h
            yin(k)=yin(k)+z(j)*w(j,k);
        end
        y(k)=bipsig(yin(k));
        ty(I,k)=y(k);
    end
end
for i=1:10
    for j=1:63
        if ty(i,j)>=0.8
            tx(i,j)=1;
        else if ty(i,j)<=-0.8
                tx(i,j)=–1;
            else
                tx(i,j)=0;
            end
        end
    end
end
figure(3);
k=1;
for i=1:2
    for j=1:5
        charplot(tx(k,:),10+(j–1)*15,30-(i–1)*15,9,7);
        k=k+1;
    end  
end
axis([0 90 0 40]);
title('Decompressed Pattern');
 
%Plot character
function charplot(x,xs,ys,row,col)
k=1;
for i=1:row
    for j=1:col
        xl(i,j)=x(k);
        k=k+1;
    end
end
for i=1:row
    for j=1:col
        if xl(i,j)==1
            plot(j+xs–1,ys–i+1,'k*');
            hold on
        else
            plot(j+xs–1,ys–i+1,'r');
            hold on
        end
    end
end
function y=bipsig(x)
y=2/(1+exp(-x))–1;
function y=bipsig1(x)
y=1/2*(1-bipsig(x))*(1+bipsig(x));
