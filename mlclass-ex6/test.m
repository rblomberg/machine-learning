bestC = 0
bestA = 0
bestCost = 9000;
for C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
  for sigmaj = [0.01,0.03,0.1,0.3,1,3,10,30]
    printf("Parameters: %0.02f - %0.02f\n",i,j);
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1,x2,sigma));
    predictions = svmPredict(model,Xval);
    cost = mean(double(predictions ~= yval))
    if bestCost > cost
      bestCost = cost
      bestC = i
      bestA = j
    end
    visualizeBoundaryLinear(Xval, yval, model);
    pause;
  end
end
