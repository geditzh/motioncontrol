function mo = mo(r)
sum = 0;
for i=1:1:3
    sum = sum+(r(i))^2;
end
    mo = simplify(sqrt(sum));
end