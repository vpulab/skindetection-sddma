% DEMO FOR SKIN DETECTION BASED ON MAXIMIZATION OF AGREEMENT
% - Detection of skin & performance analysis 
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

clc;close all;clear all;

addpath 'skin/' %for skin detection functions
addpath 'utils/' %for util functions

%% compute SDDMA models (for skin pixels, mean and var of each channel)
% train_skin_models;

%% test SDDMA with local model  (compute skin map)
diary('./output/sddma/sddma_results_1ds.txt');
display = 1;
res_test{1} = sddma('datasets/img/test/test_ED', 'models/model_ED.mat', './output/sddma/ED', display);
res_test{2} = sddma('datasets/img/test/test_LIRIS', 'models/model_LIRIS.mat', './output/sddma/LIRIS', display);
res_test{3} = sddma('datasets/img/test/test_SSG', 'models/model_SSG.mat', './output/sddma/SSG', display);
res_test{4} = sddma('datasets/img/test/test_AMI', 'models/model_AMI.mat', './output/sddma/AMI', display);
res_test{5} = sddma('datasets/img/test/test_UT', 'models/model_UT.mat', './output/sddma/UT', display);

plot_test_results(res_test);
diary off;

%% test SDDMA with global model (compute skin map)
% diary('./output/sddma/sddma_results_5ds.txt');
% display = 0;
% res_test_all{1} = sddma('datasets/img/test/test_ED', 'models/model_all.mat', './output/sdmim/ED_all', display);
% res_test_all{2} = sddma('datasets/img/test/test_LIRIS', 'models/model_all.mat', './output/sdmim/LIRIS_all', display);
% res_test_all{3} = sddma('datasets/img/test/test_SSG', 'models/model_all.mat', './output/sdmim/SSG_all', display);
% res_test_all{4} = sddma('datasets/img/test/test_AMI', 'models/model_all.mat', './output/sdmim/AMI_all', display);
% res_test_all{5} = sddma('datasets/img/test/test_UT', 'models/model_all.mat', './output/sdmim/UT_all', display);
% plot_test_results(res_test_all);
% diary off;