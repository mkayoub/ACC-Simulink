%% Trace les resultats des deux scenarios ACC
noms_modeles = {'ProjetACC_Master', 'ProjetACC_MasterSenario2'};

for k = 1:numel(noms_modeles)
    nom_modele = noms_modeles{k};

    %% Lancer la simulation
    out = sim(nom_modele);

    %% Recuperer les signaux (via logsout si possible, sinon via le SDI)
    if isfield(out, 'logsout') && ~isempty(out.logsout)
        logs = out.logsout;
        sig_acc = logs.get('acc_suiv').Values;
        sig_v   = logs.get('v_suiv_out').Values;
        sig_d   = logs.get('d_rel_out').Values;
    else
        ids = Simulink.sdi.getAllRunIDs;
        run = Simulink.sdi.getRun(ids(end));
        sig_acc = run.getSignalsByName('acc_suiv');   sig_acc = sig_acc(1).Values;
        sig_v   = run.getSignalsByName('v_suiv_out'); sig_v   = sig_v(1).Values;
        sig_d   = run.getSignalsByName('d_rel_out');  sig_d   = sig_d(1).Values;
    end

    t_acc = sig_acc.Time;  y_acc = sig_acc.Data;
    t_v   = sig_v.Time;    y_v   = sig_v.Data;
    t_d   = sig_d.Time;    y_d   = sig_d.Data;

    %% Tracer dans une nouvelle figure a chaque tour de boucle
    figure('Name', ['Resultats ACC - ' nom_modele]);

    subplot(3,1,1);
    plot(t_acc, y_acc, 'b', 'LineWidth', 1.2);
    ylabel('Acceleration (m/s^2)');
    title(['Acceleration du vehicule suiveur - ' nom_modele], 'Interpreter', 'none');
    grid on;

    subplot(3,1,2);
    plot(t_v, y_v, 'b', 'LineWidth', 1.2);
    ylabel('Vitesse (m/s)');
    title(['Vitesse du vehicule suiveur - ' nom_modele], 'Interpreter', 'none');
    grid on;

    subplot(3,1,3);
    plot(t_d, y_d, 'b', 'LineWidth', 1.2);
    hold on;
    yline(dist_arret, '--r');
    if exist('t_cutin', 'var') && strcmp(nom_modele, 'ProjetACC_MasterSenario2')
        xline(t_cutin, ':k');
    end
    ylabel('Distance (m)');
    xlabel('Temps (s)');
    title(['Distance relative (d_{rel}) - ' nom_modele], 'Interpreter', 'none');
    grid on;
end