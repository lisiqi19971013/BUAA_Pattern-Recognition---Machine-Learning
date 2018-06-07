function region = cregion(x, p1, p2, p3, op)
assert(nargin == 5);
region = zeros(size(p1));
for i = 1 : size(x, 1)
    for j = 1 : size(x, 2)
        if(strcmp(op, '1'))
            [~, loc] = max([p1(i, j), p2(i, j), p3(i, j)]);
        elseif(strcmp(op, '2'))
            [~, loc] = min([p1(i, j), p2(i, j), p3(i, j)]);
        end
        region(i, j) = loc - 1;
    end
end
end