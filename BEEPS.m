% /*==================================================================*\
% | Eaton Lee                                                          |
% | China                                                              |
% |                                                                    |
% | Github: https://github.com/EatonL                                  |
% | CSDN: https://blog.csdn.net/bazhidao0031                           |
% \===================================================================*/

% /*==================================================================*\
% | This work is based on the following paper:                         |
% |                                                                    |
% | P. Thevenaz, D. Sage, M. Unser                                     |
% | Bi-Exponential Edge-Preserving Smoother                            |
% | IEEE Transactions on Image Processing, in press                    |
% |                                                                    |
% | Other relevant on-line publications are available at               |
% | http://bigwww.epfl.ch/publications/                                |
% \===================================================================*/

[FileName,PathName]=uigetfile({'*.jpg';'*.png';'*.bmp';'*.jpeg'},'Open an Image File');
img = imread([PathName FileName]);
figure,imshow(img);
img=double(img);

lambda=1.05;
sigma=14;

%  Separated into three channels

img1=img(:,:,1);
img2=img(:,:,2);
img3=img(:,:,3);

[row,column]=size(img1);
len=numel(img1(:));

%  Initialization 

for i=1:1:6
    eval(['tempimg',num2str(i),'=zeros(row,column);']);
end

for i=1:1:3
     eval(['psi',num2str(i),'=zeros(1,len);']);
     eval(['phi',num2str(i),'=zeros(1,len);']);
     eval(['X',num2str(i),'=zeros(1,len);']);
     eval(['Y',num2str(i),'=zeros(1,len);']);
     
     % ..................................................................
     % 	BEEPSHorizontalVertical 
     % ..................................................................    
     
     eval(['tempimg',num2str(1+2*(i-1)),'=horizon(img',num2str(i),',len,row,column,lambda,sigma,1);']);
     eval(['tempimg',num2str(1+2*(i-1)),'=vertical(tempimg',num2str(1+2*(i-1)),',len,row,column,lambda,sigma,2);']);
     
     % ..................................................................
     % 	BEEPSVerticalHorizontal 
     % ..................................................................
     
     eval(['tempimg',num2str(2*i),'=vertical(img',num2str(i),',len,row,column,lambda,sigma,2);']);
     eval(['tempimg',num2str(2*i),'=horizon(tempimg',num2str(2*i),',len,row,column,lambda,sigma,1);']);
     
end

% Average of the row-?rst and column-?rst separable application of the BEEPS.

tempimg7=(tempimg1+tempimg2)/2;
tempimg8=(tempimg3+tempimg4)/2;
tempimg9=(tempimg5+tempimg6)/2; 

img(:,:,1)=tempimg7;
img(:,:,2)=tempimg8;
img(:,:,3)=tempimg9;

figure,imshow(uint8(img));
