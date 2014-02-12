function [ w, k, iter ] = perceptron_train_ave(  dataX, dataY , maxIter)
%PERCEPTRON_AVE_TRAIN Summary of this function goes here
%   Detailed explanation goes here
    flag = 0;
    w = ones(1,size(dataX,2));
    w_old = ones(1,size(dataX,2));
    iter = 0;
    dataY(dataY == 0) = -1;
    k = 0;
    count = 1;
    while (flag == 0 && iter < maxIter)
        %k = 0;
        flag = 1;
        for i = 1:size(dataX)
            y = w*dataX(i,:)';
            if y*dataY(i)<0
                flag = 0;
                k = k+1;
                w = w + dataY(i)*dataX(i,:);
                w_old = w_old + dataY(i)*dataX(i,:)*count;
            end
            count = count + 1;
        end
        iter = iter + 1;
    end
    w = w - w_old/count;
end

