function x=hardthresh(x)
%returns a matrix keeping only the largest element of each column of x
[b a]=max(x);

x=zeros(size(x));
for k=1:size(x,2)
x(a(k),k)=b(k);
end
end
