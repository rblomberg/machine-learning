X = [
  1,0,0,1;
  0,0,0,1;
  1,0,0,1;
  0,0,0,1;
  1,1,0,1;
]

k = 1
[m,n] = size(X)

R = ones(m,1) * mean(X)

# mean normalized (not sure if this is necessary on binary data)
# I think it fixes the bias introduced by a feature that is largely
# on the high value vs a feature that is largely low valued
# in dataset above it fixes the issue with a column
# where all the values are false vs. a column where all the values
# are true
Xmean = X - R
#Xmean = X

Sigma = (1/m) * Xmean' * Xmean
[U,S,V] = svd(Sigma)

# reduce from 4 dimensions to 2 dimensions
# check % of variance retained

retained = ( sum(sum( S(:,1:k))) / sum(sum( S )) )

Ureduce = U(:,1:k)
z = Ureduce' * Xmean'

Xapprox = round((Ureduce * z)' + R)
#Xapprox = round((Ureduce * z)')
X

# figure out why this give an out of memory error,
# should only be a few hundred megs
T = ones(10000,10000);

[U,S,V] = svd(T);

B = size(U)
