function [ B ] = evolve( targets, developmentTime, geneCount, generationCount, targetSwitchValue )

G = zeros(geneCount,1);
B = zeros(geneCount);
targetIndex = 1;
currentTarget = targets(targetIndex,:);
targetSwitchCount = 0;

for evolCount = 1:generationCount
    [Gmut,Bmut] = mutate(G,B,geneCount);
    Pstar = develop(G, B, developmentTime, geneCount);
    Pstar = Pstar(:,developmentTime+1);
    PstarMut = develop(Gmut, Bmut, developmentTime, geneCount);
    PstarMut = PstarMut(:,developmentTime+1);
    w = fitness(Pstar, currentTarget);
    wMut = fitness(PstarMut, currentTarget);
    if (wMut > w)
        G = Gmut;
        B = Bmut;
    end
    if (targetSwitchValue > -1)
        targetSwitchCount = targetSwitchCount + 1;
        if (targetSwitchCount == targetSwitchValue)
            targetIndex = switchTargets(targets,targetIndex);
            currentTarget = targets(targetIndex,:);
            targetSwitchCount = 0;
        end
    end
end

end