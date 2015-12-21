function model = compute_color_model(datapath, outfile)
%% COMPUTE_COLOR_MODEL function generates a model for the adaptive skin
% analysis as described in the paper (SDDMA approach):
%   Juan C. SanMiguel & Sergio Suja, "Skin detection by dual maximization
%   of detectors agreement for video monitoring", Pattern Recognition Letters, 2013
%
% This function analyzes the correlation and the discriminative power for 
% colour channels of four colour spaces (RGB, HSV, YCbCr and LAB) and 
% calculates some statistics over the train set. This information is used
% by the SDDMA approach to select the relevant color channels to employ. 
%
% Input:
%   - datapath: root directory with the data to process (annotated and raw images, 
%       respectively in subdirs 'ann' and 'raw'). Skin annotations are indicated in 
%       pure red colour ([255 0 0]). All images must be in PNG format.
%   - outfile: filename to save the generated model (as mat file)
%
% Output: 
%   - model: the generated skin model as struct variable.
%
% Author:   Juan C. San Miguel & Sergio Surja (Video Processing and Understanding Lab)
% E-mail:   juancarlos.sanmiguel@uam.es
% URL:      http://www-vpu.eps.uam.es/~jcs
% Version & date: 1.0 (Sept 2013)
%
% Modification/redistribution granted only for the purposes of teaching, non-commercial research or study.
  