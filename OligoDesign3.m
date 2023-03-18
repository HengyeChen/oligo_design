function varargout = OligoDesign3(varargin)
% OLIGODESIGN2 MATLAB code for OligoDesign2.fig
%      OLIGODESIGN2, by itself, creates a new OLIGODESIGN2 or raises the existing
%      singleton*.
%
%      H = OLIGODESIGN2 returns the handle to a new OLIGODESIGN2 or the handle to
%      the existing singleton*.
%
%      OLIGODESIGN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OLIGODESIGN2.M with the given input arguments.
%
%      OLIGODESIGN2('Property','Value',...) creates a new OLIGODESIGN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OligoDesign2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OligoDesign2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OligoDesign2

% Last Modified by GUIDE v2.5 18-Mar-2023 19:21:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OligoDesign2_OpeningFcn, ...
                   'gui_OutputFcn',  @OligoDesign2_OutputFcn, ...
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


% --- Executes just before OligoDesign2 is made visible.
function OligoDesign2_OpeningFcn(hObject, eventdata, handles, varargin)
global lowLimit;
global highLimit;
handles.output = hObject;
guidata(hObject, handles);
lowLimit = str2num(get(handles.lowLimit,'string'));
highLimit = str2num(get(handles.highLimit,'string'));
factorFile_Callback(hObject, eventdata, handles);
bckFile_Callback(hObject, eventdata, handles);



% --- Outputs from this function are returned to the command line.
function varargout = OligoDesign2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function factorFile_Callback(hObject, eventdata, handles)
global factor_single_site;
global factor_scanning;
global facotr_copyN_spacing;
global factor_combi;
global factor_native;
if isfile(get(handles.factorFile,'string'))
file = get(handles.factorFile,'string');
[N,factor_single_site] = xlsread(file,'set1_single_sites');
[N,factor_scanning] = xlsread(file,'set2_single_scanning');
[N,facotr_copyN_spacing] = xlsread(file,'set3_Ncopy_spacing');
%[N,factor_combi] = xlsread(file,'set4_factor_combination');
[N,factor_native] = xlsread(file,'set4_native');

set(handles.f1N, 'string', num2str(size(factor_single_site,1)-1));
set(handles.f2N, 'string', num2str(size(factor_scanning,1)-1));
set(handles.f3N, 'string', num2str(size(facotr_copyN_spacing,1)-1));
%set(handles.f4N, 'string', num2str(size(factor_combi,1)-1));
set(handles.f5N, 'string', num2str(size(factor_native,1)-1));
set(handles.load2, 'value',1);
end



function bckFile_Callback(hObject, eventdata, handles)
global bckSeq;
seqFile = get(handles.bckFile,'String');
if isfile(seqFile)
bckSeq = textread(seqFile,'%s');
bckSeq = char(bckSeq);
if length(bckSeq)~=147
    set(handles.message,'string','background length is not equal to 147!!');
end
end
set(handles.load1,'value',1);



% --- Executes during object creation, after setting all properties.
function bckFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bckFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function N1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f1N_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function f1N_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set1Para1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function set1Para1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set1Para2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function set1Para2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set1Para3_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function set1Para3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in write_single_factors.
function write_single_factors_Callback(hObject, eventdata, handles)
global factor_single_site;
set(handles.message,'string','-');
set(handles.warning1,'string','-');

N_fac = str2num(get(handles.f1N,'string'));
N_bs = str2num(get(handles.set1Para1,'string'));
StartLoc = str2num(get(handles.set1Para2,'string'))+74;
Dis = str2num(get(handles.set1Para3,'string'));

[seqTotal,intendW,intendC] = ...
    seqOrganizer(factor_single_site,'Motif (highest score)','Motif (mutation 2bp)',...
    StartLoc, N_bs, Dis,handles); 

Ntotal = length(seqTotal);
set(handles.N1,'string',num2str(Ntotal));

