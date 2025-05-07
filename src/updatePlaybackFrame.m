function updatePlaybackFrame(currentFrameNumber,handles)

fileList = get(handles.frame,'UserData');
showThresh = get(handles.showThresh,'Value');
threshold = floor(str2double(get(handles.threshold,'String')));
splineData = get(handles.splinePath,'UserData');
showSplines = get(handles.showSplines,'Value');

currentImage = imread(fileList{currentFrameNumber});

res = size(currentImage);

if showThresh && threshold>=0 && threshold<256
    
    currentImage(currentImage<=threshold) = 0;
    currentImage(currentImage>threshold) = 255;
    
end

set(handles.win,'NextPlot','add');

imshow(currentImage,'Parent',handles.win);
% totalNumberOfFrames = length(fileList);
% database=[];
% for ii=1:totalNumberOfFrames
%    currentfilename= char(fileList(ii));
%    currentimage = imread(currentfilename);
%    database(:,:,ii) = currentimage;
% end
% N_images=size(database,3);
% h=uicontrol('Style', 'slider',...
%         'Min',0,'Max',N_images,'Value',0.01,...
%         'Position', [0.032 0.022 0.482 0.032],...
%     'Callback',{@slider_callback});

if showSplines
    
    xSpline = splineData(2*currentFrameNumber-1,:);
    ySpline = splineData(2*currentFrameNumber,:);
    
    if ~isempty(xSpline) && mean(xSpline)
        
        plot(handles.win,xSpline,res(1)-ySpline+1,'c')
        plot(handles.win,xSpline(1),res(1)-ySpline(1)+1,'r.','MarkerSize',12)
        plot(handles.win,xSpline(end-2:end),res(1)-ySpline(end-2:end)+1,'m')
        plot(handles.win,xSpline(1:2),res(1)-ySpline(1:2)+1,'r')
        
    end
end

set(handles.currentFrameNumber,'Value',currentFrameNumber,'String',num2str(currentFrameNumber));
set(handles.slider1,'Value',currentFrameNumber);