function G=tv_grad_nbh(S,eps)



X=S(:);
Gr=zeros(numel(X),6);
Y=zeros(numel(X),1);
for n=2:numel(X)-1
       nbhs=[n-1 n+1];
for k=1:numel(nbhs)
 Gr(n,k)=X(n)-X(nbhs(k));

 % X-X(nbh(:,2)) X-X(nbh(:,3)) X-X(nbh(:,4)) X-X(nbh(:,5)) X-X(nbh(:,6))];
end
end
d2 = sum(Gr.^2,2);
for n=2:numel(X)-1
    nbhs=[n-1 n+1];
for k=1:numel(nbhs)

 Y(nbhs(k))=Y(nbhs(k))+X(nbhs(k))/sqrt(eps^2 +d2(n));
 % X-X(nbh(:,2)) X-X(nbh(:,3)) X-X(nbh(:,4)) X-X(nbh(:,5)) X-X(nbh(:,6))];
end
end
G=-(6*X./sqrt(eps^2 +d2)+Y)';% X-X(nbh(:,2)) X-X(nbh(:,3)) X-X(nbh(:,4)) X-X(nbh(:,5)) X-X(nbh(:,6))];



end