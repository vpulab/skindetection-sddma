function plot_test_results (res_test)
% PLOT_TEST_RESULTS generates visual and textual summaries of the training
% stage performed.
% 
% Input: 'res_train' variable provided by the function
% "sddma" that implements the testing process.
%
% Author:   Juan C. San Miguel & Sergio Surja (VPU-Lab)
% E-mail:   juancarlos.sanmiguel@uam.es
% URL:      http://www-vpu.eps.uam.es/~jcs
% Version & date: 1.0 (Sept 2013)

TotPix= 0;
TotPixSkin = 0;
NFiles = 0;

for i=1:numel(res_test)    
    for j=1:numel(res_test{i})
       P(i,j) = res_test{i}(j).mP;
       R(i,j) = res_test{i}(j).mR;
       F(i,j) = res_test{i}(j).mF;
       A(i,j) = res_test{i}(j).A;
    end    
    
    TotPix= TotPix + res_test{1}(1).total_pix;
    TotPixSkin = TotPixSkin + res_test{1}(1).total_skin_pix;
    NFiles = NFiles + res_test{1}(1).Nima;
end

fprintf('\n\nSUMMARY OF TEST\n');
fprintf('\t # images = %d\n',NFiles);
fprintf('\t # pixels = %d\n',TotPix);
fprintf('\t # skin pixels = %d (%.3f %%)\n\n',TotPixSkin, 100 *TotPixSkin/TotPix);

for j=1:numel(res_test{1})
    print_results(res_test{1}(j).type, [], [], [], P(:,j), R(:,j), A(:,j)); 
end