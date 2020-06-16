function y=convv(x,h,flag)
x=x(:)';
h=h(:)';
m=length(x);
n=length(h);
ny=m+n-1;
y=zeros(1,ny);
for i=1:ny
    y(i)=0;
    for j=1:n
        k=i-j+1;
        if(k>0 && k<=m)
            y(i)=y(i)+x(k)*h(j);
        end
    end
end


if(strcmp(flag,'full'))
;
elseif(strcmp(flag,'same'))
    nh=floor(n/2)+1;
    y=y(nh:m+nh-1);
elseif(strcmp(flag,'valid'))
    y=y(n:m);
else
    disp('error input method');
    stop
end

return;
xx=[x,zeros(1,n-1)];
hh=[h,zeros(1,m-1)];
y=ifft(fft(xx).*fft(hh));


