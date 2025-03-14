function varargout = launch(varargin)
% LAUNCH MATLAB code for launch.fig
%      LAUNCH, by itself, creates a new LAUNCH or raises the existing
%      singleton*.
%
%      H = LAUNCH returns the handle to a new LAUNCH or the handle to
%      the existing singleton*.
%
%      LAUNCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAUNCH.M with the given input arguments.
%
%      LAUNCH('Property','Value',...) creates a new LAUNCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before launch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to launch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help launch

% Last Modified by GUIDE v2.5 01-Jul-2019 11:58:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @launch_OpeningFcn, ...
                   'gui_OutputFcn',  @launch_OutputFcn, ...
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


% --- Executes just before launch is made visible.
function launch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to launch (see VARARGIN)

% Choose default command line output for launch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes launch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = launch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in darkField.
function darkField_Callback(hObject, eventdata, handles)
% hObject    handle to darkField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
record_DF
close launch

% --- Executes on button press in brightField.
function brightField_Callback(hObject, eventdata, handles)
% hObject    handle to brightField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
camera_gui
close launch
