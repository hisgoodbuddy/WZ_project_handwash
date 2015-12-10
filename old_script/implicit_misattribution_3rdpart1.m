function varargout = implicit_misattribution_3rdpart1(varargin)
% IMPLICIT_MISATTRIBUTION_3RDPART1 MATLAB code for implicit_misattribution_3rdpart1.fig
%      IMPLICIT_MISATTRIBUTION_3RDPART1, by itself, creates a new IMPLICIT_MISATTRIBUTION_3RDPART1 or raises the existing
%      singleton*.
%
%      H = IMPLICIT_MISATTRIBUTION_3RDPART1 returns the handle to a new IMPLICIT_MISATTRIBUTION_3RDPART1 or the handle to
%      the existing singleton*.
%
%      IMPLICIT_MISATTRIBUTION_3RDPART1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPLICIT_MISATTRIBUTION_3RDPART1.M with the given input arguments.
%
%      IMPLICIT_MISATTRIBUTION_3RDPART1('Property','Value',...) creates a new IMPLICIT_MISATTRIBUTION_3RDPART1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before implicit_misattribution_3rdpart1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to implicit_misattribution_3rdpart1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help implicit_misattribution_3rdpart1

% Last Modified by GUIDE v2.5 28-Nov-2015 13:43:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @implicit_misattribution_3rdpart1_OpeningFcn, ...
                   'gui_OutputFcn',  @implicit_misattribution_3rdpart1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before implicit_misattribution_3rdpart1 is made visible.
function implicit_misattribution_3rdpart1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to implicit_misattribution_3rdpart1 (see VARARGIN)

% Choose default command line output for implicit_misattribution_3rdpart1
handles.output = hObject;

%Kerry
handles.base_folder= uigetdir;   
handles.CS_image_folder=[handles.base_folder,'\picture_pool\CS\handwash'];
cd(handles.base_folder);
[ndata, CS_img_name, alldata] =xlsread('Results.xlsx',1,'C:C');

cd(handles.CS_image_folder);
dirData = dir('*.jpg');        
handles.fileNames = CS_img_name(2:end);
handles.display_order=randperm(numel(handles.fileNames));
handles.display_no=1;
cd(handles.base_folder);
handles.button_enable=zeros(1,6); %Use this as a flag to identify button enable or not. 
%end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes implicit_misattribution_3rdpart1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = implicit_misattribution_3rdpart1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
 axis equal; axis off

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%-----------Kerry Start-------------%
slider1_value=round(get(hObject,'Value'));
set(handles.text1, 'String', slider1_value);
handles.button_enable(1)=1;
if (prod(handles.button_enable)==1)
    set(handles.pushbutton1,'enable','on');
end

%update
guidata(hObject, handles);
    
%-----------Kerry end-------------%


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 
 %------Kerry end--------%


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%-----------Kerry Start-------------%
slider7_value=round(get(hObject,'Value'));
set(handles.text2, 'String', slider7_value);
handles.button_enable(2)=1;
if (prod(handles.button_enable)==1)
    set(handles.pushbutton1,'enable','on');
end

%update
guidata(hObject, handles);
%-----------Kerry end-------------%

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 %------Kerry end--------%



% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%-----------Kerry Start-------------%
slider8_value=round(get(hObject,'Value'));
set(handles.text6, 'String', slider8_value);
handles.button_enable(3)=1;
if (prod(handles.button_enable)==1)
    set(handles.pushbutton1,'enable','on');
end

%update
guidata(hObject, handles);
%-----------Kerry end-------------%

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 %------Kerry end--------%



% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%-----------Kerry Start-------------%
slider9_value=round(get(hObject,'Value'));
set(handles.text5, 'String', slider9_value);
 handles.button_enable(4)=1;
if (prod(handles.button_enable)==1)
    set(handles.pushbutton1,'enable','on');
end

%update
guidata(hObject, handles);
%-----------Kerry end-------------%

% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 %------Kerry end--------%



% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%-----------Kerry Start-------------%
slider10_value=round(get(hObject,'Value'));
set(handles.text4, 'String', slider10_value);
handles.button_enable(5)=1;
if (prod(handles.button_enable)==1)
    set(handles.pushbutton1,'enable','on');
end

%update
guidata(hObject, handles);
%-----------Kerry end-------------%

% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 %------Kerry end--------%



% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%-----------Kerry Start-------------%
slider11_value=round(get(hObject,'Value'));
set(handles.text3, 'String', slider11_value);
handles.button_enable(6)=1;
if (prod(handles.button_enable)==1)
    set(handles.pushbutton1,'enable','on');
end
%update
guidata(hObject, handles);
%-----------Kerry end-------------%

% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 %------Kerry end--------%



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%------Kerry Start--------%

begin=(handles.display_no==1); 
cd(handles.CS_image_folder);
if (handles.display_no<=length(handles.display_order))
    set(handles.pushbutton1, 'String', 'Next');
    I = imread(handles.fileNames{handles.display_order(handles.display_no)});
    imagesc(I); axis equal; axis off;
    cd(handles.base_folder);
    if(begin==1)  %first click on "Start", nothing to collect
    else %record previous reslut
        handles.rank1(handles.display_no-1)=get(handles.slider1,'Value');
        handles.rank2(handles.display_no-1)=get(handles.slider7,'Value');
        handles.rank3(handles.display_no-1)=get(handles.slider11,'Value');
        handles.rank4(handles.display_no-1)=get(handles.slider10,'Value');
        handles.rank5(handles.display_no-1)=get(handles.slider9,'Value');
        handles.rank6(handles.display_no-1)=get(handles.slider8,'Value');
    end
    
    handles.display_no=handles.display_no+1;
    

    
else
    %record the last reutls
    handles.rank1(handles.display_no-1)=get(handles.slider1,'Value');
    handles.rank2(handles.display_no-1)=get(handles.slider7,'Value');
    handles.rank3(handles.display_no-1)=get(handles.slider11,'Value');
    handles.rank4(handles.display_no-1)=get(handles.slider10,'Value');
    handles.rank5(handles.display_no-1)=get(handles.slider9,'Value');
    handles.rank6(handles.display_no-1)=get(handles.slider8,'Value');
    
    set(handles.pushbutton1, 'String', 'Finished');
    %notify this pahse is end
    close(handles.figure1);
    cd(handles.base_folder);
   %-------------- wirte to xlsx file--------------------%
    A= {'CS picture ID', 'contentment','amusement','awe','excitement','valence','arousal'};
    for i=1:length(handles.display_order)
        A= cat(1, A, {handles.fileNames{handles.display_order(i)}, num2str(round(handles.rank1(i))), num2str(round(handles.rank2(i))), num2str(round(handles.rank3(i))), num2str(round(handles.rank4(i))), num2str(round(handles.rank5(i))), num2str(round(handles.rank6(i)))});
    end
    sheet = 3;
    xlRange = ['A','1'];
    filename='Results.xlsx';
    xlswrite(filename,A,sheet,xlRange);
     
end

set(handles.pushbutton1,'enable','off');
handles.button_enable=zeros(1,6);
set(handles.slider1,'Value',0);
set(handles.slider10,'Value',0);
set(handles.slider11,'Value',0);
set(handles.slider7,'Value',0);
set(handles.slider8,'Value',0);
set(handles.slider9,'Value',0);

set(handles.text1, 'String', 0);
set(handles.text2, 'String', 0);
set(handles.text3, 'String', 0);
set(handles.text4, 'String', 0);
set(handles.text5, 'String', 0);
set(handles.text6, 'String', 0);

%update
guidata(hObject, handles);
%------Kerry End--------%


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
