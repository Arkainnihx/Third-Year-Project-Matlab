function [ P ] = develop( G, B, T, N )

P = zeros(N,T+1);
P(:,1) = G;
for devStep = 1:T
    P(:,devStep+1) = 0.8*P(:,devStep) + tanh(B * P(:,devStep));
end
end