try
   jScrollbar = javaObjectEDT('javax.swing.JScrollBar');
   jScrollbar.setOrientation(jScrollbar.HORIZONTAL);
catch
   error('Cannot create Java-based scroll-bar!');
end
% Display the object onscreen
try
   javacomponent(jScrollbar,[10, 40, 200, 20]);
catch
   error('Cannot display Java-base scroll-bar!');
end
%% slider
try
   jSlider = javaObjectEDT('javax.swing.JSlider');
   jSlider.setOrientation(jSlider.HORIZONTAL);
catch
   error('Cannot create Java-based scroll-bar!');
end
% Display the object onscreen
try
   javacomponent(jSlider,'South');
catch
   error('Cannot display Java-base scroll-bar!');
end

%%
jRangeSlider = com.jidesoft.swing.RangeSlider(0,100,20,70);  % min,max,low,high
jRangeSlider = javacomponent(jRangeSlider, [0,0,200,80], gcf);
set(jRangeSlider, 'MajorTickSpacing',25, 'MinorTickSpacing',5, 'PaintTicks',true, 'PaintLabels',true, ...
    'Background',java.awt.Color.white, 'StateChangedCallback',@myCallbackFunc);


%% button
[jButton, hButton] = javacomponent('javax.swing.JButton')

 
javacomponent('javax.swing.JButton','North');
 javacomponent(javax.swing.JButton('Click me!'),[50,40,80,30]);
javacomponent(javax.swing.JButton('Click me!'),'East',hFig);

%% htlm styly
hEdit = uicontrol('style','edit','max',80,'pos',[20,20,150,20]);
jEdit = findjobj(hEdit);
vEdit = jEdit.getViewport;
wEdit = vEdit.getComponent(0);
wEdit.setEditorKit(javax.swing.text.html.HTMLEditorKit);
set(wEdit,'Text','<a href="http://www.google.com" rel="nofollow">Go to Google!</a>');