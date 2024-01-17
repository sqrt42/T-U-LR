function[dispersiya]=dispCalc(A)
if(~isvector(A))
    error('Введіть вектор')
end
dispersiya = var(A);
end