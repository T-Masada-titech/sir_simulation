function [nextS, nextI, nextR] = nextSIR(S, I, R, b, beta, gamma, dt)
    nextS = S - b*beta*S*I*dt;
    nextI = I + b*beta*S*I*dt - gamma*I*dt;
    nextR = R + gamma*I*dt;
end