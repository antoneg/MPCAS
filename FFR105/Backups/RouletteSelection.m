function selected = RouletteSelection(probList)
selected = 0;
r = rand;
contesters = size(probList,1);

phi = 0;
for i = 1:contesters
    phi = phi + probList(i,2);

    if (phi > r)
        selected = probList(i,1);
        break;
    end
end
if(selected == 0)
    error("WATTAFAKK");
end