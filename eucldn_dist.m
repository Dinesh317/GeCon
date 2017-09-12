  function [weight] = eucldn_dist(M)

clc;
clear all;
close all;
% READ THE GENE EXPRESSION MICRO-ARRAY DATABASE
filename = 'yeast.txt';
M = csvread( filename);
ccont=0;

column_count = size(M,2);
row_count = size(M,1);
for c = 1:row_count           
    for r = 1:row_count
        Z1 = sum((M(c,:) - M(r,:)).^ 2);
         weight(c,r) = sqrt(Z1);
              
         end
end  
% max(max(weight));
    
 
for c = 1:row_count           
    for r = 1:row_count       % FOR ROW AND COLUMN OF WAIGHT MATRIX
            if(abs(weight(c,r))<20)
                  weight(c,r) = weight(c,r)/20;
                  else
                weight(c,r) = 1;
             end
    end     
end

  end
