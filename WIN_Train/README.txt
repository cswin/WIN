% ======================================================================
% This is the training (Gaussian denoising) demo of the paper "Learning Distribution Prior with Wider Convolution for Image Denoising"

% Version:       1.0 (07/24/2017)


% ------ Contents -----------------------------------------------------
Generate_Training_DATA: Generate all h5 data for training
----data
    ----BSD200Train : 200 images from BSD500 for training
    ----BSD100VAl   : 100 images from BSD100 for validation
----utilities
    ----relevant code for generating data
----generate_test_data.m  : generate validation data for single noise level model
----generate_train_data.m : generate train data  for single noise level model
----generate_train_Blind.m: generate train data for blind denoising
----generate_test_Blind.m : generate test validation for blind denoising


WIN5_solver.prototxt  WIN5_net.prototxt   :  to  Train WIN5
WIN5R_solver.prototxt WIN5R_net.prototxt  :  to  Train WIN5R
WIN5RB_solver.prototxt WIN5RB_net.prototxt:  to  Train WIN5RB
WIN5RB_Blind_solver.prototxt  WIN5RB_Blind_net.prototxt : to Train WIN5RB_Blind
% ----------------------------------------------------------------------
Usage:


1. Place the "WIN_Train" folder into "($Caffe_Dir)/examples/"
2. Open MATLAB and direct to ($Caffe_Dir)/example/WIN_Train, run
"generate_train_data.m" and "generate_test_data.m" to generate training and test data.
3. To train our WIN, run
./build/tools/caffe train --solver examples/WIN_Train/WIN_solver.prototxt
4. After training, you can extract parameters from the caffe model and save
 them in the format that can be used in our test package.
To do this, you need to install mat-caffe first,
then open MATLAB and direct to ($Caffe_Dir) and run "caffemodel2mat_*.m”.
The "($Caffe_Dir)/examples/WIN_Train/WIN.mat" will be there for you.



% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
% ----------------------------------------------------------------------
%  
% ----------------------------------------------------------------------
