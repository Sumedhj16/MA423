
function x = rowforward(L,b)
  n = size(L,1);
  for k = 1:n 
    for j= 1: k-1
        b(k,1) = b(k,1) - (L(k,j)*b(j));
    end
    if L(k,j)~=0
        b(k,1) = b(k,1)/L(k,k);
    else
        error('Matrix is singular!'); 
    end
  end
  x=b;
end


