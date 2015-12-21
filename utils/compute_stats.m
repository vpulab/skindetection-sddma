function [tp fp fn P R F]=compute_stats(mask1, mask2)
% COMPUTE_STATS measures accuracy between two masks 
%(eg, mask1 is detection and mask2 is the ground-truth)
%
% Input: Two 2D matrices (mask1 and mask2) of the same size
%
% Output: tp (true positives), fp (false positives), fn (false negatives),
% P (Precision), R (Recall) and F (F-score)
%
% Author:   Juan C. San Miguel & Sergio Surja (VPU-Lab)
% E-mail:   juancarlos.sanmiguel@uam.es
% URL:      http://www-vpu.eps.uam.es/~jcs
% Version & date: 1.0 (Sept 2013)

% figure;
% subplot 231; imshow(mask); title('data1')
% subplot 232; imshow(maskGT); title('data2')
% subplot 234; imshow(mask  &  maskGT); title('tp')
% subplot 235; imshow(~mask &  maskGT); title('fn')
% subplot 236; imshow(mask  & ~maskGT); title('fp')
err = 1e-10;

tp =  sum(sum(mask1  &  mask2));
fn = sum(sum(~mask1 &  mask2));
fp = sum(sum(mask1  & ~mask2));

P=100*tp/(tp+fp+err);
R=100*tp/(tp+fn+err);
F=(2*P*R)/(P+R+err);

if isnan(F)
    F = 0;
end