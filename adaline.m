function [  ] = adaline(  )
p1=[1 1]'; p2=[1 2]';  
p3=[2 -1]'; p4=[2 -2]';  
p5=[-1 2]'; p6=[-2 1]';  
p7=[-1 -1]'; p8=[-2 -2]'; 

hold on
plot(p1(1),p1(2),'ks',p2(1),p2(2),'ks',p3(1),p3(2),'ko',p4(1),p4(2),'ko')
plot(p5(1),p5(2),'k*',p6(1),p6(2),'k*',p7(1),p7(2),'kd',p8(1),p8(2),'kd')
grid
hold
axis([-3 3 -3 3]) 
t1=[0 0]'; t2=[0 0]';  
t3=[0 1]'; t4=[0 1]'; 
t5=[1 0]'; t6=[1 0]';  
t7=[1 1]'; t8=[1 1]'; 
%lets simulate perceptron learning
R=[-2 2;-2 2]; 
tota_perceptron=newp(R,2);  
P=[p1 p2 p3 p4 p5 p6 p7 p8];
T=[t1 t2 t3 t4 t5 t6 t7 t8];
Y=sim(tota_perceptron,P)             
 
tota_perceptron.trainParam.epochs = 20; % let's train for 20 epochs 
tota_perceptron = train(tota_perceptron,P,T); %train,  
 
Y1=sim(tota_perceptron,P)
 
 
W=tota_perceptron.IW{1,1} %weights
 B=tota_perceptron.b{1}   
 
x=[-3:0.01:3];
y=-W(1,1)/W(1,2)*x-B(1)/W(1,2);  
y1=-W(2,1)/W(2,2)*x-B(2)/W(2,2);  
 
figure
hold on
plot(p1(1),p1(2),'ks',p2(1),p2(2),'ks',p3(1),p3(2),'ko',p4(1),p4(2),'ko')
plot(p5(1),p5(2),'k*',p6(1),p6(2),'k*',p7(1),p7(2),'kd',p8(1),p8(2),'kd')
grid
axis([-3 3 -3 3]) 
 plot(x,y,'r',x,y1,'b') 
 hold off
 
p9=[1 0.05]'; p10=[0.05 1]';
t9=t1;t10=t2;
p11=[1 -0.05]'; p12=[0.05 -1]';
t11=t3;t12=t4;
p13=[-1 0.05]';p14=[-0.05 1]';
t13=t5;t14=t6;
p15=[-1 -0.05]';p16=[-0.05 -1]';
t15=t7;t16=t8;
R=[-2 2;-2 2]; 
tota_perceptron=newp(R,2,'hardlim','learnp');
 
P=[p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16];
T=[t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16];
Y=sim(tota_perceptron,P);   
tota_perceptron.trainParam.epochs = 5000; 
tota_perceptron = train(tota_perceptron,P,T); 
Y1=sim(tota_perceptron,P);
C=norm(Y1-T)
W=tota_perceptron.IW{1,1} %weights
B=tota_perceptron.b{1}  %bias
x=[-3:0.01:3];
y=-W(1,1)/W(1,2)*x-B(1)/W(1,2);  
y1=-W(2,1)/W(2,2)*x-B(2)/W(2,2);  
figure
hold on
plot(p1(1),p1(2),'ks',p2(1),p2(2),'ks',p3(1),p3(2),'ko',p4(1),p4(2),'ko')
plot(p5(1),p5(2),'k*',p6(1),p6(2),'k*',p7(1),p7(2),'kd',p8(1),p8(2),'kd')
plot(p9(1),p9(2),'ks',p10(1),p10(2),'ks',p11(1),p11(2),'ko',p12(1),p12(2),'ko')
plot(p13(1),p13(2),'k*',p14(1),p14(2),'k*',p15(1),p15(2),'kd',p16(1),p16(2),'kd')
grid
axis([-3 3 -3 3]) 
plot(x,y,'r',x,y1,'b') 
hold off


end

