# ainara.martinez.m1ecap

Package R minimal créé pour l’évaluation du M1 ECAP.

## Jeu de données

Le package contient le jeu de données `taxis_reduit`, construit à partir du jeu de données open data disponible à l’adresse suivante :

https://github.com/mwaskom/seaborn-data/blob/master/taxis.csv

Un fichier réduit de moins de 500 Ko a été créé et le script de préparation est fourni dans `data-raw/taxis_reduit.R`.

## Fonctions principales

- `filter_taxis()` : filtre les trajets de taxi
- `summarise_taxis_by_group()` : calcule une statistique descriptive par groupe
- `plot_taxis_summary()` : produit un graphique en barres à partir du résumé groupé


Le premier commit de ce répertoire a été effectué le 16/04/2026 à 09h41.

## Exercice Git

Suite de commandes possible pour obtenir l’historique représenté :

```bash
git checkout master
git commit -m "commit A"
git branch branch1
git checkout branch1
git commit -m "commit B"
git checkout master
git commit -m "commit C"
git merge branch1
git commit -m "commit D"
```

