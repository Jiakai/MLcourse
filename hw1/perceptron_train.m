function [ w, k, iter ] = perceptron_train( dataX, dataY , maxIter)
%PERCEPTRON_TRAIN Summary of this function goes here
%   Detailed explanation goes here
    flag = 0;
    w = ones(1,size(dataX,2));
    iter = 0;
    dataY(dataY == 0) = -1;
    k = 0;
    while (flag == 0 && iter < maxIter)
        %disp(iter)
        flag = 1;
        for i = 1:size(dataX,1)
            y = w*dataX(i,:)';
            if y*dataY(i) < 0
                flag = 0;
                k = k+1;
                w = w + dataY(i)*dataX(i,:);
            end
        end
        iter = iter + 1;
        %sdisp(k)
    end

end

