clc;
clear all;
close all;
j=1;
% READ THE GENE EXPRESSION MICRO-ARRAY DATABASE
filename = 'yeast.txt';
M = csvread( filename);
row_count = size(M,1);
column_count = size(M,2);

%WEIGHT MATRICES FROM DIFFRENT ALGORITHEMS


[weight1] = expr_ptrn(M);
[weight2] = corr_coef(M); 
[weight3] =  eucldn_dist(M);
weight0 = triu(weight1,1);
weight1 = triu(weight2,1);
weight2 = triu(weight3,1);
count = 0;
i=1;
for x = 0:0.02:1 
 for r = 1:row_count           
    for c = r+1:row_count  
            if weight0(r,c) > x
             output(r,c) = 1;
             count = count + 1;
%              result(j,1) = r; 
%              result(j,2) = weight(r,c);
%              result(j,3) = c;
%              j = j+1;
             else 
             output(r,c) =0;
          end
            
    end    
  end
 
%    [sens] = accuracy(output);
    THR1(i) = x;
    EDG1(i) = count;
    i = i+1;
    count = 0;
end





for y = 0:0.05:1 
 for r = 1:row_count           
    for c = r+1:row_count  
            if weight1(r,c) > y
             output(r,c) = 1;
             count = count + 1;
%              result(j,1) = r; 
%              result(j,2) = weight(r,c);
%              result(j,3) = c;
%              j = j+1;
             else 
             output(r,c) =0;
          end
            
    end    
  end
 
%    [sens] = accuracy(output);
    THR2(i) = y;
    EDG2(i) = count;
    i = i+1;
    count = 0;
end


for z = 0:0.05:1 
 for r = 1:row_count           
    for c = r+1:row_count  
            if (1 - weight2(r,c)) > z
             output(r,c) = 1;
             count = count + 1;
%              result(j,1) = r; 
%              result(j,2) = weight(r,c);
%              result(j,3) = c;
%              j = j+1;
             else 
             output(r,c) =0;
          end
            
    end    
  end
 
%    [sens] = accuracy(output);
    THR3(i) = z;
    EDG3(i) = count;
    i = i+1;
    count = 0;
end
