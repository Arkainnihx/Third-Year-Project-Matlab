function [ targetIndex ] = switchTargets( targets, targetIndex )

targetCount = size(targets,1);

if (targetIndex == targetCount)
    targetIndex = 1;
else
    targetIndex = targetIndex + 1;
end

end