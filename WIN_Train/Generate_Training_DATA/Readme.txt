% ======================================================================
% This is the training (Gaussian denoising) demo of the paper "Learning Distribution Prior with Wider Convolution for Image Denoising"
Please contact with : Peng Liu  pliu1@ufl.edu    
% Version:       1.2 (08/2/2017)
 

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

% ----------------------------------------------------------------------



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
 Please contact with : Peng Liu  pliu1@ufl.edu   
% ----------------------------------------------------------------------
