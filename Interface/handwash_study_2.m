function varargout = handwash_study_2(varargin)
% HANDWASH_STUDY_2 MATLAB code for handwash_study_2.fig
%      HANDWASH_STUDY_2, by itself, creates a new HANDWASH_STUDY_2 or raises the existing
%      singleton*.
%
%      H = HANDWASH_STUDY_2 returns the handle to a new HANDWASH_STUDY_2 or the handle to
%      the existing singleton*.
%
%      HANDWASH_STUDY_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDWASH_STUDY_2.M with the given input arguments.
%
%      HANDWASH_STUDY_2('Property','Value',...) creates a new HANDWASH_STUDY_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before handwash_study_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to handwash_study_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help handwash_study_2

% Last Modified by GUIDE v2.5 08-Dec-2015 20:25:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @handwash_study_2_OpeningFcn, ...
                   'gui_OutputFcn',  @handwash_study_2_OutputFcn, ...
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


% --- Executes just before handwash_study_2 is made visible.
function handwash_study_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to handwash_study_2 (see VARARGIN)

% Choose default command line output for handwash_study_2
handles.output = hObject;

%Kerry
set(handles.slider1, 'Visible', 'Off');
set(handles.slider10, 'Visible', 'Off');
set(handles.slider11, 'Visible', 'Off');
set(handles.slider7, 'Visible', 'Off');
set(handles.slider8, 'Visible', 'Off');
set(handles.slider9, 'Visible', 'Off');
set(handles.text1, 'Visible', 'Off');
set(handles.text10, 'Visible', 'Off');
set(handles.text11, 'Visible', 'Off');
set(handles.text2, 'Visible', 'Off');
set(handles.text12, 'Visible', 'Off');
set(handles.text3, 'Visible', 'Off');
set(handles.text4, 'Visible', 'Off');
set(handles.text5, 'Visible', 'Off');
set(handles.text6, 'Visible', 'Off');
set(handles.text7, 'Visible', 'Off');
set(handles.text8, 'Visible', 'Off');
set(handles.text9, 'Visible', 'Off');

handles.base_folder= uigetdir;   
handles.US_image_folder=[handles.base_folder,'\picture_pool\US'];
cd(handles.US_image_folder);
dirData = dir('*.jpg');        
handles.fileNames = {dirData.name};
handles.display_order=randperm(numel(handles.fileNames));
handles.display_no=1;
cd(handles.base_folder);
handles.button_enable=zeros(1,6); %Use this as a flag to identify button enable or not. 
%end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes handwash_study_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = handwash_study_2_OutputFcn(hObject, eventdata, handles) 
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
set(handles.slider1, 'Visible', 'On');
set(handles.slider10, 'Visible', 'On');
set(handles.slider11, 'Visible', 'On');
set(handles.slider7, 'Visible', 'On');
set(handles.slider8, 'Visible', 'On');
set(handles.slider9, 'Visible', 'On');
set(handles.text1, 'Visible', 'On');
set(handles.text10, 'Visible', 'On');
set(handles.text11, 'Visible', 'On');
set(handles.text2, 'Visible', 'On');
set(handles.text12, 'Visible', 'On');
set(handles.text3, 'Visible', 'On');
set(handles.text4, 'Visible', 'On');
set(handles.text5, 'Visible', 'On');
set(handles.text6, 'Visible', 'On');
set(handles.text7, 'Visible', 'On');
set(handles.text8, 'Visible', 'On');
set(handles.text9, 'Visible', 'On');

begin=( handles.display_no==1);
cd(handles.US_image_folder);
if (handles.display_no<=length(handles.display_order))
    set(handles.pushbutton1, 'String', 'Next');
    I = imread(handles.fileNames{handles.display_order(handles.display_no)});
    imagesc(I); axis equal; axis off;
    cd(handles.base_folder);
     % collect previous result
    if(begin) %first click, nothing to collect
    else
        handles.rank1(handles.display_no-1)=get(handles.slider1,'Value');
        handles.rank2(handles.display_no-1)=get(handles.slider7,'Value');
        handles.rank3(handles.display_no-1)=get(handles.slider11,'Value');
        handles.rank4(handles.display_no-1)=get(handles.slider10,'Value');
        handles.rank5(handles.display_no-1)=get(handles.slider9,'Value');
        handles.rank6(handles.display_no-1)=get(handles.slider8,'Value');
    end
    
    handles.display_no=handles.display_no+1;
    

    
else
    %get last result
    handles.rank1(handles.display_no-1)=get(handles.slider1,'Value');
    handles.rank2(handles.display_no-1)=get(handles.slider7,'Value');
    handles.rank3(handles.display_no-1)=get(handles.slider11,'Value');
    handles.rank4(handles.display_no-1)=get(handles.slider10,'Value');
    handles.rank5(handles.display_no-1)=get(handles.slider9,'Value');
    handles.rank6(handles.display_no-1)=get(handles.slider8,'Value');
        
    set(handles.pushbutton1, 'String', 'Finished');
    %notify this pahse is end
    cd(handles.base_folder);
   %-------------- wirte to xlsx file--------------------%
    A= {'CS picture ID', 'contentment','amusement','awe','excitement','valence','arousal'};
    for i=1:length(handles.display_order)
        A= cat(1, A, {handles.fileNames{handles.display_order(i)}, num2str(round(handles.rank1(i))), num2str(round(handles.rank2(i))), num2str(round(handles.rank3(i))), num2str(round(handles.rank4(i))), num2str(round(handles.rank5(i))), num2str(round(handles.rank6(i)))});
    end
    sheet = 2;
    xlRange = ['A','1'];
    filename='Results.xlsx';
    xlswrite(filename,A,sheet,xlRange);
  %--------------------------------------------------------%
  [cont_selected_idx,amus_selected_idx]=select_dat(handles.rank1,handles.rank2,handles.rank3,handles.rank4,handles.rank5,handles.rank6);
   %-------------- wirte to xlsx file--------------------%
    B= {'contentment dom picture ID', 'amusement dom picture ID'};
    for i=1:length(cont_selected_idx)
        B= cat(1, B, {handles.fileNames{handles.display_order(cont_selected_idx(i))},handles.fileNames{handles.display_order(amus_selected_idx(i))} });
    end
    sheet = 2;
    xlRange = ['H','1'];
    filename='Results.xlsx';
    xlswrite(filename,B,sheet,xlRange);
  %--------------------------------------------------------%
  h=msgbox('Part 2 completed!');
  closereq;
  return;
     
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
