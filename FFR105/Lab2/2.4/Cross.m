function newChromosomePair = Cross(chromosome1,chromosome2)
newChromosomePair = [];
sizeChrom1 = size(chromosome1,1); %Number of rows
sizeChrom2 = size(chromosome2,1);        

chrom1Perm = randperm(sizeChrom1-1); 
chrom2Perm = randperm(sizeChrom2-1);

crossoverPoint1Chrom1 = chrom1Perm(1);
crossoverPoint2Chrom1 = chrom1Perm(2);
if(crossoverPoint1Chrom1 > crossoverPoint2Chrom1)
    tmpCross = crossoverPoint1Chrom1;
    crossoverPoint1Chrom1 = crossoverPoint2Chrom1;
    crossoverPoint2Chrom1 = tmpCross;
end

crossoverPoint1Chrom2 = chrom2Perm(1);
crossoverPoint2Chrom2 = chrom2Perm(2);
if(crossoverPoint1Chrom2 > crossoverPoint2Chrom2)
    tmpCross = crossoverPoint1Chrom2;
    crossoverPoint1Chrom2 = crossoverPoint2Chrom2;
    crossoverPoint2Chrom2 = tmpCross;
end

subChrom1 = chromosome1(1:crossoverPoint1Chrom1,:);
subChrom2 =  chromosome1(crossoverPoint1Chrom1+1:crossoverPoint2Chrom1,:);
subChrom3 = chromosome1(crossoverPoint2Chrom1+1:sizeChrom1,:);

subChrom4 = chromosome2(1:crossoverPoint1Chrom2,:);
subChrom5 = chromosome2(crossoverPoint1Chrom2+1:crossoverPoint2Chrom2,:);
subChrom6 = chromosome2(crossoverPoint2Chrom2+1:sizeChrom2,:);



child1 = [subChrom1;subChrom5;subChrom3]; 
tmpChild = struct('Chromosome',child1);
newChromosomePair = [newChromosomePair tmpChild];
child2 = [subChrom4;subChrom2;subChrom6];
tmpChild = struct('Chromosome',child2);
newChromosomePair = [newChromosomePair tmpChild];


end