function varargout = handwash_study(varargin)
% HANDWASH_STUDY MATLAB code for handwash_study.fig
%      HANDWASH_STUDY, by itself, creates a new HANDWASH_STUDY or raises the existing
%      singleton*.
%
%      H = HANDWASH_STUDY returns the handle to a new HANDWASH_STUDY or the handle to
%      the existing singleton*.
%
%      HANDWASH_STUDY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDWASH_STUDY.M with the given input arguments.
%
%      HANDWASH_STUDY('Property','Value',...) creates a new HANDWASH_STUDY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before handwash_study_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to handwash_study_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help handwash_study

% Last Modified by GUIDE v2.5 10-Dec-2015 15:40:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @handwash_study_OpeningFcn, ...
                   'gui_OutputFcn',  @handwash_study_OutputFcn, ...
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


% --- Executes just before handwash_study is made visible.
function handwash_study_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to handwash_study (see VARARGIN)

% Choose default command line output for handwash_study
handles.output = hObject;


%Kerry
setappdata(0  ,'mainHandles'            ,gcf);
setappdata(gcf,'studyphase'             ,1);
setappdata(gcf, 'fhupdate_master_status', @update_master_status);
setappdata(gcf, 'handles', handles);
base_folder= uigetdir; 
setappdata(gcf,'base_folder'             ,base_folder);

set(handles.pushbutton1, 'enable', 'On');
set(handles.pushbutton2, 'enable', 'Off');
set(handles.pushbutton3, 'enable', 'Off');
set(handles.pushbutton4, 'enable', 'Off');
set(handles.pushbutton5, 'enable', 'Off');
%end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes handwash_study wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = handwash_study_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Kerry run hand wash study
cf=pwd;
handles.activex1.URL = [cf,'/instructionVedioes/instruction_v1.mp4'];
handles.activex1.controls.play
handwash_study_1;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Kerry run hand wash study
cf=pwd;
handles.activex1.URL = [cf,'/instructionVedioes/instruction_v2.mp4'];
handles.activex1.controls.play
handwash_study_2;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Kerry run hand wash study
cf=pwd;
handles.activex1.URL = [cf,'/instructionVedioes/instruction_v3.mp4'];
handles.activex1.controls.play
handwash_study_2_1;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Kerry run hand wash study
cf=pwd;
handles.activex1.URL = [cf,'/instructionVedioes/instruction_v4.mp4'];
handles.activex1.controls.play
handwash_study_3_1;



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Kerry run hand wash study
cf=pwd;
handles.activex1.URL = [cf,'/instructionVedioes/instruction_v5.mp4'];
handles.activex1.controls.play
handwash_study_3_1;


function update_master_status
hMaingui=getappdata(0,'mainHandles');
studyphase=getappdata(hMaingui,'studyphase');
handles=getappdata(hMaingui,'handles');
if (studyphase==1)
    set(handles.pushbutton1, 'enable', 'Off');
    set(handles.pushbutton2, 'enable', 'On');
    set(handles.pushbutton3, 'enable', 'Off');
    set(handles.pushbutton4, 'enable', 'Off');
    set(handles.pushbutton5, 'enable', 'Off');
    setappdata(hMaingui,'studyphase',2);
elseif (studyphase==2)
    set(handles.pushbutton1, 'enable', 'Off');
    set(handles.pushbutton2, 'enable', 'Off');
    set(handles.pushbutton3, 'enable', 'On');
    set(handles.pushbutton4, 'enable', 'Off');
    set(handles.pushbutton5, 'enable', 'Off');
    setappdata(hMaingui,'studyphase',3);
elseif (studyphase==3)
    set(handles.pushbutton1, 'enable', 'Off');
    set(handles.pushbutton2, 'enable', 'Off');
    set(handles.pushbutton3, 'enable', 'Off');
    set(handles.pushbutton4, 'enable', 'On');
    set(handles.pushbutton5, 'enable', 'Off');
    setappdata(hMaingui,'studyphase',4);
elseif (studyphase==4)
    set(handles.pushbutton1, 'enable', 'Off');
    set(handles.pushbutton2, 'enable', 'Off');
    set(handles.pushbutton3, 'enable', 'Off');
    set(handles.pushbutton4, 'enable', 'Off');
    set(handles.pushbutton5, 'enable', 'On');
    setappdata(hMaingui,'studyphase',5);
elseif (studyphase==5)
    %finished
    
    
    rmappdata(hMaingui,'studyphase');
    rmappdata(hMaingui, 'fhupdate_master_status');
    rmappdata(hMaingui, 'handles');
    rmappdata(hMaingui,'base_folder' );
    rmappdata(0  ,'mainHandles');
end
    

