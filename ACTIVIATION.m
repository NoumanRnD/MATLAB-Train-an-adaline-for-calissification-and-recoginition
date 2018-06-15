function [ output_args ] = ACTIVIATION( input_args )
x = -10:0.1:10;
tmp = exp(-x);
y1 = 1./(1+tmp);
y2 = (1-tmp)./(1+tmp);
y3 = x;
subplot(231); plot(x, y1); grid on;
axis([min(x) max(x) -2 2]);
title('sigmoidal  Function');
 


end

