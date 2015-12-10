function varargout = implicit_misattribution(varargin)
% IMPLICIT_MISATTRIBUTION MATLAB code for implicit_misattribution.fig
%      IMPLICIT_MISATTRIBUTION, by itself, creates a new IMPLICIT_MISATTRIBUTION or raises the existing
%      singleton*.
%
%      H = IMPLICIT_MISATTRIBUTION returns the handle to a new IMPLICIT_MISATTRIBUTION or the handle to
%      the existing singleton*.
%
%      IMPLICIT_MISATTRIBUTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMPLICIT_MISATTRIBUTION.M with the given input arguments.
%
%      IMPLICIT_MISATTRIBUTION('Property','Value',...) creates a new IMPLICIT_MISATTRIBUTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before implicit_misattribution_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to implicit_misattribution_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help implicit_misattribution

% Last Modified by GUIDE v2.5 12-Nov-2015 11:56:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @implicit_misattribution_OpeningFcn, ...
                   'gui_OutputFcn',  @implicit_misattribution_OutputFcn, ...
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


% --- Executes just before implicit_misattribution is made visible.
function implicit_misattribution_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to implicit_misattribution (see VARARGIN)

% Choose default command line output for implicit_misattribution
handles.output = hObject;

%Kerry

handles.base_folder= uigetdir;   
handles.CS_image_folder=[handles.base_folder,'\picture_pool\CS\handwash'];
cd(handles.CS_image_folder);
dirData = dir('*.jpg');        
handles.fileNames = {dirData.name};
handles.display_order=randperm(numel(handles.fileNames));
handles.display_no=1;
cd(handles.base_folder);
%end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes implicit_misattribution wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = implicit_misattribution_OutputFcn(hObject, eventdata, handles) 
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
set(handles.text4, 'String', Sld_1_value);
set(handles.Btn_next,'enable','on');
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
    %find the most nuetral 6
    
    sorted=sort(handles.rank,'descend');
    idx=find(handles.rank<=sorted(10));
   %-------------- wirte to xlsx file--------------------%
    A= {'CS picture ID', 'rank'};
    for i=1:length(handles.display_order)
        A= cat(1, A, {handles.fileNames{handles.display_order(i)}, num2str(round(handles.rank(i)))});
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
    xlRange = ['C','1'];
    filename='Results.xlsx';
    xlswrite(filename,B,sheet,xlRange);
  %--------------------------------------------------------%
  
  %notify this pahse is end
    close(handles.figure1);
     
end

set(handles.Btn_next,'enable','off');
set(handles.Sld_1,'Value',0);
set(handles.text4, 'String', 0);

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
 
