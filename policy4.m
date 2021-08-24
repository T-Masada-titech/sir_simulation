function b = policy4(I_k)
    x = 1 - 2*I_k;
    if x <= 0
        b = 0;
    elseif 1 <= x
        b = 1;
    else 
        b = x;
    end
end