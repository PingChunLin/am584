function [Q,R] = mgs(X)
[m,n] = size(X); 
R = zeros(n,n);
Q = X;
for j=1:n
  for k = 1:j-1
    R(k,j) = Q(:,k)'*Q(:,j);
    Q(:,j) = Q(:,j)-R(k,j)*Q(:,k);
  end
  R(j,j) = norm(Q(:,j));
  Q(:,j) = Q(:,j)/R(j,j);
end