% DEMO FOR SKIN DETECTION BASED ON MAXIMIZATION OF AGREEMENT
% - Training of skin models for new data
% 
% Please cite this paper if you use this code:
%   Juan C. SanMiguel & Sergio Suja, "Skin detection by dual maximization
%   of detectors agreement for video monitoring", Pattern Recognition Letters, 2013
%
% Author:   Juan C. San Miguel & Sergio Surja (Video Processing and Understanding Lab)
% E-mail:   juancarlos.sanmiguel@uam.es
% URL:      http://www-vpu.eps.uam.es/~jcs
% Version & date: 1.0 (Sept 2013)
%
% Modification/redistribution granted only for the purposes of teaching, non-commercial research or study.
clc; close all;clear all;

addpath 'skin/' %for skin detection functions
addpath 'utils/' %for util functions

%% compute models for skin pixels (to be used by SDDMA)
% diary('./output/sdmim_train.txt');
res_train{1} = compute_color_model('datasets/img/train/train_ED','models/model_ED.mat');
res_train{2} = compute_color_model('datasets/img/train/train_LIRIS','models/model_LIRIS.mat');
res_train{3} = compute_color_model('datasets/img/train/train_SSG', 'models/model_SSG.mat');
res_train{4} = compute_color_model('datasets/img/train/train_AMI','models/model_AMI.mat');
res_train{5} = compute_color_model('datasets/img/train/train_UT','models/model_UT.mat');
plot_train_results(res_train);
res_train_all = compute_color_model_all('datasets/img/train','models/model_all.mat');
% diary off;