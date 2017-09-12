function [sens] = accuracy(output)
filename = 'yeast.txt';
M = csvread( filename);
row_count = size(M,1);
tar = 'TARGET_ED.txt';
TARGET = csvread(tar);

     true_possitive = 0;
     true_negative = 0;
    for r = 1:row_count           
    for c = r+1:row_count      % FOR ROW AND COLUMN OF WAIGHT MATRIX
              
        if output(r,c) ~= TARGET(r,c)
             true_negative = true_negative + 1;
                
        elseif output(r,c) == TARGET(r,c) && TARGET(r,c) == 1
             true_possitive = true_possitive + 1;
          end
    end
    end
     sens = (true_possitive/2250)*100 ;
% sens = (true_possitive /(true_possitive + true_negative))*100;


end