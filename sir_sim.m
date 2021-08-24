clear

beta = 0.4;
gamma = 0.1;
dt = 0.01;
T = 7000;

S = 0:T;
I = 0:T;
R = 0:T;
% initialize
S(1) = 0.99;
I(1) = 0.01;
R(1) = 0;

for t = 1:T
    [S(t+1), I(t+1), R(t+1)] = nextSIR(S(t), I(t), R(t), policy1(), beta, gamma, dt);
end
plot(0:T, I, '--m', 'linewidth', 2.0)
hold on

for t = 1:T
    [S(t+1), I(t+1), R(t+1)] = nextSIR(S(t), I(t), R(t), policy2(), beta, gamma, dt);
end
plot(0:T, I, '-.b', 'linewidth', 2.0)

for t = 1:T
    [S(t+1), I(t+1), R(t+1)] = nextSIR(S(t), I(t), R(t), policy3(t-1), beta, gamma, dt);
end
plot(0:T, I, ':g', 'linewidth', 2.0)

for t = 1:T
    [S(t+1), I(t+1), R(t+1)] = nextSIR(S(t), I(t), R(t), policy4(I(t)), beta, gamma, dt);
end
plot(0:T, I, '-r', 'linewidth', 2.0)

axis([0 T 0 0.5])
xlabel('Time k')
ylabel('l(k)')
grid on
legend('b(k)=1', 'b(k)=0.7', 'b(k)=0.7 in [1000, 3000]', 'b(k)=1-2I(k)')
