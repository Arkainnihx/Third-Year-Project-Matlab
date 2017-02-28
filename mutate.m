function [ Gmut, Bmut ] = mutate( G, B, N )

Gindex = randi(N);
Gval = rand(1)*0.2 - 0.1;
Gmut = G;
Gmut(Gindex) = Gmut(Gindex) + Gval;
if (Gmut(Gindex) > 1)
    Gmut(Gindex) = 1;
elseif (Gmut(Gindex) < -1)
    Gmut(Gindex) = -1;
end

%Will need adapting for sparse Bs.
Bmut = B;
if (rand(1) <= 0.067)
    Bindex = randi(N,[1,2]);
    Bval = rand(1)*0.0134 - 0.0067;
    Bmut(Bindex(1),Bindex(2)) = Bmut(Bindex(1),Bindex(2)) + Bval;
end

end