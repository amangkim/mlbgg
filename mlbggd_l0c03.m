
% demo_03

lambda_C  = 1.5;
Delta = 10;
%lambda_C  = 2;
%Delta = 10;
trial = 1000;

%N0 = [10:40]; % Same as B in the layer 1
%p = [0.1:0.01:1];
%p0 = 0.9;
p0 = 1;

%---------------------------
%alpha = 0.4;
%B = alpha*Mo2;
B = 40;
c1 = 2000; % cost of used nodes in safety mode
c2 = 3000; % cost of unused nodes in safety mode
c_burst = 120000; % cost for burst without protection; same as total value of ICO (V)
Cost_wo0 = c_burst*ones(1,trial);
%c_overhead = 10300; % cost of burst with the safety mode
c_overhead = c1*B+c_burst; % cost of burst with the safety mode
%---------------------------

Rho = [];
Success = [];
%len_p = length(p);
len_N = length(N0);

BGG = [];
    

Cost_bgg = [];
Cost_wo = [];

N = 40;
No2 = N/2;

%-------------------------
mlbgg_layer0_eff_ms
%-------------------------

Ave_wo
Ave_bgg


figure
hold on
grid on
%title (['Reserved node portions vs. Efficiency [M_{bar} = ' num2str(M) ' nodes]']);
%ylabel ('Cost Effiency [0,1]');
%xlabel (['Portion of reserved nodes up to M/2 (= ' num2str(Mo2) ' nodes)' ]);
%bar(Alpha*M,Rho,0.5);
%ax = gca;
%ax.YLim = [0 max(Rho)*1.2];
%ax.XLim = [0 1.1*B];
%bar(Alpha*Mo2,Rho,0.8);
bar([Ave_bgg Ave_wo],0.8);
%plot(Alpha(eff_idx)*B,eff_star+0.02,'rv','MarkerSize',8,'MarkerFaceColor','r');
%OptStr = ['Best [' num2str(eff_star*100,'%2.1f') '% @ ' num2str(ceil(Alpha(eff_idx)*B)) ' backups]']; 
%legend('Cost efficiency',OptStr,'Location','northeast');

%plot(Alpha*M,Rho);
%ax.XLim = [0 1.1];
%bar(Alpha,Rho,0.6);

hold off