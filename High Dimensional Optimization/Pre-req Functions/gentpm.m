function [tpm, coord] = gentpm(type, m)
%m is the number of rows/columns in grid
%tpm is gossip matrix
%coord is the coordinate matrix for plotting

n = m^2;
if type == 'grid'
    tpm = zeros(n, n);
    for a = 1:n
        for b = 1:n
            tpm(a,b) = ((abs(a-b)==m) + ((a-b)==1)*(mod(a-1,m)~=0) + ((b-a)==1)*(mod(a,m)~=0))/...
                (2 + (mod(a,m)~=1&mod(a,m)~=0) + (ceil(a/m)~=1&ceil(a/m)~=m));
        end
    end

   coord = zeros(n, 2);
   coord(:,1) = mod(0:n-1,m)+1;
   coord(:,2) = ceil((1:n)/m);
   
elseif type == 'I'
    tpm = eye(n);
end

