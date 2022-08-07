%PRABIR KUMAR DAS
%M-TECH., MEDICAL IMAGING AND INFORMATICS
%ROLL – 20MM62R02
%-----------------------------------------------------------------------------
                             %PROJECT -1

clc
clear all
prompt = 'What is the Mu value? ';
Mu = input(prompt);
tspan = [0 max(20,3*Mu)];              % Several time periods
y0 = [1;0];     %Initial value
F = @(t,y) vdps(t,y,Mu);
[t,y] = ode45(F, tspan, y0);

%plot result using ode45
figure
plot(t,y,'-o')
xlabel('t')
ylabel('Solution y')
title(['Solution of van der Pol Equation using ode45, \mu = ' num2str(Mu)]);
legend('y_1','y_2')
figure
plot(t,y(:,1),'-o')
xlabel('t')
ylabel('Solution y')
title(['Solution of van der Pol Equation using ode45, \mu = ' num2str(Mu)]);
%plot  solution in the phase plane for ode45
figure
plot(y(:,1),y(:,2))
title('Phase Plane Plot for ode45')

%Solution of van der Pol Equation using ode15s
[t,y] = ode15s(F,tspan,[1 0]);
%figure
%plot(t,y,'-o')
figure
plot(t,y(:,1),'-o')
xlabel('t')
ylabel('Solution y')
title(['Solution of van der Pol Equation using ode15s, \mu = ' num2str(Mu)]);
%plot  solution in the phase plane for ode15s
figure
plot(y(:,1),y(:,2))
title('Phase Plane Plot for ode15s')


function dydt = vdps(t,y,Mu)

dydt = [y(2); Mu*(1-y(1)^2)*y(2)-y(1)];
 
end