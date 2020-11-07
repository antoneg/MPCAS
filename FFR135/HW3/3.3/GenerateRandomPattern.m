function pat = GenerateRandomPattern()
    for i = 1:9
        r = rand;
        if r >= 0.5
            pat(i) = 1;
        else
            pat(i) = -1;
        end
    end
    pat = pat';
end