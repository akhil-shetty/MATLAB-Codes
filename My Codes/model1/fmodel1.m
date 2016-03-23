function newcr = fmodel1(seed,nodes,nlimit,niter,l,s,a,graphtype)


% seed = random_graph(5);
% nodes = 500;
% nlimit = 2;
% 
% niter = 1000;
% l = 1;
% a = 1;
% s = 0.5;

if (graphtype == 'BA')
    modad = genBA(seed, nodes, nlimit); %generate a BA adjacency matrix
elseif (graphtype == 'WS')
    modad = genWS(nodes, nlimit,0.5); %generate a WS adjacency matrix
end
cr = [];


for k = 1:niter
    [modad, cr] = genmodad(modad, cr, s); % new list of creative nodes and modad are generated 
    z = length(cr); %no. of creative nodes
    if length(cr) ~= 0
        for j = 1:length(cr)  % for every creative node
           j;
           cr(j);
            nbr = nbrad(modad, cr(j)); % find all neighbors

            for v = 1:length(nbr)   % for every meighbor of the given creative node

                if modad(nbr(v),nbr(v)) == 0
                    problist = problisten(modad, nbr(v), l);
               %     probacc = probaccept(modad, nbr(v), cr(j), a);                  
                    probcr = problist;%*probacc;              
                    modad(nbr(v),nbr(v)) = logical(rand() < probcr); % make it creative depending on listening and accepting probabilities
                end
            end
            
        end
    end
    
    newcr = length(find(diag(modad))) - z;  % number of new creative nodes generated in the given time interval
end

 
    
      

