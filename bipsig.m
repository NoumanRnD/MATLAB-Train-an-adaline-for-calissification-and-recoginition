 
function y=bipsig(x)
y=2/(1+exp(-x))-1;
function y=bipsig1(x)
y=1/2*(1-bipsig(x))*(1+bipsig(x));
 clc;
clear;
%Initialize weights and bias
v=[0.197 0.3191 -0.1448 0.3394;0.3099 0.1904 -0.0347 -0.4861];
v1=zeros(2,4);
b1=[-0.3378 0.2771 0.2859 -0.3329];
b2=-0.1401;
w=[0.4919;-0.2913;-0.3979;0.3581];
w1=zeros(4,1);
x=[1 1 -1 -1;1 -1 1 -1];
t=[-1 1 1 -1];
alpha=0.02;
mf=0.9;
con=1;
epoch=0;
while con
    e=0;
    for I=1:4
        %Feed forward
        for j=1:4
            zin(j)=b1(j);
            for i=1:2
                zin(j)=zin(j)+x(i,I)*v(i,j);
         end
            z(j)=bipsig(zin(j));
      end
        yin=b2+z*w;
        y(I)=bipsig(yin);
        %Backpropagation of Error
        delk=(t(I)-y(I))*bipsig1(yin);
        delw=alpha*delk*z'+mf*(w-w1);
        delb2=alpha*delk;
        delinj=delk*w;
        for j=1:4
            delj(j,1)=delinj(j,1)*bipsig1(zin(j));
      end
        for j=1:4
            for i=1:2
                delv(i,j)=alpha*delj(j,1)*x(i,I)+mf*(v(i,j)-v1(i,j));
      		end
      end
        delb1=alpha*delj;
        w1=w;
        v1=v;
        %Weight updation
        w=w+delw;
        b2=b2+delb2;
        v=v+delv;
        b1=b1+delb1';
        e=e+(t(I)-y(I))^2;
    end
    if e<0.005
        con=0;
    end
    epoch=epoch+1;
end
disp('BPN for XOR funtion with Bipolar  ');
disp('Total  ');
disp(epoch);
disp('Error');
disp(e);
disp('Final Weight matrix  ');
v
b1
w
b2


 