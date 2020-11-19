
SET1_recreatedClusters = GenerateDenseLikeForest('set1.mat', 128);
SET2_recreatedClusters = GenerateDenseLikeForest('set2.mat', 128);

save('denseLike.mat');

