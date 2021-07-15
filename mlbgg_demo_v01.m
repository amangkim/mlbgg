% mlbgg_demo_v01
%

clear all;
home;
%------------
line1 = '-----------------------------------------------------------------------\n';
enter1 = '\n';
enter2 = '\n \n';
%------------

comm1 = 'Multiple Layered Blockchain Governance Game (MLBGG)\n';
comm2 = 'This demo is the simulation results of MLBGG\n';
comm3 = 'Made by Amang Kim [v0.1 || 7/11/20201]\n';
comm4 = '[Layer 0]\n';
comm5 = '[Layer 1]\n';
%------------


demo01 = '\t <a href = "matlab: mlbgg_l0d01;">1. SA-BGG Efficiency (alpah = 0.65)\n</a>';
demo02 = '\t <a href = "matlab: mlbgg_l0d02;">2. SA-BGG Acceptance Rate Optmization 3-D (Simulation II) \n</a>';

demo11 = '\t <a href = "matlab: mlbgg_l1d01;">3. BGG Optimization (Simulation I)\n</a>';
demo12 = '\t <a href = "matlab: mlbgg_l1d02;">4. Cost efficiency demo (Simulation III)\n</a>';

demo99 = '<a href = "matlab: mlbgg_demo_v01;">9. Go to the main demo\n</a>';
%---------------------------------------------------------

Comm = [enter1 line1 comm1 enter1 comm2 comm3 line1 enter1];

Menu0 = [comm4 demo01 demo02 enter1];
Menu1 = [comm5 demo11 demo12 enter1 demo99 enter1];

fprintf(Comm);
fprintf(Menu0);
fprintf(Menu1);
fprintf([line1]);