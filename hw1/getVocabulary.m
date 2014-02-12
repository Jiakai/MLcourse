function [vocabulary] = getVocabulary(dataSet, minCount)
    allWords = cell(1,2500);
    tail = 0;
    for i = 1:size(dataSet,1)
        tWords = unique(strsplit(dataSet{i,2}));
        allWords(1,(1:length(tWords))+tail) = tWords;
        tail = tail + length(tWords);
    end
    [vocabulary, ~, ic] = unique(allWords);
    count = histc(ic, 1:length(vocabulary));
    vocabulary = vocabulary(1,count>=minCount);
end