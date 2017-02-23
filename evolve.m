function [ B ] = evolve( targets, T, N, E, targetCount )

G = zeros(N,1);
B = zeros(N);
targetIndex = 1
currentTarget = targets(targetIndex,:);
targetSwitchCountdown = targetCount;

for evolCount = 1:E
    [Gmut,Bmut] = mutate(G,B,N);
    Pstar = develop(G, B, T, N);
    Pstar = Pstar(:,T+1);
    PstarMut = develop(Gmut, Bmut, T, N);
    PstarMut = PstarMut(:,T+1);
    w = fitness(Pstar, currentTarget);
    wMut = fitness(PstarMut, currentTarget);
    if (wMut > w)
        G = Gmut;
        B = Bmut;
    end
    if (targetCount > -1)
        targetSwitchCountdown = targetSwitchCountdown - 1;
        
    end
end

end