m = 3;
n = m^2;
np = 1; %noise parameter
syms x1 x2;

%%%% Set of Test Functions %%%%%%%%%%%
f = - (1+cos(12*sqrt(x1^2+x2^2)))/(0.5*(x1^2+x2^2)+2);

%f = x1^2 + x2^2;
%f = cos(x1) + cos(x2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g = gradient(f, [x1 x2]);

%dom represents domain with each row denoting range of corr dimension
dom = [-5.12 5.12; -5.12 5.12];

x = [-5.12:10.24/n:5.11; -5.12:10.24/n:5.11].';
tpm = gentpm('I', m);

niter = 1000;

for k = 1:niter
    k
    xmod = x + np*xnoise(k+1,n)*0.5;
    x1 = xmod(:,1);
    x2 = xmod(:,2);
    gradf = double([subs(g(1)) subs(g(2))])
    x = tpm*x - stepsize(k)*gradf;
end

