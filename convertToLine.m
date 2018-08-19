% ------------------------------------------------------------------
% ..................................................................
% 	convertToLine constructors
% ..................................................................
% ------------------------------------------------------------------

function output=convertToLine(input,row,column,flag)

%  Matrices transform into column vectors or row vectors.(depends on the value of flag) 

if flag==1
    for i=1:row
        for j=1:column      
            output((i-1)*column+j)=input(i,j);
        end
    end
elseif flag==2
    for j=1:column
        for i=1:row
            output((j-1)*row+i)=input(i,j);
        end
    end
end