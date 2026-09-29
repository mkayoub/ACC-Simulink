---

1. PROCEDURE POUR LANCER LA SIMULATION

---

Pour executer le projet ACC sous MATLAB/Simulink :

1. Ouvrir MATLAB.

2. Placer tous les fichiers du projet dans le meme dossier :

* parametres_acc.m
* ProjetACC_Master.slx
* ProjetACC_MasterSenario2.slx
* tracer_resultats.m

3. Executer `parametres_acc.m` avec le bouton **Run** afin
d'initialiser les parametres du projet.

4. Executer `tracer_resultats.m` avec **Run**.
Le script lance automatiquement les deux simulations et affiche
les resultats.

5. Pour lancer un scenario manuellement :

* Scenario 1 : ouvrir `ProjetACC_Master.slx`
* Scenario 2 : ouvrir `ProjetACC_MasterSenario2.slx`
puis cliquer sur **Run** dans Simulink.

---

2. SCENARIOS

---

**Scenario 1 :** le vehicule de tete freine puis accelere.
Le vehicule suiveur adapte son acceleration afin de maintenir
une distance de securite.

**Scenario 2 :** un vehicule s'insere brusquement devant le
vehicule suiveur a `t_cutin = 90 s`. Le controleur ACC reagit
en adaptant l'acceleration.

---

3. RESULTATS

---

Pour chaque scenario, les resultats affichent :

* l'acceleration ;
* la vitesse ;
* la distance relative.

## Ces resultats permettent d'analyser le comportement du controleur ACC.
