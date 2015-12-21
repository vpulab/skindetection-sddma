function plot_train_results (res_train)
% PLOT_TRAIN_RESULTS generates visual and textual summaries of the training
% stage performed.
% 
% Input: 'res_train' variable provided by the function
% "compute_color_model" or "compute_color_model_all"
%
% Author:   Juan C. San Miguel & Sergio Surja (VPU-Lab)
% E-mail:   juancarlos.sanmiguel@uam.es
% URL:      http://www-vpu.eps.uam.es/~jcs
% Version & date: 1.0 (Sept 2013)

for i=1:numel(res_train)
    
    %skin pixel proportions
    Mean_prop(i) = res_train{i}.skin_prop_m;
    Max_prop(i)  = res_train{i}.skin_prop_max;
    Min_prop(i)  = res_train{i}.skin_prop_min;
    
    %
    ch_corr_acc(:,:,i) = res_train{i}.ch_corr;
    model_acc(:,:,i) = res_train{i}.model;
    RatioTDet(:,i) = res_train{i}.ratio_det_m;
    RatioCDet(:,i) = res_train{i}.ratio_cdet_m;
    
    skin_pix(i) = res_train{i}.total_skin_pix;
    tot_pix(i) = res_train{i}.total_pix;
    Nima(i) = res_train{i}.Nima;    
end

fprintf('\n\nSUMMARY OF TRAINING \n');
fprintf('\tTotal number of pixels = %d (%d images)\n\tTotal number of skin pixels = %d (%.2f %%)\n', sum(tot_pix), sum(Nima), sum(skin_pix), 100*sum(skin_pix)/sum(tot_pix));

fprintf('GAUSSIAN MODELS (M - mean, V - variance)\n\t\t');
for j = 1:size(res_train{1}.model,2)/2
    fprintf('M C%d\tvarMC%d\tV C%d\tvarVC%d\t', j,j,j,j);
end
fprintf('\n');
for i = 1:size(res_train{1}.model,1)
    fprintf('%s\t\t', res_train{1}.model_type{i});
    for j = 1:size(res_train{1}.model,2)
        fprintf('%.3f\t', mean(model_acc(i,j,:)));
        fprintf('%.3f\t', std(model_acc(i,j,:)));
    end
    fprintf('\n');
end

fprintf('\nCHANNEL CORRELATION\n\t');
for i = 1:numel(res_train{1}.ch_corr_type{1})
    fprintf('\t%s\t', res_train{1}.ch_corr_type{1}(i));
end
fprintf('\n');
for i=1:12
    fprintf('%s\t', res_train{1}.ch_corr_type{1}(i));
    for j=1:12
        if res_train{1}.ch_corr(i,j) ~= -1
            fprintf('\t%.2f',mean(ch_corr_acc(i,j,:)));
        else
             fprintf('\t  -  ');
        end
    end
    fprintf('\n');
end

fprintf('\nMEAN DETECTION RATIO (Tdet = Total & Cdet = correct detections)\n\t\t');
for i = 1:numel(res_train{1}.ch_corr_type{1})
    fprintf('\t%s\t', res_train{1}.ch_corr_type{1}(i));
end
fprintf('\nTdet\t');
for i = 1:numel(res_train{1}.ch_corr_type{1})
    fprintf('\t%.2f',mean(RatioTDet(i,:)));
end
fprintf('\nCdet\t');
for i = 1:numel(res_train{1}.ch_corr_type{1})
    fprintf('\t%.2f',mean(RatioCDet(i,:)));
end
fprintf('\n');	