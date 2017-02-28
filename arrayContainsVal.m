function [ boolean ] = arrayContainsVal( array, value )

boolean = false;
for count = 1:size(array,2)
    if (array(count) == value)
        boolean = true;
        return
    end
end

end