% (c) 2015, Academisch Medisch Centrum Amsterdam, afd. Radiologie.
% Created 2015-05-18 (Q. Zhang (Kerry))

clear all; close all; format compact

dirData = dir('*.jpeg');        
fileNames = {dirData.name};     

for iFile = 1:numel(fileNames)  
    Num = num2str(67+iFile);
    newName = ['US',Num,'.jpg']
    movefile(fileNames{iFile},newName,'f');        
end


