%show images

displaymode= randi(2);  %1 for sequential display; 2 for simultaneous display

figure(1);
if (displaymode==1)
 %sequential display    
   sequencial_disp;
else
%  simultaneous display
    simul_disp;
end
    
close all;

