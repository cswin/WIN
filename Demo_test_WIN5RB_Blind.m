


 clear; clc;
addpath('utilities');
addpath('./matconvnet/matlab/');
 run ('./matconvnet/matlab/vl_setupnn.m');

savepath='./';


%folderTest  = 'testsets/BSD200/';
folderTest ='testsets/Set12_O/';

%%% image noise level
noiseSigma  = 50;  

folderModel = 'model/WIN5RB_Blind/';

load(fullfile(folderModel,'SWRB_B.mat'));

showResult  = 0;
useGPU      = 0;
pauseTime   = 1;
 
IsSaveResult=1;
%%% read images
ext         =  {'*.jpg','*.png','*.bmp'};
%ext         =  {'108036.jpg','35049.jpg'};

filePaths   =  [];
for i = 1 : length(ext)
    filePaths = cat(1,filePaths, dir(fullfile(folderTest,ext{i})));
end

%%% PSNR and SSIM
PSNRs = zeros(1,length(filePaths));
SSIMs = zeros(1,length(filePaths));
Times = zeros(1,length(filePaths));

for i = 1:length(filePaths)
    
    %%% read images
    label = imread(fullfile(folderTest,filePaths(i).name));
    [H,W,Z]=size(label);
    [~,nameCur,extCur] = fileparts(filePaths(i).name);
    disp([num2str(i),'    ',filePaths(i).name,'    ',num2str(noiseSigma)]);
    if(size(label,3)>1)
     label = rgb2ycbcr(label);
     label=label(:, :, 1);
    end
    
    label = im2double(label);
    [label,isConsis]=Consistency(label);
    randn('seed',0);
    input = single(label + noiseSigma/255*randn(size(label)));
    
 
    PSNR_noise = 10*log10(1/mean((label(:)-input(:)).^2));
    tic;    
    output=NIDCN_DWRB(input,model);
    timeCur=toc;
   if isConsis<1
      output=imresize(output,[H W]);
      label=imresize(label,[H W]);
    end
    
    %%% calculate PSNR and SSIM
    [PSNRCur, SSIMCur] = Cal_PSNRSSIM(im2uint8(label),im2uint8(output),0,0);

      
    if showResult
        imshow(cat(2,im2uint8(label),im2uint8(input),im2uint8(output)));
        title([filePaths(i).name,'    ',num2str(PSNRCur,'%2.2f'),'dB','    ',num2str(SSIMCur,'%2.4f')])
        drawnow;
        pause(pauseTime)
    else
        disp([filePaths(i).name,'    ',num2str(PSNRCur,'%2.2f'),'    ',num2str(SSIMCur,'%2.4f'),'    ',num2str(timeCur,'%2.2f')]);
    end
    PSNRs(i) = PSNRCur;
    SSIMs(i) = SSIMCur;
    Times(i) = timeCur;


  if IsSaveResult
    %% Save 
     imwrite(im2uint8(label),fullfile(savepath,[nameCur '_original.bmp']));
     imwrite(im2uint8(input),fullfile(savepath,[nameCur '_noisy_N' num2str(noiseSigma)  '.bmp']));
     imwrite(im2uint8(output),fullfile(savepath,[nameCur '_recover_WIN5RB_Blind_N' num2str(noiseSigma) '.bmp']));
  end
end

disp([mean(PSNRs),mean(SSIMs),mean(timeCur)]);
 
 


