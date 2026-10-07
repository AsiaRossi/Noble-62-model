clc,clear all

%% Initial conditions 

Cm=12;          % µF/cm^2 
g_An=0.18;     % mmho/cm^2
E_An=-60;       % mV
Em0=-70;        % mV
tend=1500;

alpha_h0 = 0.17*exp((-Em0-90)/20);
beta_h0 = (exp((-Em0-42)/10)+1)^(-1);
hinf0 = alpha_h0/(alpha_h0+beta_h0);
alpha_m0 = (0.1*(-Em0-48))/(exp((-Em0-48)/15)-1);
beta_m0 = (0.12*(Em0+8))/(exp((Em0+8)/5)-1);
minf0 = alpha_m0/(alpha_m0+beta_m0);

num=1;
c=1;

legendStrings = {};
%%

fprintf('The optimal value for the constant sodium conductance used by Noble is 0.14 \n')
fprintf('For values under 0.11, the sodium current is insufficient to overcome the \npotassium current, meaning the threshold will not be reached. \n')

while c==1
    gNa_const=input('Insert a value for the constant sodium conductance: \n');
    
    sim("simulation_project_A.slx");
    
    label = sprintf('g_N_a const = %.2f', gNa_const);
    legendStrings{num} = label;

    figure(1)
    plot(tout, Em)
    ylabel('Em (mV)')
    xlabel('t (ms)')
    legend(legendStrings)
    hold on
    
    figure(2)
    subplot(2,1,1)
    plot(tout,I_Na)
    ylabel('I_N_a (µA/cm^2)')
    xlabel('t (ms)')
    legend(legendStrings)
    hold on
    
    subplot(2,1,2)
    plot(tout,I_K)
    ylabel('I_K (µA/cm^2)')
    xlabel('t (ms)')
    legend(legendStrings)
    hold on
    
    c=input('If you want to contnue insert 1: \n');
    num=num+1;

    %% Other graphs 

    % figure(3)
    % plot(tout, m, 'm',tout,h,'k', tout, n, 'g')
    % legend('m', 'h','n')
    % hold on
    % 
    % figure(4)
    % semilogy(tout, g_K, 'c',tout,g_Na,'b')
    % legend('g_K', 'g_N_a')
    % ylabel('Conductances (mmho/cm^2)')
    % xlabel('t (ms)')
    % hold on
    % 
    % figure(5)
    % plot(tout,dE_dt)
    % title('dE_m/dt')
    % ylabel('dE_m/dt (V/s)')
    % xlabel('t (ms)')
    % hold on
    % 
    % figure(6)
    % plot(Em, alpha_m, 'k', Em, beta_m, 'r')
    % legend('alpha_m', 'beta_m')
    % hold on

           
end 