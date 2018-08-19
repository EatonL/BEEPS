% ------------------------------------------------------------------
% ..................................................................
% 	BEEPS Vertical constructors
% ..................................................................
% ------------------------------------------------------------------

function tempimg=vertical(Rimg,len,row,column,lambda,sigma,flag)

X=convertToLine(Rimg,row,column,flag);

Psi(1)=X(1);
Phi(len)=X(len);

for i=2:len
    Psi(i)=(1-lambda*exp((-(X(i)-Psi(i-1))^2)/(2*sigma^2)))*X(i)+lambda*exp((-(X(i)-Psi(i-1))^2)/(2*sigma^2))*Psi(i-1);  % BEEPSProgressive
end

for i=(len-1):-1:1
    Phi(i)=(1-lambda*exp((-(X(i)-Phi(i+1))^2)/(2*sigma^2)))*X(i)+lambda*exp((-(X(i)-Phi(i+1))^2)/(2*sigma^2))*Phi(i+1);  % BEEPSRegressive
end

for i=1:len
    Y(i)=(Psi(i)-(1-lambda)*X(i)+Phi(i))/(1+lambda);  % output sequence Y
end

tempimg=convertToMatrix(Y,row,column,flag);