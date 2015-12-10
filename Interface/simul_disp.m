function varargout = simul_disp(varargin)
% SIMUL_DISP MATLAB code for simul_disp.fig
%      SIMUL_DISP, by itself, creates a new SIMUL_DISP or raises the existing
%      singleton*.
%
%      H = SIMUL_DISP returns the handle to a new SIMUL_DISP or the handle to
%      the existing singleton*.
%
%      SIMUL_DISP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMUL_DISP.M with the given input arguments.
%
%      SIMUL_DISP('Property','Value',...) creates a new SIMUL_DISP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simul_disp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simul_disp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simul_disp

% Last Modified by GUIDE v2.5 20-Nov-2015 20:42:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simul_disp_OpeningFcn, ...
                   'gui_OutputFcn',  @simul_disp_OutputFcn, ...
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


% --- Executes just before simul_disp is made visible.
function simul_disp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simul_disp (see VARARGIN)

% Choose default command line output for simul_disp
handles.output = hObject;
%----Kerry----%
hMaingui=getappdata(0,'mainHandles');
handles.base_folder= getappdata(hMaingui,'base_folder'); 
US_image_folder=[base_folder,'\picture_pool\US'];
CS_image_folder=[base_folder,'\picture_pool\CS\handwash'];
cd(base_folder);

[ndata, CS_img_name, alldata] =xlsread('Results.xlsx',1,'C:C');
CS_contentment_img=CS_img_name(2:6);
CS_amusement_img=CS_img_name(7:11);

[ndata, US_contentment_img_name, alldata] =xlsread('Results.xlsx',2,'H:H');
[ndata, US_amusement_img_name, alldata] =xlsread('Results.xlsx',2,'I:I');
for j=1:5
         for i=1:5
            axes(handles.axes1);
            imagesc(imread([US_image_folder,'\',(US_contentment_img_name{mod(i+j,5)+2})])); axis off; axis equal;
            
            axes(handles.axes2);
            imagesc(imread([CS_image_folder,'\',(CS_contentment_img{i})]));axis off; axis equal;
            drawnow;
            

            pause(3);
            cla(handles.axes1);
            cla(handles.axes2);
            pause(2);

            axes(handles.axes1);
            imagesc(imread([US_image_folder,'\',(US_amusement_img_name{mod(i+j,5)+2})]));axis off; axis equal;
            
            axes(handles.axes2);
            imagesc(imread([CS_image_folder,'\',(CS_amusement_img{(i)})]));axis off; axis equal;
            drawnow;
            

            pause(3);
            cla(handles.axes1);
            cla(handles.axes2);
            pause(2);


         end
end

%feed back to mainGUI
    hMaingui=getappdata(0,'mainHandles');
    fhupdate_master_status=getappdata(hMaingui,'fhupdate_master_status');
    feval(fhupdate_master_status);
    %then close
    h=msgbox('Part 2-1 completed!');
    closereq;
    return;
%----End----%
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simul_disp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simul_disp_OutputFcn(hObject, eventdata, handles) 
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
