function newVars = DecodeInstruction(instruction, nrOfVars, nrOfCons, vars, consts)
    newVars = vars; 
    cMax = 1000;
    operatorIndx = instruction(1);
    destinationIndx = instruction(2);
    operand1Indx = instruction(3);
    operand2Indx = instruction(4);
    
    if (operand1Indx > nrOfVars)
    operand1 = consts(operand1Indx-nrOfVars);
    else
        operand1 = vars(operand1Indx);
    end
    
    if (operand2Indx > nrOfVars)
        operand2 = consts(operand2Indx-nrOfVars);
    else
        operand2 = vars(operand2Indx);
    end
    % + - x /
    if operatorIndx == 1
        newVars(destinationIndx) = operand1 + operand2;
%          disp(operand1 + " + " +operand2 + " = " + (operand1 + operand2))
    elseif operatorIndx == 2
        newVars(destinationIndx) = operand1 - operand2;
%          disp(operand1 + " - " +operand2 + " = " + (operand1 - operand2))
    elseif operatorIndx == 3
        newVars(destinationIndx) = operand1 * operand2;
%          disp(operand1 + " * " +operand2 + " = " + (operand1 * operand2))
    else % ==4
        if operand2 == 0
            newVars(destinationIndx) = operand1 / cMax;
        else
            newVars(destinationIndx) = operand1 / operand2;
        end
    
%         disp(operand1 + " / " + operand2 + " = " + (operand1 / operand2))     
    end
end