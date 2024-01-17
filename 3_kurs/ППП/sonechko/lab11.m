function[dispersiya]=lab11(A)
if(~isvector(A))
    error('Введіть вектор')
end
dispersiya = var(A);
end