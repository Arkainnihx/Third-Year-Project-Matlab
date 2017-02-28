clearvars

targets = [ 1 -1  1 -1 -1  1 -1  1;
            1  1  1 -1 -1 -1  1 -1];

geneTotal = size(targets,2);
connectionTotal = 10;
developmentTime = 10;
generationCount = 100000;
targetSwitchCount = -1;
        
B = evolve(targets, developmentTime, geneTotal, generationCount, targetSwitchCount);

% Population Sampler and Graph Displayer
sampleSize = 30;
samplePop = randn(sampleSize, geneTotal);

for popCount = 1:sampleSize
    P = develop(samplePop(popCount,:)', B, developmentTime, geneTotal);
    samplePop(popCount,:) = P(:,developmentTime+1)';
end

figure(1);
image(B,'CDataMapping','scaled')
colorbar

figure(2);
image(samplePop,'CDataMapping','scaled')
colorbar