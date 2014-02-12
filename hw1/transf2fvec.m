function featureVec = transf2fvec(dataSet, vocabulary)
    featureVec = zeros(size(dataSet,1),length(vocabulary));
    for i =1:size(dataSet,1)
        tWords = strsplit(dataSet{i,2});
        featureVec(i,:) = ismember(vocabulary,tWords);
    end
end