[file1,file2,file3] = outputFile (handles, 1);
dlmcell(file1,seqTotal);
xlswrite(file2,intendW');
xlswrite(file3,intendC');




% major function in generating the sequence    
function [seqTotal,intendW,intendC] = seqOrganizer(T,csStr,mutStr,StartLoc, N_bs, Dis,handles) 
h=msgbox('Creating Sequences...');
%%
%csStr,mutStr stands for the corresponding variable name in the excel file
title = T(1,:);
ind = find(ismember(title,csStr));
bsTotal = strtrim(T(2:end,ind));
factorTotal = T(2:end,1);
%%
Location = LocationGenerate(StartLoc, N_bs, Dis);%cell array of vectors
% first sub-set, use the consensus motif, + direction
%%
[seqTotal,intendW,intendC,error] = SeqGenerate(bsTotal,factorTotal,Location,0);
%bsTotal\factorTotal can be single or 3-column motif\factorname cell array,
%locaton is a cell array of vectors which contains the 
%%
if get(handles.reverse,'value')
    [seqTotal2,intendW2,intendC2,error2] = SeqGenerate(bsTotal,factorTotal,Location,1);
    seqTotal = [seqTotal; seqTotal2];
    intendW = [intendW,intendW2];
    intendC = [intendC,intendC2];
    error = error+error2;
end
if get(handles.mute,'value')
    ind = find(ismember(title,mutStr));
    bsTotalmut = strtrim(T(2:end,ind));
    [seqTotal3,intendW3,intendC3,error3] = SeqGenerate(bsTotalmut,factorTotal,Location,0,1);
    seqTotal = [seqTotal;seqTotal3];
    intendW = [intendW,intendW3];
    intendC = [intendC,intendC3];
    error = error+error3;
end
if get(handles.mute,'value') && get(handles.reverse,'value')
    [seqTotal4,intendW4,intendC4,error4] = SeqGenerate(bsTotalmut,factorTotal,Location,1,1);
    seqTotal = [seqTotal;seqTotal4];
    intendW = [intendW, intendW4];
    intendC = [intendC, intendC4];
    error = error+error4;
end
if error > 0
    %set(handles.message,'string','error in generating oligo sequence');
end
close(h);



%--------------------------------------------------------------------------------------    
function [seqTotal,intendW,intendC,error] = SeqGenerate(bsTotal,factorTotal,Location,rev,mut)
%bsTotal\factorTotal can be single or 3-column motif\factorname cell array,
%locaton is a cell array of vectors which contains the 

if nargin<5
    mut = 0;
end

seqTotal = {}; count=1;
intendW = {}; intendC={};
%[~,ia,~] = unique(factorTotal);
[factorTotal,ia,~] = uniquecrows(factorTotal);
bsTotal=bsTotal(ia,:);
%%
for i = 1:size(bsTotal,1) % go through all factors one by one
    bs = bsTotal(i,:);%multiple rows in the case of combination
    if rev
        bsRev =  seqrcomplement(char(bs));
        if strcmp(char(bs),bsRev) % if palindromic sequence
            continue;
        end
        bs = cellstr(bsRev);%change the bs to reverse compliment
    end    
    factor = factorTotal(i,:);
    
    for j = 1:length(Location) % how many binding sites?  
        %basically duplicate the motif when one motif needs to be at
        %multiple positions
        Loc = Location{j};
        if length(bs) == 1 %only one facotr/binding site, but may have 
            %multiple copies when at the copy number set
            bsFinal = repmat(bs,[1,length(Loc)]);
            factorFinal = repmat(factor,[1,length(Loc)]); %
        else %might be involved in the combination set, bs and factor are 
            %already with multiple elements
            bsFinal = bs;
            factorFinal = factor;
        end
        %%
        %core function to produce the changed sequence
        [seq,error,change,LocOut] = oligoSeq(bsFinal, Loc); 
        %generate the binding site based on background
        %%
        if error == 0 % if no error in generating the sequence            
            seqTotal{count,1} = seq;
            intendW(count) = {''};
            intendC(count) = {''};            
            % update intend file            
            for k=1:length(factorFinal) %if there're multiple factor binding sites on one oligo, then combine them into one row
                if ~rev %on watson
                    if mut
                        str = strcat('mut',',',num2str(LocOut(k)-74));
                    else
                        str = strcat(',',num2str(LocOut(k)-74));
                    end
                    intendW{count} = strcat(intendW{count},char(factorFinal(k)),str,';');   % row:oligo #, column,factor
                    intendC{count} = '*';
                else%on crick
                    if mut
                        str = strcat('mut',',',num2str(LocOut(k)-74));
                    else
                        str = strcat(',',num2str(LocOut(k)-74));
                    end
                    intendC{count} = strcat(intendC{count},char(factorFinal(k)),str,';');
                    intendW{count} = '*';
                end
            end
            count=count+1; %number of sequences
        end
    end
end


  
%--------------------------------------------------------------------------
% generate location cell
function Location = LocationGenerate(StartLoc, N_bs, Dis)
count = 1;

for i = 1:length(N_bs)
    copyN = N_bs(i);
    for j = 1:length(StartLoc)
        if copyN~=1
            for k=1:length(Dis)
                Location{count} = [StartLoc(j):Dis(k):StartLoc(j)+Dis(k)*(copyN-1)];
                count = count + 1;
            end
        else
            Location{count} = StartLoc(j);
            count = count + 1;
        end
    end
end




%--------------------------------------------------------------------------
function [file1,file2,file3] = outputFile (handles, setN)
folder = get(handles.writeFolder,'string');
fileName = strcat('oligoSet',num2str(setN),'_');

A = dir(folder);
isub = [A(:).isdir]; %# returns logical vector
folderName = {A(isub).name}';
C = strfind(folderName, fileName);
D = find(~cellfun(@isempty,C));

if isempty(D)
    lastFileN=0;
else
    E = sort(folderName(D));
    lastFile = char(E(end));
    index1 = regexp(lastFile,'_');
    lastFileN = str2num(lastFile(index1+1:end));
end

newfolder = strcat(folder,fileName, num2str(lastFileN+1));
mkdir(newfolder);
file1 = strcat(newfolder,'\',fileName,'.txt');
file2 = strcat(newfolder,'\',strcat(fileName,'intendedW.xlsx'));
file3 = strcat(newfolder,'\',strcat(fileName,'intendedC.xlsx'));

%--------------------------------------------------------------------------   


function N2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function N2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N3_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function N3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f3N_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function f3N_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bsN3_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function bsN3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f2N_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function f2N_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set2Para1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set2Para1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set2Para3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set2Para3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set2Para2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set2Para2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in write_scanning.
function write_scanning_Callback(hObject, eventdata, handles)
global factor_scanning;
seqTotal = {}; count=1;
set(handles.message,'string','-');
set(handles.warning1,'string','-');

N_fac = str2num(get(handles.f2N,'string'));
N_bs = str2num(get(handles.set2Para1,'string'));
Dis = str2num(get(handles.set2Para2,'string'));
scanStart = str2num(get(handles.set2Para3,'string'))+74;
scanEnd = str2num(get(handles.set2Para4,'string'))+74;
scanInterval = str2num(get(handles.set2Para5,'string'));
StartLoc = [scanStart:scanInterval:scanEnd];

[seqTotal,intendW,intendC] = seqOrganizer(factor_scanning,'Motif (highest score)','Motif (mutation 2bp)',StartLoc, N_bs, Dis,handles); 

Ntotal = length(seqTotal);
set(handles.N2,'string',num2str(Ntotal));

[file1,file2,file3] = outputFile (handles, 2);
dlmcell(file1,seqTotal);
xlswrite(file2,intendW');
xlswrite(file3,intendC');




function set2Para4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set2Para4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set2Para5_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set2Para5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%-------------------------------------------------------------------------

% --- Executes during object creation, after setting all properties.
function factorFile_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set3Para1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set3Para1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set3Para2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set3Para2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function set3Para3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set3Para3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in writeSet3.
function writeSet3_Callback(hObject, eventdata, handles)
global T3;
seqTotal = {}; count=1;
set(handles.message,'string','-');
set(handles.warning1,'string','-');

N_fac = str2num(get(handles.f3N,'string'));
N_bs = str2num(get(handles.set3Para1,'string'));
StartLoc = str2num(get(handles.set3Para2,'string'))+74;
Dis = str2num(get(handles.set3Para3,'string'));

[seqTotal1,intendW1,intendC1] = seqOrganizer(T3,'Motif1','-',StartLoc, N_bs, Dis,handles); 
[seqTotal2,intendW2,intendC2] = seqOrganizer(T3,'Motif2','-',StartLoc, N_bs, Dis,handles); 
[seqTotal3,intendW3,intendC3] = seqOrganizer(T3,'Motif3','-',StartLoc, N_bs, Dis,handles); 

Ntotal = length([seqTotal1;seqTotal2;seqTotal3]);
set(handles.N3,'string',num2str(Ntotal));

[file1,file2,file3] = outputFile (handles, 3);
dlmcell(file1,[seqTotal1;seqTotal2;seqTotal3]);
xlswrite(file2,[intendW1,intendW2,intendW3]');
xlswrite(file3,[intendC1,intendC2,intendC3]');



function writeFolder_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function writeFolder_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function N4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set4Para1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set4Para1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set4Para2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function set4Para2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in writeCombi.
function writeCombi_Callback(hObject, eventdata, handles)
global factor_combi;
seqTotal = {}; count=1;
set(handles.message,'string','-');
set(handles.warning1,'string','-');

StartLoc = str2num(get(handles.set4Para2,'string'))+74;
Dis = str2num(get(handles.set4Para1,'string'));
Location = LocationGenerate(StartLoc, 3, Dis);

title = factor_combi(1,:);
ind = find(ismember(title,'FactorCombi'));
factorTotal = factor_combi(2:end,ind);
ind = find(ismember(title,'MotifCombi'));
bsTotal = factor_combi(2:end,ind);

if length(ind)==1
    factorTotal = [factorTotal,factorTotal,factorTotal];
    bsTotal = [bsTotal, bsTotal, bsTotal];
end

if size(bsTotal,2)~=3
    set(handles.message,'string','Combination must have 3 column of factors');
    return;
end


if get(handles.set4Option1,'value')
    factorTotal = [[{'-'},{'-'},{'-'}];factorTotal];
    bsTotal = [[{'-'},{'-'},{'-'}];bsTotal];
end
% combination of factors and binding sites

bs1 = bsTotal(:,1);
bs1 = bs1(~cellfun('isempty',bs1));
bs2 = bsTotal(:,2);
bs2 = bs2(~cellfun('isempty',bs2));
bs3 = bsTotal(:,3);
bs3 = bs3(~cellfun('isempty',bs3));
factor1 = factorTotal(:,1);
factor1 = factor1(~cellfun('isempty',factor1));
factor2 = factorTotal(:,2);
factor2 = factor2(~cellfun('isempty',factor2));
factor3 = factorTotal(:,3);
factor3 = factor3(~cellfun('isempty',factor3));
  

count = 1;
for i=1:length(bs1)
    for j = 1:length(bs2)
        for k=1:length(bs3)
            bsComb(count,:) = [bs1(i),bs2(j),bs3(k)];
            factorComb(count,:) = [factor1(i),factor2(j),factor3(k)];
            count = count+1;
        end
    end
end

[seqTotal,intendW,intendC,error] = SeqGenerate(bsComb,factorComb,Location,0);

Ntotal = length(seqTotal);
set(handles.N4,'string',num2str(Ntotal));

[file1,file2,file3] = outputFile (handles, 4);
dlmcell(file1,seqTotal);
xlswrite(file2,intendW');
xlswrite(file3,intendC');



%function f4N_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
% function f4N_CreateFcn(hObject, eventdata, handles)
% 
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in load1.
function load1_Callback(hObject, eventdata, handles)


% --- Executes on button press in repeat1.
function repeat1_Callback(hObject, eventdata, handles)

if get(hObject,'Value')
    para1 = get(handles.set1Para1,'string');
    para2 = get(handles.set1Para2,'string');
    para3 = get(handles.set1Para3,'string');
    set(handles.set3Para1,'string',para1);
    set(handles.set3Para2,'string',para2);
    set(handles.set3Para3,'string',para3);
end


% --- Executes on button press in load2.
function load2_Callback(hObject, eventdata, handles)
% hObject    handle to load2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of load2



function f5N_Callback(hObject, eventdata, handles)
% hObject    handle to f5N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f5N as text
%        str2double(get(hObject,'String')) returns contents of f5N as a double


% --- Executes during object creation, after setting all properties.
function f5N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f5N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set5para1_Callback(hObject, eventdata, handles)
% hObject    handle to set5para1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set5para1 as text
%        str2double(get(hObject,'String')) returns contents of set5para1 as a double


% --- Executes during object creation, after setting all properties.
function set5para1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set5para1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set5Para2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function set5Para2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set5Para3_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function set5Para3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in write_native.
function write_native_Callback(hObject, eventdata, handles)
global factor_native;

set(handles.message,'string','-');
set(handles.warning1,'string','-');

N_bs = str2num(get(handles.set1Para1,'string'));
StartLoc = str2num(get(handles.set5Para2,'string'))+74-10;%take the flanking sequence length into account
N_fac = str2num(get(handles.f1N,'string'));
Dis = str2num(get(handles.set1Para3,'string'));


[seqTotal,intendW,intendC] = seqOrganizer(factor_native,'Native (with 10bp up/downstream)',...
    'Native mut(with 10bp up/downstream)',StartLoc, N_bs, Dis,handles); 

Ntotal = length(seqTotal);
set(handles.N5,'string',num2str(Ntotal));

[file1,file2,file3] = outputFile (handles, 4);
dlmcell(file1,seqTotal);
xlswrite(file2,intendW');
xlswrite(file3,intendC');



function lowLimit_Callback(hObject, eventdata, handles)
% hObject    handle to lowLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowLimit as text
%        str2double(get(hObject,'String')) returns contents of lowLimit as a double


% --- Executes during object creation, after setting all properties.
function lowLimit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highLimit_Callback(hObject, eventdata, handles)
% hObject    handle to highLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highLimit as text
%        str2double(get(hObject,'String')) returns contents of highLimit as a double


% --- Executes during object creation, after setting all properties.
function highLimit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highLimit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit39_Callback(hObject, eventdata, handles)
% hObject    handle to N3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N3 as text
%        str2double(get(hObject,'String')) returns contents of N3 as a double


% --- Executes during object creation, after setting all properties.
function edit39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to f3N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f3N as text
%        str2double(get(hObject,'String')) returns contents of f3N as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f3N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to set3Para1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set3Para1 as text
%        str2double(get(hObject,'String')) returns contents of set3Para1 as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set3Para1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit42_Callback(hObject, eventdata, handles)
% hObject    handle to set3Para2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set3Para2 as text
%        str2double(get(hObject,'String')) returns contents of set3Para2 as a double


% --- Executes during object creation, after setting all properties.
function edit42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set3Para2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit43_Callback(hObject, eventdata, handles)
% hObject    handle to set3Para3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set3Para3 as text
%        str2double(get(hObject,'String')) returns contents of set3Para3 as a double


% --- Executes during object creation, after setting all properties.
function edit43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set3Para3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in write_copyN_spacing.
function write_copyN_spacing_Callback(hObject, eventdata, handles)
% hObject    handle to write_copyN_spacing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global facotr_copyN_spacing;

set(handles.message,'string','-');
set(handles.warning1,'string','-');

N_fac = str2num(get(handles.f3N,'string'));
N_bs = str2num(get(handles.set3Para1,'string'));
StartLoc = str2num(get(handles.set3Para2,'string'))+74;
Dis = str2num(get(handles.set3Para3,'string'));

[seqTotal,intendW,intendC] = ...
    seqOrganizer(facotr_copyN_spacing,'Motif (highest score)','Motif (mutation 2bp)',...
    StartLoc, N_bs, Dis,handles); 
    

Ntotal = length(seqTotal);
set(handles.N3,'string',num2str(Ntotal));
    
[file1,file2,file3] = outputFile (handles, 3);
dlmcell(file1,seqTotal);
xlswrite(file2,intendW');
xlswrite(file3,intendC');



function N5_Callback(hObject, eventdata, handles)
% hObject    handle to N5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N5 as text
%        str2double(get(hObject,'String')) returns contents of N5 as a double


% --- Executes during object creation, after setting all properties.
function N5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 


% --- Executes on button press in load_bkg_file.
function load_bkg_file_Callback(hObject, eventdata, handles)
% hObject    handle to load_bkg_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,~] = uigetfile('C:\'...
    ,'Select background seq:');
set(handles.bckFile,'string',fullfile(PathName,FileName));
bckFile_Callback(handles.bckFile,[], handles);


% --- Executes on button press in load_factor_list.
function load_factor_list_Callback(hObject, eventdata, handles)
% hObject    handle to load_factor_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,~] = uigetfile('C:\'...
    ,'Load Factor List:');
set(handles.factorFile,'string',fullfile(PathName,FileName));
factorFile_Callback(handles.bckFile, [], handles);


% --- Executes on button press in outfolder_selection.
function outfolder_selection_Callback(hObject, eventdata, handles)
% hObject    handle to outfolder_selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
foldername = uigetdir('C:\Users\bailab\Dropbox\Work\oligo_design\'...
    ,'Select out folder:');
set(handles.writeFolder,'string',foldername);
