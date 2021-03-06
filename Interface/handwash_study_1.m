function varargout = handwash_study_1(varargin)
% HANDWASH_STUDY_1 MATLAB code for handwash_study_1.fig
%      HANDWASH_STUDY_1, by itself, creates a new HANDWASH_STUDY_1 or raises the existing
%      singleton*.
%
%      H = HANDWASH_STUDY_1 returns the handle to a new HANDWASH_STUDY_1 or the handle to
%      the existing singleton*.
%
%      HANDWASH_STUDY_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDWASH_STUDY_1.M with the given input arguments.
%
%      HANDWASH_STUDY_1('Property','Value',...) creates a new HANDWASH_STUDY_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before handwash_study_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to handwash_study_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help handwash_study_1

% Last Modified by GUIDE v2.5 08-Dec-2015 22:48:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @handwash_study_1_OpeningFcn, ...
                   'gui_OutputFcn',  @handwash_study_1_OutputFcn, ...
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


% --- Executes just before handwash_study_1 is made visible.
function handwash_study_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to handwash_study_1 (see VARARGIN)

% Choose default command line output for handwash_study_1
handles.output = hObject;

%Kerry
set(handles.Sld_1, 'Visible', 'Off');
set(handles.text1, 'Visible', 'Off');
set(handles.text2, 'Visible', 'Off');
set(handles.text3, 'Visible', 'Off');
set(handles.text4, 'Visible', 'Off');
set(handles.uipanel1, 'Visible', 'Off');
set(handles.radiobutton1,'Value', 0);
set(handles.radiobutton2,'Value', 0);

hMaingui=getappdata(0,'mainHandles');
handles.base_folder= getappdata(hMaingui,'base_folder');   
handles.CS_image_folder=[handles.base_folder,'\picture_pool\CS\handwash'];
cd(handles.CS_image_folder);
dirData = dir('*.jpg');        
handles.fileNames = {dirData.name};
handles.display_order=randperm(numel(handles.fileNames));
handles.display_no=1;
cd(handles.base_folder);

% handles.known_brand=-1*ones(length(handles.display_order),1);
handles.known_brand=0*ones(length(handles.display_order),1); %assume all brands are unkonw. 
handles.sld_changes=0;
%end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes handwash_study_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = handwash_study_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on slider movement.
function Sld_1_Callback(hObject, eventdata, handles)
% hObject    handle to Sld_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%-----------Kerry Start-------------%
Sld_1_value=round(get(hObject,'Value'));
handles.sld_changes=1;
set(handles.text4, 'String', Sld_1_value);
if(handles.known_brand(handles.display_no-1)~=-1)
    set(handles.Btn_next,'enable','on');
end

% Update handles structure
guidata(hObject, handles);
%-----------Kerry end-------------%



% --- Executes during object creation, after setting all properties.
function Sld_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sld_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
%------Kerry Start--------%
 set(gcbo,'Value',0);
 %------Kerry end--------%


% --- Executes on button press in Btn_next.
function Btn_next_Callback(hObject, eventdata, handles)
% hObject    handle to Btn_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%------Kerry Start--------%
set(handles.Sld_1, 'Visible', 'On');
set(handles.text1, 'Visible', 'On');
set(handles.text2, 'Visible', 'On');
set(handles.text3, 'Visible', 'On');
set(handles.text4, 'Visible', 'On');
% set(handles.uipanel1, 'Visible', 'On');  %disabled selection on this, all
% brands are assumed to be unknown. 

begin=(handles.display_no==1);
cd(handles.CS_image_folder);
if (handles.display_no<=length(handles.display_order))
    I = imread(handles.fileNames{handles.display_order(handles.display_no)});
    imagesc(I); axis equal; axis off;
    cd(handles.base_folder);
    if(begin==1)  %first click on "Start", nothing to collect
    else %record previous reslut
         handles.rank(handles.display_no-1)=get(handles.Sld_1,'Value');
    end
    
    handles.display_no=handles.display_no+1;
    set(handles.Btn_next, 'String', 'Next');
    

    
else
    %record the last reutls
    handles.rank(handles.display_no-1)=get(handles.Sld_1,'Value');
    
    set(handles.Btn_next, 'String', 'Finished');
    set(handles.Btn_next,'enable','off');
    
    cd(handles.base_folder);
    
    
    %find the most nuetral 10
    valid_rank=handles.rank(find(handles.known_brand==0));%filter known brands
    sorted=sort(abs(valid_rank),'ascend');
    if(length(sorted)<10)
        h = errordlg('Not enougth unkonwn brands !');
        
        closereq;
        return;
    end
    idx_belowthreshold=find(abs(handles.rank)<=sorted(10));
    idx_valid=find((handles.known_brand==0));
    idx=intersect(idx_belowthreshold,idx_valid);
   %-------------- wirte to xlsx file--------------------%
    A= {'CS picture ID', 'rank','Known_brand'};
    for i=1:length(handles.display_order)
        A= cat(1, A, {handles.fileNames{handles.display_order(i)}, num2str(round(handles.rank(i))), num2str(handles.known_brand(i))});
    end
    sheet = 1;
    xlRange = ['A','1'];
    filename='Results.xlsx';
    xlswrite(filename,A,sheet,xlRange);
    
    B= {'Selected CS picture ID', 'rank'};
    for i=1:10
        B= cat(1, B, {handles.fileNames{handles.display_order(idx(i))}, num2str(round(handles.rank(idx(i))))});
    end
    sheet = 1;
    xlRange = ['D','1'];
    filename='Results.xlsx';
    xlswrite(filename,B,sheet,xlRange);
  %--------------------------------------------------------%
  %feed back to mainGUI
    hMaingui=getappdata(0,'mainHandles');
    fhupdate_master_status=getappdata(hMaingui,'fhupdate_master_status');
    feval(fhupdate_master_status);
    %then close
    %notify this pahse is end
    closereq;
    h=msgbox('Part 1 completed!');
    return;
     
end

set(handles.Btn_next,'enable','off');
set(handles.Sld_1,'Value',0);
set(handles.text4, 'String', 0);
set(handles.radiobutton1,'Value', 0);
set(handles.radiobutton2,'Value', 0);
handles.sld_changes=0;

%update
guidata(hObject, handles);
%------Kerry End--------%

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
 axis equal; axis off
 

    
% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel1.
function uipanel1_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel1 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radiobutton1,'Value') ==1)
    handles.known_brand(handles.display_no-1)=1;  %know this brand
else
    handles.known_brand(handles.display_no-1)=0;  %don't know this brand
end

if(handles.sld_changes==1)
    set(handles.Btn_next,'enable','on');
end
% Update handles structure
guidata(hObject, handles);
