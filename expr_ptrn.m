   function [weight] = expr_ptrn(M)
clc;
clear all;
close all;
% READ THE GENE EXPRESSION MICRO-ARRAY DATABASE
filename = 'yeast.txt';
M = csvread( filename);

% CALCULATING NUMBER OF ROWS AND COLUMNS
row_count = size(M,1);
column_count = size(M,2);

% CALCULATING THE DEGREE OF FLUCTION OF GENE EXPRESSION DATA
for r = 1:row_count 
    for c = 1:column_count-1

        if(M(r,c) - M(r,c+1)>0)
            Rk(r,c) = -1;
        else
            Rk(r,c) = 1;
        end
    end
end

% CALCULATE THE ANGLE OF FLUCTION 
for r = 1:row_count 
    for c = 1:column_count-1
        v = M(r,c+1) - M(r,c);
        Ak(r,c) = radtodeg(atan(v));
    end
end

% CALCULATE POSITIVE SIMILARIT & NEGATIVE SIMILARITY
for o = 1:row_count
    for r = 1:row_count 
        for c = 1:column_count-1
            if(Rk(o,c) == Rk(r,c)) 
                if(abs(Ak(o,c) - Ak(r,c)) <= 25)
                Pos_Sim(r,c,o)=1;
                else       
                Pos_Sim(r,c,o)=0;
                end
            else
                Pos_Sim(r,c,o)=0;
            end
        end
    end
end
for o = 1:row_count
    for r = 1:row_count 
        for c = 1:column_count-1
             if(Rk(o,c) == -Rk(r,c))  
                if(abs(Ak(o,c) + Ak(r,c)) <= 25)
                Neg_Sim(r,c,o)=1;
               else       
                Neg_Sim(r,c,o)=0;
                end
             else
                 Neg_Sim(r,c,o)=0;
            end
        end
    end
end
 
% CALCULATE POSITIVE AND NEGATIVE SUPPORT 
 for o = 1:row_count
     for r = 1:row_count      
       Pos_Support(o,r) = (sum(Pos_Sim(r,:,o)))/(column_count-1); 
       
       Neg_Support(o,r) = (sum(Neg_Sim(r,:,o)))/(column_count-1); 
     end
 end
 
 
for o = 1:row_count
     for r = 1:row_count 
             
        weight(o,r)  = max(Neg_Support(o,r),Pos_Support(o,r));
                                  
     end
end
   
end

% end
  
% count = 0;
%    
%   for c = 1:row_count           
%     for r = c+1:row_count       % FOR ROW AND COLUMN OF WAIGHT MATRIX
%             if(abs(weight(c,r))>0.5)   
%              count = count+1; 
%             end
%     end     
% end