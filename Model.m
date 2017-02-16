clearvars
N = 8;
T = 10;
E = 100000;
S = [1; 1; -1; -1; -1; 1; -1; 1];

B = evolve(S,T,N,E);

sampleSize = 30;
samplePop = randn(sampleSize,8);

for popCount = 1:sampleSize
    P = develop(samplePop(popCount,:)', B, T, N);
    samplePop(popCount,:) = P(:,T+1)';
end
samplePop = [samplePop zeros(sampleSize,1)];
samplePop = [samplePop; zeros(1,N+1)];

surf(samplePop);
axis([1,9,1,31]);
view([0,-90]);