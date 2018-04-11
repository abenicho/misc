function [S,D]=constrained_kmeans(X,K,S0)

grid=0
tv=1
maxit=100;

[M N]=size(X);


% random initialisation
eps=0.02;

D=rand(M,K);
S=rand(K,N);

S=hardthresh(S);
if nargin<6
    disp('No ground truth')
    S0=S;
end

for it=1:maxit

    %calculate cluster assignment
    if mod(it,maxit/10)==0
        disp({'it' it log(norm(S-S0))})

    end
    
    
    %evasive action
    nz=find(sum(abs(S)'));
    iS=S(nz,:);
    
    %update cluster centres
    D(:,nz)=D(:,nz)+(X-D(:,nz)*iS)*iS';
    clear iS
    
    %normalize cluster centres
    for k=1:K

        D(:,k)=D(:,k)/norm(D(:,k));

    end    
    
    %update cluster weights
    S=S+D'*(X-D*S);
 
    if tv
        %tv minimisation
        [M N]=size(X);
        n=sqrt(N);
        maxitv=1;
        for k=1:K
            fTV=S(k,:);
            
            tau = 1e-8;
            
            for itv=1:maxitv
                G=tv_grad_nbh(fTV,eps);
                fTV = fTV - tau*G;
            end
            S(k,:)=fTV(:);
            
            
            
        end
    end

    S=hardthresh(S);
    

    
end


end