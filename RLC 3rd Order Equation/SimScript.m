% 3rd Order RLC Equation

% L(dQ^3 / dt^3) + R (dQ^2 /dt^2) + (1/C)(dQ/dt) + Q/C = E(t)

% (dQ^3 / dt^3) = -((R (dQ^2 /dt^2) + (1/C)(dQ/dt) + Q/C)/L) + E(t))/L

ts = 0.01;
tf = 20.0;
t = [0:ts:tf];


% System Parameters

E = 575; %Volts

L = 10; %Inductance, Henrys

R = 100; %Resistance, Ohms

C = 15; %Capacitance, Farad

Q = 10000; %Capacitor Charge, Coulomb

% Initial Conditions

Q0 = 0;


Kp = 18;
Ki = 10;
Kd = 33;

capout = [];
states = [];

modelOut = sim('RLC3rdOrder.slx');
%% 
disp(capout)
%%
figure(1)
plot(t, capout, 'k')
ylabel('Capacitance')
xlabel('Time [sec]')
legend('Desired','Actual')
%% 

subplot(212);plot(t,states(:,1)); grid on
ylabel('Control Magnitude [N]');xlabel('Time [sec]')
set(gca, 'FontSize', 25);
set(findall(gcf, 'Type', 'line'), 'LineWidth', 3);
