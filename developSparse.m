function [ P ] = developSparse( G, sparseB, sparseIndexTable, developmentTime, geneTotal, connectionTotal )

P = zeros(geneTotal,developmentTime+1);
P(:,1) = G;
for devCount = 1:developmentTime
    for phenotypeCount = 1:geneTotal
        p = 0.8*P(phenotypeCount,devCount);
        interactionTotal = 0;
        for connectionCount = 1:connectionTotal
            interactionTotal = interactionTotal + sparseB(phenotypeCount,connectionCount) * P(sparseIndexTable(phenotypeCount,connectionCount),devCount);
        end
        p = p + tanh(interactionTotal);
        P(phenotypeCount,devCount+1) = p;
    end
    P(:,devCount+1) = 0.8*P(:,devCount) + tanh(sparseB * P(:,devCount));
end

end