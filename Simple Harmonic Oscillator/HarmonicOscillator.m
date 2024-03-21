% m(d^2y/dx^2) + b(dy/dx) + ky = F(x)

ts = .01;
tf = 30.0;
t = [0:ts:tf];

m = 10.0; %kg
b = 1.5;
k = 15.0;

% Initial Conditions 
X0 = 0;
V0 = 0;

F = 300; %Newtons

%Tuning
Kp = 0;
Ki = 0;
Kd = 0;

Fstep = 0.5;
xgoal = 3;



modelname = 'HarmOscillatorModel';
sim(modelname)

%
figure; 
subplot(211);plot(t,inputForce,'k'); hold on;
plot(t,states(:,4));grid on;
set(gca, 'FontSize', 25);
% set(findall(gcf, 'Type', 'line'), 'LineWidth', 3);
ylabel('Positin [m]');xlabel('Time [sec]')
legend('Desired','Actual')

subplot(212);plot(t,states(:,1)); grid on
ylabel('Control Magnitude [N]');xlabel('Time [sec]')
set(gca, 'FontSize', 25);
set(findall(gcf, 'Type', 'line'), 'LineWidth', 3);