function [ P ] = develop( G, B, developmentTime, geneCount )

P = zeros(geneCount,developmentTime+1);
P(:,1) = G;
for devCount = 1:developmentTime
    P(:,devCount+1) = 0.8*P(:,devCount) + tanh(B * P(:,devCount));
end

end