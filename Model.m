clearvars
geneCount = 8;
developmentTime = 10;
generations = 100000;
targetCount = 2000;
targets = [1  1 -1 -1 -1  1 -1  1;
           1 -1  1 -1  1 -1 -1 -1];

B = evolve(targets, developmentTime, geneCount, generations, targetCount);

sampleSize = 30;
samplePop = randn(sampleSize,8);

for popCount = 1:sampleSize
    P = develop(samplePop(popCount,:)', B, developmentTime, geneCount);
    samplePop(popCount,:) = P(:,developmentTime+1)';
end

figure(1);
image(B,'CDataMapping','scaled')
colorbar

figure(2);
image(samplePop,'CDataMapping','scaled')
colorbar