function varargout = handwash_study_3_2(varargin)
% HANDWASH_STUDY_3_2 MATLAB code for handwash_study_3_2.fig
%      HANDWASH_STUDY_3_2, by itself, creates a new HANDWASH_STUDY_3_2 or raises the existing
%      singleton*.
%
%      H = HANDWASH_STUDY_3_2 returns the handle to a new HANDWASH_STUDY_3_2 or the handle to
%      the existing singleton*.
%
%      HANDWASH_STUDY_3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDWASH_STUDY_3_2.M with the given input arguments.
%
%      HANDWASH_STUDY_3_2('Property','Value',...) creates a new HANDWASH_STUDY_3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before handwash_study_3_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to handwash_study_3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help handwash_study_3_2

% Last Modified by GUIDE v2.5 08-Dec-2015 20:42:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @handwash_study_3_2_OpeningFcn, ...
                   'gui_OutputFcn',  @handwash_study_3_2_OutputFcn, ...
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


% --- Executes just before handwash_study_3_2 is made visible.
function handwash_study_3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to handwash_study_3_2 (see VARARGIN)

% Choose default command line output for handwash_study_3_2
handles.output = hObject;
%Kerry
handles.base_folder= uigetdir;   
handles.CS_image_folder=[handles.base_folder,'\picture_pool\CS\handwash'];
cd(handles.base_folder);
[ndata, CS_img_name, alldata] =xlsread('Results.xlsx',1,'C:C');

cd(handles.CS_image_folder);
dirData = dir('*.jpg');        
handles.fileNames_contentment = CS_img_name(2:6);
handles.fileNames_amusement = CS_img_name(7:11);
handles.img_cob_mt=zeros(length(handles.fileNames_contentment),length(handles.fileNames_amusement));
for kk=1:length(handles.img_cob_mt(:))
    handles.img_cob_mt(kk)=kk;
end

cd(handles.base_folder);

handles.Questions={'content?';'amused?';'awed?';'excited?'};

handles.img_quest_mt=zeros(length(handles.img_cob_mt(:)),length(handles.Questions));
for kk=1:length(handles.img_quest_mt(:))
    handles.img_quest_mt(kk)=kk;
end


handles.display_order_max=length(handles.fileNames_amusement).*length(handles.fileNames_contentment).*length(handles.Questions);
handles.display_order=randperm(handles.display_order_max);
handles.display_no=1;

handles.results=cell(handles.display_order_max,4); %1: left display; 2: right display; 3: Question; 4:Choose


%end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes handwash_study_3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = handwash_study_3_2_OutputFcn(hObject, eventdata, handles) 
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
begin=( handles.display_no==1);
cd(handles.CS_image_folder);
if (handles.display_no<=handles.display_order_max)
    set(handles.pushbutton1, 'String', 'Next');
    
    [comb_no, Qes_no]=find(handles.img_quest_mt==handles.display_order(handles.display_no));
    [ct_img_no, am_img_no]=find(handles.img_cob_mt==comb_no);
    
    if(randi(2)==1) %same properbility on two sides
        axes(handles.axes1);
        I = imread(handles.fileNames_amusement{am_img_no});
        imagesc(I); axis equal; axis off;
        axes(handles.axes2);
        I = imread(handles.fileNames_contentment{ct_img_no});
        imagesc(I); axis equal; axis off;
        drawnow;
        handles.results(handles.display_no,1)=handles.fileNames_amusement(am_img_no);
        handles.results(handles.display_no,2)=handles.fileNames_contentment(ct_img_no);
    else
        axes(handles.axes2);
        I = imread(handles.fileNames_amusement{am_img_no});
        imagesc(I); axis equal; axis off;
        axes(handles.axes1);
        I = imread(handles.fileNames_contentment{ct_img_no});
        imagesc(I); axis equal; axis off;
        drawnow;
        handles.results(handles.display_no,1)=handles.fileNames_contentment(ct_img_no);
        handles.results(handles.display_no,2)=handles.fileNames_amusement(am_img_no);
    end
    
    set(handles.text1, 'String', 'Which image makes you feel more ');
    set(handles.text2, 'String', handles.Questions(Qes_no),'FontWeight','bold');
    handles.results(handles.display_no,3)=handles.Questions(Qes_no);
    % collect previous result
    if(begin) %first click, nothing to collect
    else
        if (get(handles.radiobutton1,'Value') ==1)
            handles.results(handles.display_no-1,4)= handles.results(handles.display_no-1,1);
        else
            handles.results(handles.display_no-1,4)= handles.results(handles.display_no-1,2);
        end
    end
    cd(handles.base_folder);
    handles.display_no=handles.display_no+1;
    
else
    %get last result
    if (get(handles.radiobutton1,'Value') ==1)
        handles.results(handles.display_no-1,4)= handles.results(handles.display_no-1,1);
    else
        handles.results(handles.display_no-1,4)= handles.results(handles.display_no-1,2);
    end
    set(handles.pushbutton1, 'String', 'Finished');
    %notify this pahse is end
    cd(handles.base_folder);
   %-------------- wirte to xlsx file--------------------%
    A= {'Left Display', 'Right Display','Question','Choose'};
    for i=1:handles.display_order_max
        A= cat(1, A, {handles.results{i,1},handles.results{i,2},handles.results{i,3},handles.results{i,4}});
    end
    sheet = 4;
    xlRange = ['A','1'];
    filename='Results.xlsx';
    xlswrite(filename,A,sheet,xlRange);
    
    h=msgbox('Part 3-2 completed!');
    closereq;
    return;
     
end

set(handles.pushbutton1,'enable','off');

set(handles.radiobutton1,'Value', 0);
set(handles.radiobutton2,'Value', 0);



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


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
 axis equal; axis off


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radiobutton1.
function radiobutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
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
set(handles.pushbutton1,'enable','on');
