% mlbgg_layer0_eff_ms
%------------------------------
% finding efficiency @ layer0
%------------------------------


for j=1:trial    
    Nu = ceil((N/2)/(lambda_C*Delta));
    Tau = Nu*Delta;
    Tau_1 = (Nu-1)*Delta;
    Tau = Nu*Delta;
    Tau_1 = (Nu-1)*Delta;
    C_nu_1 = poissrnd(lambda_C*Tau_1);
    C_nu0 = C_nu_1 + poissrnd(lambda_C*Delta);

    if C_nu_1 >= No2
        nocount = nocount+1;
    else
        if C_nu0>= No2 & C_nu0<(No2+B) 
            m1 = c1*(C_nu0-No2);
            m2 = c2*(No2+B-C_nu0);
            c0 = m1+m2;
            success = success+1;
        else
            c0 = c_overhead;
        end
        Cost_bgg = [Cost_bgg c0];
        Cost_wo = [Cost_wo c_burst];
    end
        
    %Cost_bgg = [Cost_bgg c0];            
end

no_opt = nocount/trial;
yes_opt = 1-no_opt;

Ave_wo = mean(Cost_wo);
Ave_bgg0 = mean(Cost_bgg);
Ave_bgg = Ave_bgg0*yes_opt + Ave_wo*no_opt;

Ratio = (Ave_bgg/Ave_wo);
eff = max(0,1-Ratio);

%suc_ratio = success/(trial-nocount);
suc_ratio = success/(trial); 


