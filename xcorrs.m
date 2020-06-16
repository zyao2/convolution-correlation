function y=xcorrs(x,h)
x=x(:)';
h=h(:)';
h=h(end:-1:1);
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

return;

xx=[x,zeros(1,n-1)];
hh=[h(end:-1:1),zeros(1,m-1)];
y=ifft(fft(xx).*fft(hh));
