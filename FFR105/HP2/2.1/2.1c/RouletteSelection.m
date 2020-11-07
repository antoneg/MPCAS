function selected = RouletteSelection(probList)
    selected = probList(1,1);
    r = rand;
    contesters = size(probList,1);     
   
    if(contesters == 1)
        selected = probList(1,1);
    else    
        phi = 0;
        i = 1;
       
        while (phi < r)
            phi = phi + probList(i,2);
            if (phi > r)
                selected = probList(i,1);              
            end            
            if i < contesters
                i = i + 1;
            else 
                i = 1;
            end
        end
    end

end
