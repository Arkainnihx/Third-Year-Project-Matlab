function [ sparseIndexTable ] = generateSparseIndexTable( geneTotal, connectionCount )

sparseIndexTable = zeros(geneTotal, connectionCount);
for geneCount = 1:geneTotal
    sparseIndexTable(geneCount,:) = randperm(geneTotal, connectionCount);
    for checkCount = 1:connectionCount
        while (sparseIndexTable(geneCount,checkCount) == geneCount)
            newIndex = randi(geneTotal);
            if (arrayContainsVal(sparseIndexTable(geneCount,:), newIndex) == false)
                sparseIndexTable(geneCount,checkCount) = newIndex;
            end
        end
    end
    sparseIndexTable(geneCount,:) = sort(sparseIndexTable(geneCount,:));
end

end