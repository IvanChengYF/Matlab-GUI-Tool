function varargout = clutch_v2(varargin)
% CLUTCH_V2 MATLAB code for clutch_v2.fig
%      CLUTCH_V2, by itself, creates a new CLUTCH_V2 or raises the existing
%      singleton*.
%
%      H = CLUTCH_V2 returns the handle to a new CLUTCH_V2 or the handle to
%      the existing singleton*.
%
%      CLUTCH_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLUTCH_V2.M with the given input arguments.
%
%      CLUTCH_V2('Property','Value',...) creates a new CLUTCH_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before clutch_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to clutch_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help clutch_v2

% Last Modified by GUIDE v2.5 05-Apr-2020 11:19:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @clutch_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @clutch_v2_OutputFcn, ...
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


% --- Executes just before clutch_v2 is made visible.
function clutch_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to clutch_v2 (see VARARGIN)

% ------------------------------------------------------------------
% If clutchGUI_V2.slx is not open : open it and bring GUI to front
% Also set model parameters to match GUI srttings
% ------------------------------------------------------------------

model_open(handles);
set(handles.datatable,'Data',cell(0,7));

% Choose default command line output for clutch_v2
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes clutch_v2 wait for user response (see UIRESUME)
% uiwait(handles.clutchGUI_V2);


% --- Outputs from this function are returned to the command line.
function varargout = clutch_v2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function model_open(handles)
% Make sure the diagram is still open
  if isempty(find_system('Name','clutchmodel_V2'))
     open_system('clutchmodel_V2');
     figure(handles.clutchGUI_V2);
     
     % Input values 
     str_m = get(handles.param_m,'String');
     str_SlopeGrade = get(handles.param_SlopeGrade,'String');
     str_Rw = get(handles.param_Rw,'String');
     str_i1 = get(handles.param_i1,'String');
     str_Rfd = get(handles.param_Rfd,'String');
     str_Q = get(handles.conparam_Q,'String');
     str_R = get(handles.conparam_R,'String');
     
     val_m = str2double(str_m);
     val_SlopeGrade = str2double(str_SlopeGrade);
     val_Rw = str2double(str_Rw);
     val_i1 = str2double(str_i1);
     val_Rfd = str2double(str_Rfd);
     val_Q = str2double(str_Q);
     val_R = str2double(str_R);
          
     assignin('base','m',val_m);
     assignin('base','SlopeGrade',val_SlopeGrade);
     assignin('base','Rw',val_Rw);
     assignin('base','i1',val_i1);
     assignin('base','Rfd',val_Rfd);
     assignin('base','Q',val_Q);
     assignin('base','R',val_R);
  end
%end function model_open



function param_m_Callback(hObject, eventdata, handles)
% hObject    handle to param_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_m as text
%        str2double(get(hObject,'String')) returns contents of param_m as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','m',NewVal);
% end input param_m

