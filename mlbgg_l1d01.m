%mlbggdemo_06
%mlbggd_layer1_case_02_v1
%test
% https://www.mathworks.com/help//stats/poissrnd.html
% https://www.mathworks.com/help/stats/poisscdf.html

lambda_A  = 3;
Delta = 10; % Unit = [Sec]
trial = 1000;

M = 250;
Mo2 = M/2;
%alpha = 0.7;


Alpha = [0:1/25:1];
Rho = [];
Success = [];
Nocount = [];
l_al = length(Alpha);

BGG = [];
    
for i=1:l_al
    alpha = Alpha(i);
    
    B = alpha*Mo2;
    c1 = 20; % cost of used nodes in safety mode
    c2 = 40; % cost of unused nodes in safety mode
    c_burst = 10000; % cost for burst without protection; same as total value of ICO (V)
    %Cost_wo = c_burst*ones(1,trial);
    %c_overhead = 10300; % cost of burst with the safety mode
    c_overhead = c1*B+c_burst; % cost of burst with the safety mode
    Cost_bgg = [];
    Cost_wo = [];
    success = 0;
    nocount = 0;
    
    for j=1:trial    
        Nu = ceil((M/2)/(lambda_A*Delta));
        Tau = Nu*Delta;
        Tau_1 = (Nu-1)*Delta;
        A_nu_1 = poissrnd(lambda_A*Tau_1);
        A_nu0 = A_nu_1 + poissrnd(lambda_A*Delta);
        %A_nu0 = poissrnd(lambda_A*Tau);                 
        
        if A_nu_1 >= Mo2
            nocount = nocount+1;
        else
            if A_nu0>= Mo2 & A_nu0<(Mo2+B) 
                m1 = c1*(A_nu0-Mo2);
                m2 = c2*(Mo2+B-A_nu0);
                c0 = m1+m2;
                success = success+1;
            else
                c0 = c_overhead;
            end
            Cost_bgg = [Cost_bgg c0];
            Cost_wo = [Cost_wo c_burst];
        end
        
        %Cost_bgg = [Cost_bgg c0];
        %[A_nu_1 Mo2 A_nu0]
        %pause;
        
    end
    
    no_opt = nocount/trial;
    yes_opt = 1-no_opt;
    
    Ave_wo = mean(Cost_wo);
    Ave_bgg0 = mean(Cost_bgg);
    Ave_bgg = Ave_bgg0*yes_opt + Ave_wo*no_opt;
    
    Ratio = Ave_bgg/Ave_wo;
    eff = max(0,1-Ratio);
    %suc_ratio = success/(trial-nocount);
    suc_ratio = success/(trial); 
    
    Rho = [Rho eff]; 
    BGG = [BGG Ave_bgg];
    Success = [Success suc_ratio];
    
    %Ra = success/trial
    
    
end

Rho = mean(Success)*Rho;
[eff_star eff_idx] = max(Rho);
%suc_dx = find(min(Success>=0.95))
Success = mean(Success)
    
figure
hold on
grid on
title (['Reserved node portions vs. Efficiency [M_{bar} = ' num2str(M) ' nodes]']);
ylabel ('Cost effiency [0,1]');
xlabel (['Number of reserved nodes up to (M_{bar})/2 (= ' num2str(Mo2) ' nodes)' ]);
%bar(Alpha*M,Rho,0.5);
ax = gca;
ax.YLim = [0 max(Rho)*1.3];
ax.XLim = [0 1.1*B];
bar(Alpha*Mo2,Rho,0.8);
plot(Alpha(eff_idx)*B,eff_star+0.02,'rv','MarkerSize',8,'MarkerFaceColor','r');
OptStr = ['Best [' num2str(eff_star*100,'%2.1f') '% @ ' num2str(ceil(Alpha(eff_idx)*B)) ' backups]']; 
legend('Cost efficiency',OptStr,'Location','northeast');

%plot(Alpha*M,Rho);
%ax.XLim = [0 1.1];
%bar(Alpha,Rho,0.6);

hold off