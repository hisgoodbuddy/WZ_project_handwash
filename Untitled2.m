cd F:\Google Drive\WZ_project\picture_pool\CS\handwash;
dirData = dir('*.jpg');        
fileNames = {dirData.name};

I = imread(fileNames{1});
imagesc(I)
axis equal
axis off