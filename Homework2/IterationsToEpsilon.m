for i = 1:length(fx)
    if(fx(i)-fOptimal < epsilon)
        i+1
        break
    end
end
