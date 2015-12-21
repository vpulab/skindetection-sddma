function [mP mR F mA] = print_results (label, tp, fp, fn, P, R, A)
% PRINT_RESULTs generates a readable output of statistics and prints it in the console.
%
% Input: N-dimenssional vectors corresponding to tp (true positives), 
% fp (false positives), fn (false negatives),P (Precision), R (Recall) and F (F-score)
%
% Output: mean values for Precision (mP), Recall (mR) and F (mF)
%
% Author:   Juan C. San Miguel & Sergio Surja (VPU-Lab)
% E-mail:   juancarlos.sanmiguel@uam.es
% URL:      http://www-vpu.eps.uam.es/~jcs
% Version & date: 1.0 (Sept 2013)

mA = mean(A);

if ~isempty(tp) && ~isempty(fp) && ~isempty(fn)
    TPT=sum(tp);
    FPT=sum(fp);
    FNT=sum(fn);
    PT=100*TPT/(TPT+FPT);
    RT=100*TPT/(TPT+FNT);
    % fprintf('\t\t TP = %.0f\t', TPT);
    % fprintf('\t\t FP = %.0f\t', FPT);
    % fprintf('\t\t FN = %.0f\n', FNT);
end

mP=mean(P);
mR=mean(R);
F=(2*mP*mR)/(mP+mR);

if isnan(F)
    F = 0;
end

fprintf('\tResults for %s:\t\tP = %.3f%%\tR = %.3f%%\tF = %.3f%%\tA = %.3f%%\n', label,mP,mR,F,mA);