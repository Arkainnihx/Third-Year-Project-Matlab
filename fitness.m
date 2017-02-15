function [ w ] = fitness( Pstar, S )
w = 1 + Pstar' * S;
end

