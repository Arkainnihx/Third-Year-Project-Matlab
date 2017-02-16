function [ B ] = evolve( S, T, N, E )

G = zeros(N,1);
B = zeros(N);

for evolCount = 1:E
    [Gmut,Bmut] = mutate(G,B,N);
    Pstar = develop(G, B, T, N);
    Pstar = Pstar(:,T+1);
    PstarMut = develop(Gmut, Bmut, T, N);
    PstarMut = PstarMut(:,T+1);
    w = fitness(Pstar, S);
    wMut = fitness(PstarMut, S);
    if (wMut > w)
        G = Gmut;
        B = Bmut;
    end
end

end