
load event-category-testset.dat

[rows,columns] = size(X)

reducedX = sparse(rows,columns);

current_index = 1;
for c = 1:columns
  total = sum(full(X(:,c)))
  if total > 0
    reducedX(:,current_index) = X(:,c);
    current_index = current_index + 1;
  end
end
