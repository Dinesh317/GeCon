function [weight] = corr_coef(M)

clc;
clear all;
close all;

% READ THE GENE EXPRESSION MICRO-ARRAY DATABASE
filename = 'yeast.txt';
M = csvread( filename);
row_count = size(M,1);
column_count = size(M,2);

j=1;
row_count = size(M,1);
for c = 1:row_count           
    for r = 1:row_count       % FOR ROW AND COLUMN OF WAIGHT MATRIX
        Z = abs(corrcoef(M(c,:),M(r,:))); % FIND CORRELATION BETWEEN TWO VECTOR
%              if(abs(Z(1,2))>0.5)   
             weight(c,r) = Z(1,2);  % ASSIGN CORRELATION VALUE TO WAIGHT MATRIX
   
    end     
end

end
 
% count = 0;
% for c = 1:row_count           
%     for r = c+1:row_count       % FOR ROW AND COLUMN OF WAIGHT MATRIX
%             if(abs(weight(c,r))>0.5)   
%              count = count+1; 
%              TARGET_PCC(c,r) = 1;
%             else
%                 TARGET_PCC(c,r) = 0;
%             end
%     end     
% end