% --- Executes during object creation, after setting all properties.
function param_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function param_SlopeGrade_Callback(hObject, eventdata, handles)
% hObject    handle to param_SlopeGrade (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_SlopeGrade as text
%        str2double(get(hObject,'String')) returns contents of param_SlopeGrade as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','SlopeGrade',NewVal);
% end input param_SlopeGrade

% --- Executes during object creation, after setting all properties.
function param_SlopeGrade_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_SlopeGrade (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function param_Rw_Callback(hObject, eventdata, handles)
% hObject    handle to param_Rw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_Rw as text
%        str2double(get(hObject,'String')) returns contents of param_Rw as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','Rw',NewVal);
% end input param_Rw

% --- Executes during object creation, after setting all properties.
function param_Rw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_Rw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function param_i1_Callback(hObject, eventdata, handles)
% hObject    handle to param_i1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_i1 as text
%        str2double(get(hObject,'String')) returns contents of param_i1 as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','i1',NewVal);
% end input param_i1

% --- Executes during object creation, after setting all properties.
function param_i1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_i1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function param_Rfd_Callback(hObject, eventdata, handles)
% hObject    handle to param_Rfd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_Rfd as text
%        str2double(get(hObject,'String')) returns contents of param_Rfd as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','Rfd',NewVal);
% end input param_Rfd

% --- Executes during object creation, after setting all properties.
function param_Rfd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_Rfd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function conparam_Kx1_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kx1 as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kx1 as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kx1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kx1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Kx2_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kx2 as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kx2 as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Kp1_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kp1 as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kp1 as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Kp2_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kp2 as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kp2 as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Kp3_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kp3 as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kp3 as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kp3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Kd_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kd as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kd as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Kd1_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Kd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Kd1 as text
%        str2double(get(hObject,'String')) returns contents of conparam_Kd1 as a double

% --- Executes during object creation, after setting all properties.
function conparam_Kd1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Kd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_Q_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_Q as text
%        str2double(get(hObject,'String')) returns contents of conparam_Q as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','Q',NewVal);
% end input param_Q

% --- Executes during object creation, after setting all properties.
function conparam_Q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function conparam_R_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of conparam_R as text
%        str2double(get(hObject,'String')) returns contents of conparam_R as a double

% Ensure model is open
  model_open(handles)
% Get the new value  
  NewStrVal = get(hObject,'String');
  NewVal = str2double(NewStrVal);
% Set the Gain parameter of Block to the new value
  assignin('base','R',NewVal);
% end input param_R

% --- Executes during object creation, after setting all properties.
function conparam_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to conparam_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in conparam_calculate.
function conparam_calculate_Callback(hObject, eventdata, handles)
% hObject    handle to conparam_calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%赋所需要的模型初值
val_param_C_v = evalin('base','C_v');
val_param_I_v = evalin('base','I_v');
val_param_C_e = evalin('base','C_e');
val_param_I_e = evalin('base','I_e');
A_c = [-(val_param_C_v)/(val_param_I_v)    -((1/(val_param_I_e))+(1/(val_param_I_v)));
       0            0];
B_u_c = [0;
         1]; 
B_p_c = [(val_param_C_v)/(val_param_I_v)-(val_param_C_e)/(val_param_I_e)  1/(val_param_I_e)  1/(val_param_I_v);
         0 0 0];
B_d_c = [1
         0];
C_c = [1 0]; 
%输入Q和R，输出四个K值
str_conparam_Q = get(handles.conparam_Q,'String');
str_conparam_R = get(handles.conparam_R,'String');
val_conparam_Q = str2double(str_conparam_Q);
val_conparam_R = str2double(str_conparam_R);

matrix = [val_conparam_Q , val_conparam_R];
q = matrix(1);
r = matrix(2);
Q = [1  0;  0  0]*q; 
R0 = r;

P = are(A_c, B_u_c*inv(R0)*B_u_c',Q);    % riccati equation
M=P*B_u_c*inv(R0)*B_u_c'-A_c';
N = -inv(R0)*B_u_c';

K_x = N*P;       % K_x
hp = inv(M)*P*B_p_c;
K_p = N*hp;          % K_p
hd0 = inv(M)*P*B_d_c;
hd1 = inv(M)*hd0;
K_d = N*hd0;         % K_d
K_d1 = N*hd1;        % K_d1
K = [K_x , K_p , K_d , K_d1];

set(handles.conparam_Kx1,'String',K(1));
set(handles.conparam_Kx2,'String',K(2));
set(handles.conparam_Kp1,'String',K(3));
set(handles.conparam_Kp2,'String',K(4));
set(handles.conparam_Kp3,'String',K(5));
set(handles.conparam_Kd,'String',K(6));
set(handles.conparam_Kd1,'String',K(7));

assignin('base','K_x1',K(1));
assignin('base','K_x2',K(2));
assignin('base','K_p1',K(3));
assignin('base','K_p2',K(4));
assignin('base','K_p3',K(5));
assignin('base','K_d',K(6));
assignin('base','K_d1',K(7));
% end function conparam_calculate



% --- Executes on button press in Simulate.
function Simulate_Callback(hObject, eventdata, handles)
% hObject    handle to Simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

evalin('base','sim(''clutchmodel_V2'')')
% 仿真系统
sim('clutchmodel_V2');

cla(handles.axes1,'reset');
axes(handles.axes1) % 将axes1设置为当前坐标系，便于绘制仿真结果
% 绘制图形1
plot(output_t,output_Fc,'r');
xlabel('时间(s)');
ylabel('离合器传递扭矩(Nm)')
grid on
zoom on

cla(handles.axes2,'reset');
axes(handles.axes2) % 将axes2设置为当前坐标系，便于绘制仿真结果
% 绘制图形2
plot(output_t,output_we,'r');
hold on
plot(output_t,output_wc,'g');
legend('we','wc','Location','Best');
xlabel('时间(s)');
ylabel('转速(rpm)')
grid on
zoom on

cla(handles.axes3,'reset');
axes(handles.axes3) % 将axes3设置为当前坐标系，便于绘制仿真结果
% 绘制图形3
plot(output_t,output_Te,'r');
xlabel('时间(s)');
ylabel('发动机扭矩(Nm)')
grid on
zoom on

cla(handles.axes4,'reset');
axes(handles.axes4) % 将axes4设置为当前坐标系，便于绘制仿真结果
% 绘制图形4
plot(output_t,output_da,'r');
xlabel('时间(s)');
ylabel('冲击度(m/s^3)')
grid on
zoom on


% 计算滑摩功
S_we = trapz(output_t,output_we);
S_wc = trapz(output_t,output_wc);
S = S_we - S_wc;
set(handles.param_slipwork,'String',S);

% 计算最大冲击度
da = abs(output_da);
max_da = max(da);
set(handles.param_maxda,'String',max_da);

% 计算起步时间
z = 0;
for i = 1:10000
    z = z + 1;
    if output_we(i) == output_wc(i)
        j = z;
        break;
    end
end
set(handles.param_launchtime,'String',output_t(j));
% end simulate


function param_launchtime_Callback(hObject, eventdata, ~)
% hObject    handle to param_launchtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_launchtime as text
%        str2double(get(hObject,'String')) returns contents of param_launchtime as a double


% --- Executes during object creation, after setting all properties.
function param_launchtime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_launchtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function param_maxda_Callback(hObject, eventdata, handles)
% hObject    handle to param_maxda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_maxda as text
%        str2double(get(hObject,'String')) returns contents of param_maxda as a double


% --- Executes during object creation, after setting all properties.
function param_maxda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_maxda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function param_slipwork_Callback(hObject, eventdata, handles)
% hObject    handle to param_slipwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of param_slipwork as text
%        str2double(get(hObject,'String')) returns contents of param_slipwork as a double


% --- Executes during object creation, after setting all properties.
function param_slipwork_CreateFcn(hObject, eventdata, handles)
% hObject    handle to param_slipwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Record.
function Record_Callback(hObject, eventdata, handles)
% hObject    handle to Record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str_m = get(handles.param_m,'String');
str_SlopeGrade = get(handles.param_SlopeGrade,'String');
str_slipwork = get(handles.param_slipwork,'String');
str_maxda = get(handles.param_maxda,'String');
str_launchtime = get(handles.param_launchtime,'String');
str_Q = get(handles.conparam_Q,'String');
str_R = get(handles.conparam_R,'String');
oldData = get(handles.datatable,'Data');
newArray = {str_Q, str_R, str_m, str_SlopeGrade, str_slipwork, str_maxda, str_launchtime};
newData = [oldData;newArray];
set(handles.datatable,'Data',newData);
