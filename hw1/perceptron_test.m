function [ error ] = perceptron_test( w,dataX,dataY )
%PERCEPTRON_TEST Summary of this function goes here
%   Detailed explanation goes here
    error = 0;
    dataY(dataY == 0) = -1;
    for i = 1:size(dataX)
        y = w*dataX(i,:)';
        if y >= 0
        	y = 1;
        else
            y = -1;
        end
        if y ~= dataY(i)
            error = error + 1;
        end
    end
end

