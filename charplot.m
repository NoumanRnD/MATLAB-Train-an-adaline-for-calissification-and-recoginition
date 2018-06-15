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
        if xl(i,j)==-1
            plot(j+xs-1,ys-i+1,'r');
            hold on
        else
            plot(j+xs-1,ys-i+1,'k*');
            hold on
        end
    end
end
end
