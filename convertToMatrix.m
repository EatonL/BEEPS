% ------------------------------------------------------------------
% ..................................................................
% 	convertToMatrix constructors
% ..................................................................
% ------------------------------------------------------------------

function output=convertToMatrix(input,row,column,flag)

%  column vectors or row vectors transform into Matrices .(depends on the value of flag)

if flag==1
    for i=1:row
        for j=1:column
            output(i,j)=input((i-1)*column+j);      
        end
    end
elseif flag==2
    for j=1:column
        for i=1:row
            output(i,j)=input((j-1)*row+i);
        end
    end
end