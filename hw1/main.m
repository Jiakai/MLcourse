clc; clear all;
%% 1. load training set and validation set
dataSet= loadData('ps1_data/spam_train.txt',5000);
trainSet = dataSet(1:4000,:);
validSet = dataSet(4001:5000,:);
%% 2. transform to feature vector
vocabulary = getVocabulary(trainSet,30);
trainX = transf2fvec(trainSet,vocabulary);
validX = transf2fvec(validSet,vocabulary);
trainY = cell2mat(trainSet(:,1));
validY = cell2mat(validSet(:,1));
%% 3. train a perceptron classifer
[w, k, iter] = perceptron_train( trainX, trainY, 1000);
error = perceptron_test(w,validX,validY);
%% 4. output 15 words with the most positive and negative weights
[~, id] = sort(w);
id_neg = id(1:15);
id_pos = id(end:-1:end-15);
display(vocabulary(id_neg)');
display(vocabulary(id_pos)');
%% 5. train a average perceptron classifer
[w_ave, k_ave, iter_ave] = perceptron_train_ave( trainX, trainY, 50);
error_ave = perceptron_test(w_ave,validX,validY);
%% 6. plot N = 100; 200; 400; 800; 2000; 4000
N = [100; 200; 400; 800; 2000; 4000];
errorN = zeros(1,length(N));
error_aveN = zeros(1,length(N));
iter = zeros(1,length(N));
iter_ave = zeros(1,length(N));
for i = 1:length(N)
    disp(i)
    [w, k, iter(i)] = perceptron_train( trainX(1:N(i),:), trainY(1:N(i)), 50);
    errorN(i) = perceptron_test(w,validX,validY);
    [w_ave, k_ave, iter_ave(i)] = perceptron_train_ave( trainX(1:N(i),:), trainY(1:N(i)), 50);
    error_aveN(i) = perceptron_test(w_ave,validX,validY);
end
figure;
plot(errorN,'r');hold on;
plot(error_aveN,'b');
legend('perceptron','average perceptron');
figure;
plot(iter,'r');hold on;
plot(iter_ave,'b');
legend('perceptron','average perceptron');
%% 7. find best configure
maxWords = [15,30,60];
maxIter  = 4:2:16;
error = zeros(length(maxWords),length(maxIter));

for i = 1:size(error,1)
    disp(i)
    vocabulary = getVocabulary(trainSet,maxWords(i));
    trainX = transf2fvec(trainSet,vocabulary);
    validX = transf2fvec(validSet,vocabulary);
    trainY = cell2mat(trainSet(:,1));
    validY = cell2mat(validSet(:,1));
    for j = 1:size(error,2)
        [w_ave, k_ave, iter_ave] = perceptron_train_ave( trainX, trainY, maxIter(j));
        error(i,j) = perceptron_test(w_ave,validX,validY);
    end
end

disp(error)
%% 8. test
testSet = loadData('ps1_data/spam_test.txt',1000);
testX = transf2fvec(testSet,vocabulary);
testY = cell2mat(validSet(:,1));
%%
error = perceptron_test(w_ave,testX,testY);