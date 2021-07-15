% demo_10
% Simluation for layer 0
%
clear all

lambda_C  = 2; % lambda_C  = 1.5;
Delta = 10;
trial = 200;

N0 = [10:50]; % Same as B in the layer 1
p = [0.1:0.05:1];


len_p = length(p);
len_N = length(N0);

RhoMat = [];
BGGMat = [];
SuccessMat = [];
    

Cost_bgg = [];
Cost_wo = [];

N = 40;
No2 = N/2;



for i2 = 1:len_p
    
    Rho = [];
    BGG = [];
    Success = [];

    p0 = p(i2);
    
    for i1 = 1:len_N
        B = binornd(N0(i1),p0);
        %alpha = 0.4;
        %B = alpha*Mo2;
        c1 = 2000; % cost of used nodes in safety mode
        c2 = 3000; % cost of unused nodes in safety mode
        %c_burst = 5000000; % cost for burst without protection; same as total value of ICO (V)
        c_burst = 120000; % cost for burst without protection; same as total value of ICO (V)
        Cost_wo0 = c_burst*ones(1,trial);
        %c_overhead = 10300; % cost of burst with the safety mode
        c_overhead = c1*B+c_burst; % cost of burst with the safety mode

        success = 0;
        nocount = 0;

    
        %-------------------------------
        mlbgg_layer0_eff_ms;
        %-------------------------------
    
        Rho = [Rho eff]; 
        BGG = [BGG Ave_bgg];
        Success = [Success suc_ratio];
    end
    
    RhoMat = [RhoMat Rho(:)];
    SuccessMat = [SuccessMat Success(:)];
    BGGMat = [BGGMat BGG(:)];

end

%Rho = mean(Success)*Rho;
%[eff_star eff_idx] = max(Rho);
%suc_dx = find(min(Success>=0.95))
%Success = mean(Success)
    
figure
hold on
grid on
title (['SA-BGG Efficiency based on acceptance rates']);
zlabel ('Cost effiency [0,1]');
xlabel (['Acceptance rate, p = [0.1, 1]' ]);
ylabel (['Nodes in the layer 0, B = [10, (40), 50]' ]);
%bar(Alpha*M,Rho,0.5);

%ax = gca;
%ax.YLim = [0 max(Rho)*1.3];
%ax.XLim = [9 51];
%bar(N0,Rho,0.8);
%N0_idx =find(N0 == 40);
%bar(N0(N0_idx),Rho(N0_idx),0.8,'k');
%plot(N0(eff_idx),eff_star+0.02,'rv','MarkerSize',8,'MarkerFaceColor','r');
%OptStr = ['Best [' num2str(eff_star*100,'%2.0f') '% @ ' num2str(N0(eff_idx)) ' backups]']; 
%legend('Cost efficiency','@[N = 40]', OptStr,'Location','northwest');

%plot(Alpha*M,Rho);
%ax.XLim = [0 1.1];
%bar(Alpha,Rho,0.6);

surf(p,N0,RhoMat)

hold off