

% --- Simulation ---
dt_sim      = 0.05;
duree_sim   = 120;

% --- Modele des vehicules ---
tau_veh     = 0.8;
modele_veh  = tf(1, [tau_veh 1 0]);

% --- Vehicule de tete ---
pos0_tete   = 70;
vit0_tete   = 22;

% --- Vehicule suiveur ---
pos0_suiv   = 0;
vit0_suiv   = 15;

% --- Regles de l'ACC ---
ecart_temps  = 1.8;
dist_arret   = 6;
vit_consigne = 27;

% --- Limites d'acceleration ---
acc_min     = -4;
acc_max     = 1.5;

% --- Gains du controleur ---
Kp_v        = 0.5;
Kp_d        = 0.2;
Kv          = 0.8;

% --- Scenario du vehicule de tete ---
t_frein       = 30;
duree_frein   = 5;
acc_frein     = -2;
t_reprise     = 60;
duree_reprise = 10;
acc_reprise   = 1;



duree_sim   = 150;

% --- Scenario 2 : insertion d'un vehicule (cut-in) ---
t_cutin     = 90;
delta_cutin = -25;