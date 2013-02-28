.. contents::
   :depth: 3
..

Outil de suivi (Tracker) et Rapports en temps réel
==================================================

**Attention :** ce chapitre couvre les fonctionnalités de la nouvelle
version du système de suivi ou tracker(v5). Pour la documentation de
l'outil de suivi de l'ancienne génération (v3), se référer à ?.

Les outils de suivi (tracker en anglais) représentent l'un des services
les plus puissants et les plus flexibles mis à la disposition des
projets hébergés sur SYS\_PRODUCT\_NAME. Ils assurent le suivi
d'artefacts aussi variés que des bugs, des tâches, des fiches
d'assistance, etc... Un projet peut créer autant d'outils de suivi que
nécessaire.

Tous les outils de suivi, qu'ils soient prédéfinis au niveau de
l'ensemble de la plateforme ou bien créés par chaque projet sont
entièrement personnalisables.

Terminologie et Points communs
==============================

Avant de présenter les fonctionnalités des outils de suivi, il est utile
de passer quelques instants sur la terminologie employée pour les outils
de suivi ainsi que sur les fonctionnalités communes.

Étant donné que les outils de suivi sont conçus pour assurer le suivi de
toutes sortes d'items, le terme générique "artefact" est utilisé dans ce
document pour désigner tout type d'item faisant l'objet d'un suivi. Il
peut s'agir d'exigences, de risques, d'anomalies, de tâches, de demandes
de nouvelles fonctionnalités ou autres.

Pour définir un nouvel outil de suivi, il suffit juste de lui donner un
nom, de choisir les champs à utiliser et les valeurs autorisées pour ces
champs.

En complément des champs personnalisables, une section "Commentaires"
est attachée à un artefact de façon immuable. Ceci permet à chaque
artefact de disposer d'un historique complet (modification des valeurs
et commentaires associés à l'artefact qui ont été ajoutés par les
utilisateurs. Cette section permet aussi d'ajouter un commentaire qui
sera associé au flux de commentaires.

Accéder à un outil de suivi
===========================

Pour accéder au service outil de suivi d'un projet, rendez vous d'abord
sur le Tableau de bord du Projet (voir ?) et cliquez soit sur l'entrée
"Suivi" de la barre de services ou directement sur l'outil de suivi qui
vous intéresse dans la section Zones Publiques du Tableau de bord.

Dans le premier cas, une page récapitulant l'ensemble des outils de
suivi disponibles pour ce projet vous est présentée (voir ?). Après
avoir sélectionné l'outil de suivi qui vous intéresse, un certains
nombre de fonctionnalités vous sont accessibles selon le niveau de
permission dont vous disposez. Vous pouvez soumettre de nouveaux
artefacts, les modifier, effectuer des recherches et naviguer dans la
base d'artefacts ou configurer l'outil de suivi.

|Page d'accueil des outils de suivi|

Soumission d'un nouvel artefact
===============================

Pour soumettre un nouvel artefact à un projet donné, vous devez tout
d'abord accéder à l'outil de suivi approprié comme indiqué dans la
section ci-dessus (voir ?.

En pénétrant dans un outil de suivi, un écran de sélection et de
navigation apparaît (plus d'information sur cette fonctionnalité dans la
?). Pour le moment cliquez sur l'entrée "Soumettre un nouvel artefact"
dans le menu de l'outil de suivi en haut de l'écran (voir ?).

|Un exemple d'écran de soumission d'artefact (ici de type "bug")|

La ? montre un exemple de soumission d'écran provenant d'un projet
SYS\_PRODUCT\_NAME. En raison du très haut niveau de personnalisation du
service "outil de suivi" de SYS\_PRODUCT\_NAME, les écrans de soumission
d'artefact varient énormément d'un outil de suivi à l'autre. Suivant les
cas les champs affichés et le nom des artefacts diffèrent.

Dans l'exemple fourni sur la ? les artefacts sont des bugs (aussi connu
sous le nom "défauts" ou "anomalies"). Ici l'utilisateur doit fournir
une catégorie, un groupe, une priorité et une personne à laquelle
assigner l'artefact à partir des boîtes de sélection. Viennent ensuite
la description d'une ligne et une entrée texte plus longue permettant de
mieux décrire le bug en question. Après avoir soumis l'artefact en
appuyant sur le bouton "Valider", un identifiant unique (ID) lui est
automatiquement assigné.

Les valeurs proposées par un champ peuvent dépendre d'une valeur d'un
autre champ. Si le javascript est activé dans votre navigateur, les
champs seront alors filtrés dynamiquement. Sinon, SYS\_PRODUCT\_NAME
s'assurera que les valeurs que vous soumettez sont correctes.

Comme expliqué plus haut, le formulaire de soumission d'un artefact peut
varier considérablement d'un outil de suivi à l'autre en fonction des
champs utilisés. Le formulaire de soumission peut aussi varier selon
votre niveau de permission. Un exemple assez typique consiste à donner
accès à plus de champs aux membres du projet qu'aux utilisateurs
externes à l'équipe. A titre d'exemple, sur la ?, la personne qui soumet
le bug est probablement un membre du projet car donner une valeur au
champ "Assigné à" n'est, en général, pas du ressort d'un utilisateur
externe. Il est en effet très improbable qu'un utilisateur lambda en
sache suffisamment sur l'organisation interne d'un projet pour assigner
un bug à la bonne personne. C'est pour cette raison que les champs
visibles à la soumission sont configurables dans le module
d'administration de l'outil de suivi (voir ?)

Quoi qu'il en soit, n'oubliez pas de cliquer sur le bouton "Valider"
lorsque vous en avez terminé avec le formulaire !

    **Tip**

    Vous êtes sur le point de soumettre un bug ou une demande
    d'assistance à un projet SYS\_PRODUCT\_NAME ? Avant de vous lancer,
    assurez-vous qu'un artefact similaire n'est pas déjà présent. Pour
    ce faire, vous pouvez effectuer une recherche dans la base des
    artefacts soit par l'écran de sélection, soit en utilisant la boîte
    de recherche par mots-clés située dans le menu principal de
    SYS\_PRODUCT\_NAME.

Naviguer dans les artefacts
===========================

SYS\_PRODUCT\_NAME permet de naviguer dans la base des artefacts selon
un nombre de critères variables.

Critères de sélection
---------------------

La partie supérieure de l'écran de navigation est consacrée aux critères
de recherche. La ? montre le jeu de critères par défaut disponibles à la
création d'un outil de suivi. Ici, des bugs peuvent être sélectionnés en
fonction de leur catégorie, de leur groupe, de leur statut et de la
personne à qui ils ont été assignés. Vous pouvez également ajouter ou
supprimer des critères en utilisant le lien "Modifier les
critères".(Pour plus de détails, voir ?)

La façon de spécifier la valeur d'un critère de sélection dépend de son
type. Le service outil de suivi propose actuellement les types de champs
suivants :

Champs de type boîte de sélection et boîte de sélection multiple
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Une boîte de sélection prend ses valeurs dans une liste prédéfinie. Par
défaut, seule une valeur peut être retenue comme critère de recherche.
Si vous désirez sélectionner plusieurs critères de recherche, utilisez
le mode Recherche Avancée en cliquant sur l'icône +. Une boîte de
sélection multiple apparaîtra et vous permettra de sélectionner
plusieurs valeurs sur le même champ.

En général, deux autres valeurs figurent dans la boîte de sélection :
"Tous" correpond à n'importe quelle valeur de la liste et "Aucun"
correspond aux artefacts pour lesquels la valeur de ce champ n'a pas
encore été remplie.

Champ texte
~~~~~~~~~~~

Un champ texte peut contenir n'importe quel texte. Il existe deux façons
d'effectuer une recherche dans un champ texte :

-  *La recherche par mots-clés* : vous pouvez taper une série de
   mots-clés séparés par des espaces qui seront TOUS recherchés dans le
   champ texte (y compris en tant que sous-chaîne dans un mot)

-  *La recherche par expression régulière* : vos pouvez aussi spécifier
   un critère de recherche sous la forme d'une `expression régulière
   MySQL <http://dev.mysql.com/doc/refman/5.0/en/regexp.html>`__
   (n'oubliez pas les caractères /.../ qui doivent impérativement
   entourer l'expression !)

   Exemples :

   -  /^[Aa]ddition/ : correspond aux champs texte qui commencent par
      "addition" ou par "Addition"

   -  /lui\|elle\|nous/ : correspond aux champs texte contenant les
      chaînes de caractères "lui", "elle" ou "nous"

Champ de type date
~~~~~~~~~~~~~~~~~~

Un critère de sélection de type date s'exprime sous la forme AAAA-MM-JJ
où AAAA est l'année, MM le mois et JJ le jour.

Exemples : 1999-03-21 pour le 21 Mars 1999, 2002-12-05 pour le 5
Décembre 2002.

Vous pouvez rechercher une date excate (en utilisant = dans la boîte de
sélection des opérateurs) , toutes les dates précédant une certaine date
(en utilisant <) ou toutes les dates après (en utilisant >).

En cliquant sur l'icône +, vous pouvez utiliser la recherche avancée et
rechercher des dates entre deux dates spécifiques.

Champ de type entier
~~~~~~~~~~~~~~~~~~~~

Un champ de type entier peut prendre des valeurs entières positives,
négatives ou nulle.

Exemples : 0, 1, +2, -100…

Il existe plusieurs façons d'interroger un champ de type entier. Les
voici :

-  *Entier simple* : si vous tapez une simple valeur d'entier dans le
   champ la recherche renverra les champs qui contiennent exactement
   cette valeur (exemple : 610)

-  *Inégalité* : Si vous utilisez les signes >, <, >= ou =< suivi d'un
   entier la recherche renverra les champs dont la valeur est
   inférieure, supérieure, inférieure ou égale, supérieure ou égale à la
   valeur d'entier spécifiée (exemples : > 120 , < -30).

-  *Intervalle* : si vous utilisez la notation "entier1-entier2" la
   recherche renverra les champs dont la valeur est supérieure ou égale
   à entier1 et inférieure ou égale à entier2 (exemples : 800 - 900 pour
   les entiers entre 800 et 900 inclus, -45 - 12 pour les entiers
   compris entre -45 et +12)

-  *Expression régulière* : les `expressions régulières étendues de
   MySQL <http://dev.mysql.com/doc/refman/5.0/en/regexp.html>`__ peuvent
   aussi être utilisées comme critère de recherche (exemple : /^4.\*8$/
   recherche tous les entiers dont la valeur commence par un "4", se
   termine par un "8" avec un nombre de chiffres quelconque entre les
   deux.

Champ de type nombre flottant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Un champ de type flottant peut prendre des valeurs décimales positives,
négatives ou nulle. Il peut aussi utiliser la notation exponentielle
pour exprimer de très grandes valeurs.

Exemples : 0, 1.23, -2.456, 122.45E+12…

Il existe plusieurs façons d'interroger un champ de type flottant. Les
voici :

-  *Flottant simple* : si vous tapez une simple valeur de flottant dans
   le champ la recherche renverra les champs qui contiennent exactement
   cette valeur (exemple : 2.35)

-  *Inégalité* : Si vous utilisez les signes >, <, >= ou =< suivi d'un
   nombre la recherche renverra les champs dont la valeur est
   inférieure, supérieure, inférieure ou égale, supérieure ou égale à la
   valeur spécifiée (exemples : > 120.3 , < -3.3456E-2).

-  *Intervalle* : si vous utilisez la notation "flottant1-flottant2" la
   recherche renverra les champs dont la valeur est supérieure ou égale
   à flottant1 et inférieure ou égale à flottant2 (exemples : -1.2 - 4.5
   pour des valeurs comprises entre -1.2 et 4.5 inclus)

-  *Expression régulière* : les `expressions régulières étendues de
   MySQL <http://dev.mysql.com/doc/refman/5.0/en/regexp.html>`__ peuvent
   aussi être utilisées comme critère de recherche (exemple : /^4.\*8$/
   recherche tous les nombres dont la valeur commence par un "4", se
   termine par un "8" avec un nombre de chiffres quelconque entre les
   deux y compris le point séparant les décimales.

Résultats de la recherche dans un outil de suivi
------------------------------------------------

Sur la base de vos critères de sélection, SYS\_PRODUCT\_NAME effectue
une requête dans la base de données, sélectionne les artefacts
correspondants et les affiche juste au dessous des critères de
sélection. Le choix des colonnes affichées par la liste de résultat est
entièrement configurable par les utilisateurs. (voir ?). C'est pour
cette raison que l'écran d'affichage des résultats d'une requête peut
être totalement différents de l'exemple montré sur la ?.

|Exemple d'affichage des résultats d'une requête|

Les résultats sont affichés par groupe de N artefacts où N est
modifiable par l'utilisateur. Si plus de N artefacts correspondent à la
recherche, l'utilisateur est invité à cliquer sur "Précédent" ou
"Suivant" dans la barre de navigation.

Pour accéder à un artefact, cliquez simplement sur l'icône |image3| dans
la liste des résultats.

Tri de la liste des artefacts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Par défaut, les artefacts sont triés par ordre chronologique de
soumission sur SYS\_PRODUCT\_NAME.

La liste des artefacts peut être triée selon n'importe quelle colonne
affichée à l'écran en cliquant sur l'entête de la colonne. Deux clics
successifs permettent de basculer d'un ordre ascendant à un ordre
descendant. Le sens du tri est visible sous la forme d'un petite flèche
orientée vers le haut ou vers le bas figurant à côté du critère de tri
juste au dessus de la liste des artefacts.

Le tri multi-colonnes autorise des opérations de tri plus sophistiquées.
Dans ce mode, les critères de tri s'accumulent au fur et à mesure que
vous cliquez sur les entêtes de différentes colonnes. Vous pouvez par
exemple cliquer sur "Sévérité" puis sur "Assigné à" pour voir qui dans
l'équipe est en charge des artefacts critiques et combien il y en a. A
tout moment dans le tri multi-colonnes, un clic sur l'un des critères de
tri affiché dans la liste "critère 1 > critère 2 > critère 3..." vous
ramènera en arrière dans les critères de tri. Grâce à cette
fonctionnalité vous pouvez aisément tester plusieurs stratégies de tri.

Exporter les résultats d'une requête
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Dans le menu "options" du rapport, les liens "Exporter uniquement les
colonnes du rapport" et "Exporter toutes les colonnes" permettent
d'exporter les artefacts sélectionné au format CSV. En utilisant cette
fonctionnalité vous pouvez aisément sélectionner les artefacts auxquels
vous souhaitez appliquer des traitements supplémentaires avec des outils
externes à SYS\_PRODUCT\_NAME

Voir ? pour savoir comment importer des artefacts à partir d'un fichier
CSV.

Version imprimable
~~~~~~~~~~~~~~~~~~

Vous pouvez à tout moment cliquer sur le lien "Version imprimable"
(présent dans le menu des "Options" du rapport) pour générer une version
simplifiée et non décorée de la liste des artefacts que vous pourrez
imprimer depuis votre navigateur ou copier-coller dans un document de
votre choix. Pour une meilleure lisibilité nous vous conseillons
d'imprimer les résultats en format paysage.

Visualisation Graphique
~~~~~~~~~~~~~~~~~~~~~~~

Il est également possible de visualiser les résultats d'une requête sous
forme graphique en ajoutant un onglet de type "Graphique(s)". Il y a
cinq types de graphiques disponibles : le camembert, le graphique en
bâton, le diagramme de Gantt, le diagramme de type Burndown
(reste-à-faire) et la vue sous forme de tableau de post-it, utilisés
dans les méthodes agiles. Comme pour la liste des artefacts (onglet de
type "Table"), les vues graphiques affichent les artefacts répondant aux
critères de sélection. Pour plus de détails, voir ?.

Gestion des rapports
--------------------

Les rapports des outils de suivi permettent de choisir les critères de
recherche et créer différentes représentations des résultats (aussi
appelés "renderers"), qui affichent le résultat de la recherche.
SYS\_PRODUCT\_NAME propose deux types de représentations: "Table" et
"Graphiques". Le "renderer" de type "Table" présente la liste des
artefacts correspondant aux critères de recherche sous forme de tableau
en utilisant des colonnes. La représentation de type "Graphiques" offre
une vue graphique des résultats. .

Pour chaque outil de suivi auquel ils ont accès, les utilisateurs de
SYS\_PRODUCT\_NAME peuvent définir leurs propres rapports, en
choisissant leurs propres critères de recherche et en ajoutant des
représentations. Dans ce cas précis, le rapport est considéré comme
personnel et n'est visible que par l'utilisateur l'ayant créée. A
l'opposé, les administrateurs d'un outil de suivi peuvent définir des
rapports de type "projet", qui seront visibles par tous les utilisateurs
de l'outil de suivi.

Paramétrage d'un rapport
~~~~~~~~~~~~~~~~~~~~~~~~

Le rapport courant est défini en haut à gauche de la page du rapport
(Voir ?). Si plusieurs rapports sont disponibles, une boîte de sélection
permet de changer de rapport courant.

Pour chaque rapport, et à condition d'avoir les permissions nécessaires,
vous pouvez soit "enregistrer", "enregistrer sous", "modifier la
visibilité" de public à privé, choisir le rapport courant comme rapport
par défaut ou encore le supprimer.

Attention! En tant qu'administrateur d'un outil de suivi, mettre à jour
un rapport public modifiera ce rapport pour tous les autres utilisateurs
de ce dernier. Gardez cela à l'esprit avant de sauvegarder vos
modifications.

Ajouter une représentation des résultats de recherche
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vous pouvez ajouter autant de représentations que vous le souhaitez dans
chaque rapport. Les représentations sont affichées sous forme d'onglets.
Il est très simple d'ajouter une représentation : sélectionnez l'onglet
[+] à droite des autres onglets (see ?). Ensuite, sélectionnez le type
de représentation à ajouter (table ou graphiques), donnez-lui un nom et
une description, et cliquez sur le bouton "Soumettre" : un nouvel onglet
est crée!

    **Tip**

    Pour classer vos représentations, il suffit de faire un
    glisser/déposer des onglets!

La représentation de type "Table"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La représentation de type "Table" se présente sous forme de tableau. Les
colonnes du tableau sont les champs de l'outil de suivi et les lignes
représent les artefacts. L'exemple (?) présente une représentation de
type "Table".

Vous pouvez modifier les champs du tableau que vous souhaitez afficher,
réordonner les champs en utilisant le glisser/déposer, trier la liste
des artefacts (en cliquant sur le nom du champ), naviguer dans la liste
d'artefacts en sélectionnant le nombre d'artefacts à afficher.

Il est possible d'ajouter des fonctions de calcul sur certains champs du
tableau. Pour les entiers, les flottants, les boîtes de sélection et les
boîtes de sélection multiple, une icône |image4| s'affiche sous chaque
colonne correspondante.

Cliquer simplement dessus pour ajouter une ou plusieurs fonctions de
calcul. Les fonctions de gcalcul disponibles sont:

-  **Count** (Total, seulement pour les entiers, les flottants, les
   boîtes de sélection et les boîtes de sélection multiple)

-  **Count Group By** (Total par catégorie, seulement pour les entiers,
   les flottants, les boîtes de sélection et les boîtes de sélection
   multiple)

-  **Average** (Moyenne, seulement pour les entiers et les flottants)

-  **Maximum** (seulement pour les entiers et les flottants)

-  **Minimum** (seulement pour les entiers et les flottants)

-  **Deviation Standard** (Ecart-type, seulement pour les entiers et les
   flottants)

-  **Somme** (seulement pour les entiers et les flottants)

Vous pouvez facilement ajouter, supprimer, déplacer les colonnes que
vous souhaitez afficher sur votre tableau, ainsi que des calculs tout en
bas.

La représentation de type "Graphiques"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

La représentation de type "Graphiques" permet d'ajouter différents
graphiques à un rapport. SYS\_PRODUCT\_NAME fournit cinq types de
graphes : le camembert, le graphique en bâton, le diagramme de Gantt, la
vue sous forme de tableau de post-it et le diagramme de type Burndown
utilisés dans les méthodes agiles.

Vous pouvez ajouter autant de graphes que vous le souhaitez au sein d'un
onglet. Pour ajouter un graphe, cliquez sur l'icône du graphe de votre
choix. Selon le type de graphe, vous devrez saisir un nom, une
description et renseigner certains champs nécessaires à la génération du
graphe.

Graphique de type Camembert
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Gaphique en bâtons
^^^^^^^^^^^^^^^^^^

Diagramme de Gantt
^^^^^^^^^^^^^^^^^^

    **Tip**

    Attention! Si vous gérez de gros projets avec des dates s'étalant
    sur plusieurs années, ne générez pas un diagramme de Gantt en
    utilsant les jours comme échelle temporelle. Le diagramme serait
    trop grand. Il est préférable d'utiliser semaine, mois ou année
    comme échelle de temps.

Diagramme de type Burndown
^^^^^^^^^^^^^^^^^^^^^^^^^^

Tableau de post-it
^^^^^^^^^^^^^^^^^^

Les tableaux de post-it, très utilisés dans les méthodes agiles,
permettent d'avoir une vision globale et actualisés en temps réel, sur
l'avancement du travail. Il suffit de cliquer sur un post-it et le
glisser vers une autre colonne pour actualiser l'état de l'artefact.

Modifier/supprimer une représentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Selon les permissions, vous pouvez modifier une représentation en
cliquant sur la flèche descendante près du nom de l'onglet.

Il est possible de modifier le titre et la description ou de supprimer
la représentation.

    **Tip**

    Chaque représentation graphique ou tableau, peut s'afficher dans les
    tableaux de bord. Pour cela, sélectionner "Ajouter à mon tableau de
    bord" ou "Ajouter au tableau de bord du projet" dans le menu
    "Options".

Modifier un artefact
====================

La sélection d'un artefact dans la liste générée suite à une opération
de recherche entraîne l'affichage d'une page qui comporte toutes les
informations concernant cet artefact. Selon les droits qui vous ont été
octroyés sur cet outil de suivi (voir ?) la vue détaillée présente un
certain nombre de champs texte immuables ou d'autres champs modifiables.
Si vous êtes un visiteur anonyme ou un utilisateur enregistré qui n'est
pas membre du projet, il est très probable que la plupart des champs
apparaissent comme non modifiables. Par défaut, les utilisateurs
extérieurs à l'équipe ne peuvent modifier les champs d'un artefact. Ils
sont uniquement en mesure de soumettre un commentaire.

L'écran de modification d'un artefact se divise en deux sections :
**Entête et Commentaires**

Entête
------

La zone d'entête concentre l'ensemble des champs associés à un artefact.
Comme le montre la figure ?, certains champs disposent d'un jeu de
valeurs prédéfinies, d'autres sont des champs numériques (Effort) ou des
champs texte (Résumé). Pour plus de clarté, les champs sont regroupés en
groupes de champs. Le jeu de champs utilisés pour un outil de suivi
donné, ainsi que les valeurs prédéfinies et les groupes de champs
peuvent être entièrement configurés par les membres du projet qui ont
les droits d'administration sur cet outil de suivi (voir ? à ce sujet).

Les champs dynamiques
~~~~~~~~~~~~~~~~~~~~~

Certains champs ont un comportement particulier et une explication
semble nécessaire.

-  **Les champs édités automatiquement**: SYS\_PRODUCT\_NAME propose des
   champs dont la valeur est modifiée de manière automatique : "ID de
   l'Artefact", "Date de dernière mise à jour", "Auteur de l'Artefact"
   and "Date de Soumission". Les utilisateurs ne peuvent pas modifiés
   ces champs.

-  **Références Croisées**: SYS\_PRODUCT\_NAME propose un autre champ
   dynamique qui permet d'afficher toutes les références liées à cet
   artefact et provenant de n'importe quel artefact ou autre objet
   SYS\_PRODUCT\_NAME.

   Lorsque vous saisissez du texte dans n'importe quel champ texte ou
   commentaire d'un artefact, tout morceau de texte qui suit le modèle
   "XXX #NNN" est interprété comme une référence à l'item XXX numéro
   NNN, où XXX est le nom court de l'item (qui peut être un artefact, un
   commit cvs, une révision svn...) et NNN l'identifiant unique (ID)
   (exemple : "bug #123", "tache #321", "req #12", etc...). Si vous ne
   connaissez pas le nom court de l'outil de suivi ou si vous souhaitez
   ne pas le spécifier vous pouvez utiliser le modèle générique "art
   #NNN". Lorsque SYS\_PRODUCT\_NAME affiche un commentaire contenant
   une référence, elle est automatiquement transformée en hyperlien vers
   la page de SYS\_PRODUCT\_NAME donnant toutes les informations sur cet
   artefact.

   Les modèles de référence de SYS\_PRODUCT\_NAME peuvent etre utilisés
   pour référencer des artifacts, mais aussi des commits CVS, des
   révision Subversion, des documents, des fichiers, etc. Voir la ? pour
   plus d'information sur les Références.

   De plus les références vers les outils de suivi, les révision SVN et
   les commits CVS sont stockées en base de données, et sont résumées
   dans la section suivante, classées par type puis par sens de
   référence initial.

|Entête d'un écran de modification d'un artefact (champs de l'outil de
suivi)|

Commentaires
------------

Autant de commentaires que nécessaire peuvent être attachés à un
artefact. Il s'agit de commentaires libres saisis dans un champ texte.

Les commentaires présentent plusieurs caractéristiques intéressantes :

-  **Recueil des changements**: Chaque commentaire comporte une partie
   dédiée à l'historique de l'artefact. Ceci permet de garder une trace
   de tous les changements de l'artefact depuis sa création.
   L'historique de l'artefact affiche les modifications apportés aux
   champs, la valeur précédente, qui a fait le changement et quand.

-  **Réponses-type** : il n'est pas rare de voir les personnes en charge
   de la gestion des artefacts poster les mêmes commentaires de façon
   répétée. Un message de remerciement à la personne qui a soumis
   l'artefact, une demande concernant des informations manquantes comme
   un numéro de version ou le type de la machine, sont autant d'exemples
   de commentaires utilisés fréquemment. Plutôt que de retaper sans
   cesse le même texte, SYS\_PRODUCT\_NAME permet de créer un ensemble
   de réponses prédéfinies appelées réponses-type. Chaque réponse-type
   se compose d'un nom et d'un contenu.

   Pour poster une réponse-type il suffit de la choisir dans la boîte de
   sélection prévue à cet effet et de soumettre les modifications.

|Commentaires attachés à un artefact|

Mise à jour massive d'artefacts
-------------------------------

SYS\_PRODUCT\_NAME permet aux administrateurs d'un outil de suivi ou du
projet d'effectuer la même modification sur un ensemble d'artefacts en
une seule étape. Une application typique de cette fonctionnalité de mise
à jour massive consiste précisément à réassigner tous les artefacts
d'une personne à une autre.

Pour cela, sélectionner le lien "mise à jour massive" dans le menu
"options" du rapport. Rappelons que seuls les administrateurs du tracker
ont accès à cette fonctionnalité.

Vous pouvez mettre à jour n'importe quel champ (sauf celui portant la
sémantique "titre"). Par défaut, tous les champs ont leur valeur à
"Inchangé". Si vous ne souhaitez pas mettre à jour un champ, vous devez
conserver la valeur "Inchangé". Pour mettre à jour un champ sur tous les
artefacts, il vous suffit de le mettre à jour. Vous pouvez également
ajouter un commentaire.

N.B. La mise à jour massive d'artefacts permet de passer outre tout
worflow sur un ou plusieurs champs

|Mise à jour massive d'artefacts|

Notification email
==================

Les outil de suivi de SYS\_PRODUCT\_NAME sont munis d'un mécanisme de
notification d'évènements par email puissant et flexible. A moins que
l'administrateur de projet ou les utilisateurs eux-mêmes n'en décident
autrement, le système de notification par email adopte un comportement
par défaut très simple. A chaque fois qu'un artefact est créé ou modifié
- que ce soit avec un nouveau commentaire ou un changement dans l'un des
champs - un message est envoyé aux acteurs suivants :

-  La personne qui a soumis l'artefact

-  La ou les personnes à qui l'artefact a été assigné (si l'option
   "Envoyer les notifications aux personnes sélectionnées" du champ a
   été activée par l'administrateur de l'outil de suivi)

-  Tous les utlisateurs qui ont rédigé au moins un commentaire.

Le message de notification généré par l'outil de suivi se compose d'une
première partie montrant les changements récemment intrevenus dans
l'artefact lors de la dernière mise à jour. A la suite se trouve un
récapitulatif complet de l'artefact. Des pointeurs Web sont aussi
présents dans le message pour vous permettre d'accéder facilement et
rapidement à l'artefact sur SYS\_PRODUCT\_NAME.

|Notification par email|

Champ "artifact link"
=====================

Le champ "artifact link" permet de créer des liens vers d'autres
artefacts du même ou d'un autre tracker. Les artefacts sont affichés
sous forme de tableau où chaque onglet correspond à un tracker. La
présentation des artefacts dans chaque tabulation est non modifiable et
correspond au rapport couramment utilisé par l'utilisateur et le
renderer par defaut associé.

Lier un artefact
----------------

En cliquant sur l'icône à gauche du champs texte, une fenêtre modale
s'ouvre. Dans cette fenêtre il est alors possible de sélectionner ou
désélectionner des artefacts. Un rapport pour un tracker peut être
sélectionné, affichant les critères de recherche associés. Une fois le
bouton de mise à jour cliqué, la fenêtre modale est fermé et le id des
artefacts selectionnés ajoutés (séparés par des virgules) dans le champs
texte; et visibles (lignes jaunes) dans les onlgets correspondants.

Créer un artefact
-----------------

Il est possible de créer un artefact que l'on souhaite ensuite lié
directement à l'artefact courant. En cliquant sur le bouton "Créer un
artefact", une fenêtre modale contenant le formulaire de soumission d'un
artefact est affichée, avec une selectbox permettant de choisir le
tracker. Tout artefact crée est ajouté dans l'artefact courant de la
même façon qu'un artefact à lier.

Gérer les artefacts liés
------------------------

Tous les artefacts peuvent être géré directement dans les onglets du
tableau. Les artefacts qui n'ont pas encore été liés sont mis en valeur
par la couleur jaune. Tous les artefacts peuvent être supprimés de la
liste des artefacts liés ou à lier en cliquant sur la croix rouge.

Importation d'artefacts
=======================

Les administrateurs d'un projet ont la possibilité d'importer des
artefacts dans un outil de suivi de SYS\_PRODUCT\_NAME en utilisant des
fichiers au format CSV (Comma Separated Values) qui est supporté par
toutes les applications bureautiques du marché. L'importation d'artefact
facilite énormément la migration de données en provenance d'autres
outils de suivi dans les outils de suivi de SYS\_PRODUCT\_NAME.

L'importation d'artefacts se déroule en trois étapes :

-  **Soumission du fichier CSV.** L'administrateur du projet peut
   accéder à la fonction d'importation soit à partir de l'écran de
   recherche et de navigation, soit à partir du menu de l'écran
   d'administration du projet. Choisissez ensuite l'outil de suivi
   concerné et le fichier CSV à importer. Durant cette étape vous pouvez
   aussi choisir d'envoyer une notification email à tous les
   utilisateurs concernés par les modifications dues à l'importation. Si
   vous ne cochez pas l'option, aucune notification ne sera envoyée.

-  **Analyse des fichiers CSV.** Si aucune erreur n'est détectée dans le
   format du fichier téléchargé, un rapport d'analyse est affiché à
   l'écran qui vous permet de confirmer que l'information importée est
   correcte.

-  **Mise à jour de la base de données.** Selon le format des
   informations fournies, de nouveaux artefacts vont être créés ou des
   artefacts existants sont mis à jour.

Quand utiliser la fonction d'importation ?
------------------------------------------

Vous trouverez ci-dessous quelques suggestions d'utilisation de la
fonction d'importation de l'outil de suivi :

-  Importation des données en provenance d'un logiciel de gestion de
   projet externe vers un outil de suivi de tâches de
   SYS\_PRODUCT\_NAME.

-  Migration des données de votre ancien système de suivi dans le nouvel
   outil de suivi de SYS\_PRODUCT\_NAME.

-  Migration d'artefact d'un outil de suivi SYS\_PRODUCT\_NAME vers un
   autre.

Exporter une feuille de calcul Excel au format CSV
--------------------------------------------------

Pour exporter une feuille de calcul Excel au format CSV, suivez les
étapes suivantes :

-  Sélectionnez ``Fichier -> Enregistrer
                 sous...``

-  Dans la boîte de dialogue choisissez ``CSV`` comme format de
   sauvegarde.

Analyse du fichier CSV
----------------------

Le format CSV accepté en entrée est documenté sur l'écran de soumission
du fichier CSV. Cette page vous permet de vérifier de façon manuelle que
votre fichier CSV est bien formaté et quels champs sont obligatoires en
cas de soumission d'un nouvel artefact. Qui plus est, un exemple de
fichier CSV figure en bas de page. Comme pour l'export de données, vous
pouvez spécifier le séparateur utilisé dans le fichier CSV que vous
voulez importer ainsi que le format de dates ?). Si vous avez déjà
utilisé le module d'exportation (voir ?) vous remarquerez que les
formats sont strictement identiques. Ceci veut donc dire que si vous
avez changé le séparateur CSV pour un export, vous devrez utiliser le
même séparateur pour importer ces données. Vous pouvez vous référez à la
documentation du format d'exportation en particulier pour les champs de
type date et commentaire (voir ?). Le premier enregistrement d'un
fichier d'importation CSV doit toujours être constitué des noms des
champs de l'ids utilisé dans les lignes de données qui suivent.

Vous devez fournir des informations différentes selon que vous souhaitez
mettre à jour des artefacts existants ou en créer de nouveaux. Néanmoins
il est possible de mélanger les deux formats dans le même fichier CSV.

Pour la création d'artefact vous devez fournir une valeur pour tous les
champs marqués comme étant obligatoires. Si vous omettez le nom de la
personne qui soumet l'artefact ainsi que la date de soumission ils
seront automatiquement renseignés avec le nom de l'utilisateur
effectuant l'opération d'importation et la date courante respectivement.

Pour la modification d'artefacts existants vous devez impérativement
fournir l'identifiant (ID) des artefacts concernés. Ensuite vous pouvez
vous contenter d'utiliser uniquement les noms des champs à modifier dans
le fichier CSV et non pas l'ensemble des champs obligatoires.

Le processus d'analyse vérifie la cohérence du fichier CSV sur plusieurs
points :

-  Omission de champs obligatoires lors de la création de nouveaux
   artefacts.

-  Le nombre de champs mentionnés sur la première ligne ne correspond
   pas au nombre de valeurs des lignes suivantes

-  Nom de champ inconnu sur la première ligne

-  Valeurs de champs qui ne correspondent pas aux valeurs prédéfinies
   pour les champs de type boîte de séléction.

-  Soumission en double (par exemple soumission d'un nouvel artefact
   ayant le même résumé qu'un artefact déjà existant)

-  Identifiant d'artefact inconnu.

-  Omission des commentaires déjà soumis

D'autres erreurs peuvent être détectées à l'occasion de l'inspection
visuelle du rapport d'importation fourni par SYS\_PRODUCT\_NAME.

Mise à jour de la base de données
---------------------------------

Si vous importez de nouveaux artefacts, tous les champs optionnels omis
dans le fichier CSV sont renseignés avec leur valeur par défaut.

Si vous souhaitez mettre à jour la liste des destinataires en copie ou
celle des dépendances, prenez garde que les valeurs spécifiées dans le
fichier CSV remplacent les noms et les dépendances existants. Tous les
commentaires présents dans le fichier CSV qui ont déjà été soumis sont
omis pour éviter les doublons. Le nom de la personne ayant soumis
l'artefact et la date de soumission ne peuvent être modifiés par un
fichier d'importation même s'il comporte ces deux informations.

Si une erreur survient lors de l'importation d'un artefact dans la base
de données, le processus s'arrête et les artefacts qui suivent ne sont
pas importés.

Chaque opération d'importation est consignée dans l'historique du projet
(voir ?). Par contre aucune notification email n'est envoyée suite aux
modifications intervenues sur les différents artefacts suite à
l'opération d'importation.

    **Tip**

    Si un fichier CSV est ouvert avec Excel, tout changement opéré sur
    la feuille de calcul (y compris un simple changement d'une largeur
    de colonne) peut amener Excel à modifier les informations d'origine
    du fichier CSV. Les changements en question peuvent affecter les
    dates, les heures et les nombres qui seront convertis aux formats
    spécifiés dans les paramètres régionaux de votre système, les
    caractères de saut de ligne transformés en saut de ligne et retour
    chariot ainsi que des virgules ajoutées à certaines lignes.

    Les changements de format de date effectués par Excel peuvent être
    incompatibles avec le format attendu par SYS\_PRODUCT\_NAME et
    causer des erreurs durant l'importation des données. A l'inverse,
    des fichiers CSV exportés depuis SYS\_PRODUCT\_NAME peuvent ne pas
    s'ouvrir correctement sous Excel avec certaines valeurs des
    paramètres régionaux.

    Si vous vous retrouvez dans ce cas de figure, essayez de procéder
    aux modifications suivantes sur Windows : Assurez-vous que toutes
    vos applications sont arrêtées. Modifiez vos paramètres régionaux
    (Démarrer > Configuration > Panneau de contrôle, Paramètres
    Régionaux) pour utiliser l'anglais avec les formats suivants : Date
    = MM/dd/YYYY Heure = hh:mm. Avec Excel, ouvrez le fichier CSV qui
    pose problème, ajustez la largeur d'une colonne quelconque,
    sauvegardez le fichier et fermez Excel. Remettez les paramètres
    régionaux à leur ancienne valeur et importez le fichier CSV
    "corrigé" dans SYS\_PRODUCT\_NAME.

Permissions d'accès par défaut aux outils de suivi
==================================================

Selon la classe d'utilisateurs à laquelle vous appartenez et le niveau
de permission qui vous est accordé en tant que membre d'un projet,
différentes fonctions des outils de services peuvent s'avérer accessible
ou pas. Veuillez noter que les permissions d'accès par défaut listées
ci-dessous peuvent changer pour un outil de suivi particulier si
l'administrateur de l'outil en a décidé ainsi. Pour plus d'information
sur la configuration des permissions d'accès aux outils de suivi
reportez-vous à la ?. Les permissions par défaut sont résumées dans la
table ci-dessous :

+----------------------------------+------------------------------------------+
| Fonctionnalité du tracker        | Permission                               |
+==================================+==========================================+
| `Soumission d'un nouvel          | Par défaut tout visiteur, connecté à     |
| artefact <#TrackerV5ArtifactSubm | SYS\_PRODUCT\_NAME ou pas, peut          |
| ission>`__                       | soumettre un nouvel artefact.            |
|                                  | L'administrateur de l'outil de suivi     |
|                                  | peut limiter l'usage de cette fonction   |
|                                  | aux utilisateurs enregistrés ou aux      |
|                                  | membres du projet si l'outil de suivi    |
|                                  | est privé.                               |
+----------------------------------+------------------------------------------+
| `Navigation/Recherche            | La recherche et la navigation dans la    |
| d'artefact <#TrackerV5ArtifactBr | base d'artefacts est accessible à tous   |
| owsing>`__                       | les visiteurs SYS\_PRODUCT\_NAME sauf si |
|                                  | l'outil de suivi est privé auquel cas    |
|                                  | seuls les membres de l'équipe y ont      |
|                                  | accès.                                   |
+----------------------------------+------------------------------------------+
| `Modification des                | Par défaut seuls les membres du projet   |
| artefacts <#TrackerV5ArtifactUpd | peuvent modifier un artefact. Les        |
| ate>`__                          | visiteurs externes ne peuvent soumettre  |
|                                  | qu'un commentaire ou attacher un         |
|                                  | fichier.                                 |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi -Importation               | administrateurs du projet et aux membres |
| d'artefacts <#TrackerV5ArtifactI | du projet ayant les droits               |
| mport>`__                        | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Création d'un outil de          | Uniquement accessible aux                |
| suivi <#TrackerV5Creation>`__    | administrateurs du projet                |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi - Options                  | administrateurs du projet et aux membres |
| générales <#TrackerV5GeneralSett | du projet ayant les droits               |
| ings>`__                         | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi - Gérer l'utilisation des  | administrateurs du projet et aux membres |
| champs <#TrackerV5FieldUsageMana | du projet ayant les droits               |
| gement>`__                       | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi -Gérer la                  | administrateurs du projet et aux membres |
| sémantique <#TrackerV5SemanticMa | du projet ayant les droits               |
| nagement>`__                     | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi - Gérer le                 | administrateurs du projet et aux membres |
| Workflow <#TrackerV5Workflow>`__ | du projet ayant les droits               |
|                                  | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi - Gérer les                | administrateurs du projet et aux membres |
| Permissions <#TrackerV5Permissio | du projet ayant les droits               |
| nsManagement>`__                 | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi - Gérer les réponses       | administrateurs du projet et aux membres |
| type <#TrackerV5CannedResponses> | du projet ayant les droits               |
| `__                              | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi - Options de               | administrateurs du projet et aux membres |
| notification <#TrackerV5EmailNot | du projet ayant les droits               |
| ificationSettings>`__            | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration de l'outil de    | Uniquement accessible aux                |
| suivi -                          | administrateurs du projet et aux membres |
| Export <#TrackerV5AdminStructure | du projet ayant les droits               |
| Export>`__                       | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+

Table: Permissions d'accès par défaut des outils de suivi

Création d'un outil de suivi
============================

Avant de choisir les champs et les valeurs associés aux champs d'un
outil de suivi, il faut tout d'abord créer ce dernier. On peut accéder à
la page de création d'un outil de suivi depuis l'entrée "Créer un outil
de suivi".

    **Tip**

    Quand un projet est créé sur SYS\_PRODUCT\_NAME un certain nombre
    d'outils de suivi sont automatiquement créés pour ce projet. Il
    s'agit typiquement d'outils de suivi pour les bugs, les tâches et
    les demandes de support. Si votre projet est amené à gérer ce genre
    d'artefacts, utilisez de préférence les outils de suivi prédéfinis.
    Vous êtes bien sûr libres de définir de nouveaux champs et de
    modifier ceux qui existent déjà dans chacun de ces outils de suivi.

Pour définir un nouvel outil de suivi vous devez fournir les
informations suivantes (voir ?) :

-  **Nom** : il s'agit du nom de l'outil de suivi. Le nom d'un outil de
   suivi est classiquement calqué sur le nom des artefacts qui sont
   gérés. Ce nom est utilisé par SYS\_PRODUCT\_NAME dans le titre de
   plusieurs écrans de l'outil de suivi. Quelques exemples de noms
   d'outils de suivi : Demandes de fonctionnalités, Tâches, Anomalies,…

-  **Description** : une description plus complète de l'outil de suivi
   et des artefacts qu'il gère.

-  **Nom court** : il s'agit d'un nom court décrivant le type
   d'artefacts gérés par l'outil de suivi. Le nom doit être aussi court
   que possible car il est utilisé sur plusieurs écrans de l'outil de
   suivi comme, par exemple, sur l'écran de modification d'un artefact
   où le nom court apparaît dans la barre de menu et à côté de
   l'identifiant de l'artefact. Si nous reprenons les exemples donnés
   pour le champ Nom ci-dessus, les noms courts correspondants
   pourraient être : fonc, tache, anom,…

|Création d'un nouvel outil de suivi|

L'étape suivante consiste à prendre une décision concernant les champs à
utiliser dans l'outil de suivi. Pour vous éviter d'avoir à redéfinir
sans cesse les outils de suivi les plus fréquemment utilisés (par
exemple un outil de suivi d'anomalies, de tâches, de demandes
d'assistance, etc...) SYS\_PRODUCT\_NAME offre un certain nombre de
modèles d'outils de suivi prédéfinis à partir desquels vous pouvez créer
votre propre outil de suivi. Ces modèles sont définis soit au niveau du
site (modèles-site) soit au niveau du projet.

**Remarque** : l'utilisation de modèles ne signifie pas que vous deviez
vous conformer strictement aux champs proposés. Il est toujours possible
d'ajouter, de supprimer ou de modifier des champs en partant du modèle
initial.

-  **Modèle-site** : il s'agit de modèles définis par les
   administrateurs du site SYS\_PRODUCT\_NAME qui sont en général utiles
   à de nombreux projets. C'est aussi un moyen d'amroniser les processus
   d'un projet à l'autre tout en facilitant la vie des équipes de
   projet. Vous rouverez des outils de suivi pour les anomalies, les
   tâches, etc... Un modèle particulier appelé "Aucun" permet de créer
   un tracker vierge de tout champ sauf certains qui restent
   obligatoires. Voir ? pour plus d'information concernant ces modèles.

-  **Modèle-projet** : si vous avez déjà défini un outil de suivi qui
   répond à vos besoins et que vous souhaitez le réutiliser, il suffit
   de spécifier l'identifiant du projet et celui de l'outil de suivi
   soit manuellement soit en utilisant les flèches du menu déroulant,
   puis de cliquer sur le bouton de création. Vous allez ainsi créer un
   nouvel outil de suivi strictement identique au précédent. (**Note** :
   cette opération ne copie pas les artefacts mais uniquement la
   configuration des champs et la structure du formulaire des artefacts)

Modèles d'outils de suivi de SYS\_PRODUCT\_NAME
===============================================

Les outils de suivi standards fournis par défaut sont :

-  Bugs

-  Tasks

-  User stories

-  Change Requests

-  Requirements

-  Risks

Chacun de ces outils de suivi possède des champs prédéfinis qui
correspondent à un processus de travail spécifique autour des
correctifs, des bugs, etc... Dans les paragraphes qui suivent, nous
donnons une présentation très générale de ces processus de travail. Pour
chaque outil de suivi, l'équipe SYS\_PRODUCT\_NAME a essayé de maintenir
un équilibre entre sophistication et facilité d'utilisation. En
conséquence, les modèles proposés aux projets hébergés sur
SYS\_PRODUCT\_NAME sont simples. Les membres du projet sont ensuite
libres de décider par eux-mêmes des informations qu'un artefact doit
comporter et de personnaliser la définition des champs en conséquence.

L'outil de suivi d'anomalies (Bugs)
-----------------------------------

L'une des règles d'or d'un environnement de projet collaboratif est de
permettre à ces utilisateurs de tester le logiciel et de rendre compte
librement des anomalies (bugs) rencontrées. L'outil de suivi Bug a
précisément été conçu dans cet objectif.

L'outil de suivi Bug est pré-configuré avec un ensemble de champs
(utilisés ou pas) qui sont probablement suffisant pour une grande
majorité des projets hébergés sur SYS\_PRODUCT\_NAME. Vous pouvez bien
sûr décider que certains champs critiques doivent être créés ou, au
contraire, passer le statut de certains champs à "Inutilisé" pour
simplifier l'outil de suivi.

L'outil de suivi de tâches (Tasks)
----------------------------------

L'outil de suivi de tâches de SYS\_PRODUCT\_NAME est un gestionnaire de
tâches et pas un logiciel de gestion de projet comme CA-SuperProject,
MS-Project ou d'autres logiciels plus complexes. Iic, il s'agit d'un
outil simple qui permet aux membres du projet de suivre l'évolution de
leurs tâches et le temps qu'ils y consacrent ou bien encore de suivre au
quotidien la liste des choses à faire.

L'outil de suivi de tâches offre des fonctionnalités qui en font un
outil complémentaire des logiciels de gestion et de planification de
projets :

-  Comme tous les autres outils SYS\_PRODUCT\_NAME, l'outil de suivi de
   tâches est entièrement basé Web. Ainsi n'importe quel membre du
   projet peut mettre à jour ses tâches où qu'il se trouve.

-  Les tâches peuvent être gérées par les membres autorisés uniquement.

-  Chaque membre du projet dispose de sa feuille de tâches montrant
   toutes les tâches qui lui sont assignées, leur priorité, leur
   description, les dates de début et de fin, le pourcentage de
   complétion, les tâches dépendantes, les commentaires associés et
   l'historique complet des changements.

-  Les données concernant les tâches peuvent être collectées à tout
   moment par le chef de projet en utilisant la fonction d'exportation
   des données de SYS\_PRODUCT\_NAME (voir ?). Ceci permet de générer
   très facilement des rapports d'activité et de progression des
   projets.

L'outil de suivi "User Story"
-----------------------------

SYS\_PRODUCT\_NAME facilite le déploiement de la méthodologie Scrum en
fournissant un outil de suivi "User Story" à chaque projet. Vous
trouverez une définition de Scrum sur
`Wikipédia <http://en.wikipedia.org/wiki/Scrum_(development)>`__.

L'outil de suivi "User Story" contient des artefacts nommés "User
Stories", qui regroupent les besoins exprimés par les clients du projet.
Cet outil de suivi a été conçu pour saisir les exigences du client : il
est possible de définir la valeur de chaque "user story", l'effort
estimé, etc.

D'autres champs optionnels sont disponibles, et bien sûr, chaque projet
peut définir l'outil de suivi qui correspond au mieux à son application
de la méthodologie.

Au début d'un projet Scrum, chaque "user story" doit être stockée.
Durant le premier sprint, plusieurs "stories" sont sélectionnés par
l'équipe dans le but d'être implémentée durant la première itération.
L'équipe assigne les "stories" aux membres de l'équipe qui peut alors
commencer le développement.

A la fin du sprint (après deux à quatre semaines), l'équipe se réunit
pour un nouveau "Sprint Meeting". Les "user stories" sélectionnées lors
du sprint précédent sont mises à jour dans l'outil de suivi, et de
nouvelles "stories" sont sélectionnées pour le prochain "Sprint".

L'outil de suivi "Change Request"
---------------------------------

Cet outil de suivi permet de stocker des "Change Request" afin de gérer
les réajustements de votre application. Ceci est important dans la
conduite du changement (ITIL, PRINCE2, ...). Une "change request" est
déclarative, c'est-à-dire qu'elle établit ce qui doit être fait, mais
laisse de côté la manière d'opérer ce changement.

Quand vous soumettez une demande de changement, vous devez fournir des
informations sur :

-  Le produit impacté (Produit, version)

-  Le statut de l'approbation (approuvé par, traitement)

-  La description de la demande de changement (description,
   justification, impact si aucun changement)

-  L'analyse de l'impact du changement (Objectifs, livrables, risques,
   budget)

Vous pouvez mettre en place des permissions afin d'autoriser seulement
le client et les responsables à accéder à cet outil de suivi. Par
exemple :

-  seul le client peut mettre à jour le champ "priorité"

-  seul l'administrateur du projet peut mettre à jour les champs
   "approuvé par" et "traitement"

-  les deux peuvent mettre à jour les champs liés aux impacts.

Comme pour tous les outils de suivi, l'administrateur du tracker peut
personnaliser les champs selon ses propres process.

L'outil de suivi de exigences (Requirements)
--------------------------------------------

Cet outil de suivi permet, en ingénierie informatique, de gérer les
exigences d'un projet, en identifiant par exemple des caractéristiques
ayant de la valeur pour un utilisateur.

Le suivi des exigences est également d'une grande aide dans un processus
de vérification, puisque les tests peuvent être suivis par le biais
d'exigences spécifiques. Ce type d'outil de suivi est également très
utile dans le cadre d'applications du modèle CMMI.

Quand vous soumettez un nouvelle exigence, vous devez décrire :

-  Le produit impacté (Produit, version)

-  Les caractéristiques de l'exigence (type, nature, complexité,
   priorité)

-  La description de l'exigence (origine, description, solution
   proposée)

-  L'état de l'exigence (état, satisfait par)

Vous pouvez alors lier (en utilisant les références croisées) une
exigence à un test ou à une autre exigence à des fins de traçabilité.

Vous pouvez mettre en place des permissions afin de permettre seulement
au client et aux managers d'accéder à cet outil de suivi.

Comme pour tous les outils de suivi, l'administrateur du tracker peut
personnaliser les champs selon ses propres process.

L'outil de suivi des risques
----------------------------

Cet outil de suivi permet de gérer les risques. Il fournit des
informations liées à l'identification, la priorisation, l'estimation des
risques durant tout le cycle de vie du projet. Vous pouvez minimiser et
contrôler la probabilité et/ou l'impact d'évenements malheureux ou
maximiser la réalisation d'opportunités. Les risques peuvent être liés
(en utilisant les références croisées) à des actions/tâches/documents
afin de minimiser l'impact ou l'appréciation.

Quand vous estimez un risque, vous devez fournir certaines informations
:

-  Taux d'une occurence(appréciation, tendance)

-  Impacts

-  Echelle de temps

-  Action pour réduire le risque(action, responsable)

Administration des outils de suivi
==================================

Depuis le début du chapitre concernant les outils de suivi, il a été
fait plusieurs fois mention de la flexibilité de ce service et de la
facilité à personnaliser vos propres outils de suivi. La configuration
se fait via le module d'administration des outils de suivi accessible
par l'entrée "Administration des outils de suivi" de la barre de menu.

La configuration d'un outil de suivi se divise en dix sections :

-  **Options générales**: le nom, la description et quelques autres
   paramètres généraux sont définis dans cette section.

-  **Gestion des permissions**: permet d'octroyer des permissions
   d'accès différentes aux utilisateurs en fonction de leur rôle.

-  **Gérer l'utilisation des champs**: permet de créer un outil de suivi

-  **Gérer la sémantique**: permet de définir la sémantique des champs.

-  **Gérer les dépendances entre champs**: permet de définir comment les
   valeurs d'un champ dépendent des valeurs d'un autre champ

-  **Gestion des réponses-type** : permet de créer des commentaires
   prédéfinis que l'équipe utilise régulièrement.

-  **Gérer le Workflow**: Définir le worflow de l'outil de suivi.

-  **Options de notification** : réglage des options de notification par
   email globales ou personnelles.

-  **Import CSV**: permet d' importer des artefacts à partir d'un
   fichier CSV

-  **Export**: permet d'exporter un outil de suivi au format xml.

Options générales
-----------------

Ce module vous permet de définir un ensemble de propriétés pour votre
outil de suivi. Certaines de ces propriétés ont déjà été définies dans
le formulaire de création, mais d'autres sont uniquement disponibles sur
cette page de configuration :

-  **Nom** : il s'agit du nom de l'outil de suivi. Le nom d'un outil de
   suivi est classiquement calqué sur le nom des artefacts qui sont
   gérés. Ce nom est utilisé par SYS\_PRODUCT\_NAME dans le titre de
   plusieurs écrans de l'outil de suivi. Quelques exemples de noms
   d'outils de suivi : Demandes de fonctionnalités, Tâches, Anomalies,
   ...

-  **Description** : une description plus complète de l'outil de suivi
   et des artefacts qu'il gère.

-  **Nom court** : il s'agit d'un nom court décrivant le type
   d'artefacts gérés par l'outil de suivi. Le nom doit être aussi court
   que possible car il est utilisé sur plusieurs écrans de l'outil de
   suivi comme, par exemple, sur l'écran de modification d'un artefact
   où le nom court apparaît dans la barre de menu et à côté de
   l'identifiant de l'artefact. Si nous reprenons les exemples donnés
   pour le champ Nom ci-dessus, les noms courts correspondants
   pourraient être : fonc, tache, anom,…

-  **Instancier dans les nouveaux projets**: Ce paramètre n'est affiché
   que lorsque le projet courant est du type "modèle de projet" (voir
   ?). Si ce paramètre est sélectionné, alors les projets créés depuis
   ce modèle de projet auront cet outil de suivi. S'il n'est pas
   sélectionné, cet outil de suivi ne sera pas disponible dans le
   nouveau projet.

-  **Instructions de soumission** : un message d'introduction qui
   s'affiche en haut de l'écran de soumission d'un nouvel artefact.
   C'est une façon très commode de donner des instructions aux
   utilisateurs qui soumettent de nouveaux artefacts. Le texte doit être
   formaté avec des balises HTML, ce qui vous donne une grande
   flexibilité (vous pouvez utiliser des caractères gras, de l'italique,
   des couleurs, des URLs…)

-  **Instructions de navigation** : un message d'introduction qui
   s'affiche en haut de l'écran de recherche et de navigation dans la
   base d'artefacts. Le texte doit être formaté avec des balises HTML,
   ce qui vous donne un grande flexibilité (vous pouvez utiliser des
   caractères gras, de l'italique, des couleurs, des URLs…)

Gestion des permissions
-----------------------

Ce module est utilisé pour donner des permissions d'accès différentes
aux utilisateurs suivant leur rôle.

Les permissions d'accès peuvent être définies à deux niveaux :

-  **Au niveau de l'outil de suivi et des artefacts** : à ce niveau,
   vous pouvez déterminer si certains groupes d'utilisateurs ont un
   accès total, partiel ou nul à l'outil de suivi et à ses artefacts.

-  **Au niveau des champs d'un artefact** : il s'agit d'un niveau de
   permission plus fin défini au niveau de chaque champ de l'outil de
   suivi. En utilisant cette fonctionnalité vous pouvez spécifier quels
   groupes ont uniquement les droits en lecture sur un champ, quels
   autres groupes ont les droits de modification et quels sont ceux qui
   n'ont aucun accès.

Toutes les permissions sont définies pour des groupes d'utilisateurs et
non au niveau des individus. Reportez vous à la ? pour plus
d'information sur la définition et la gestion des groupes
d'utilisateurs.

Gestion des permissions de l'outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

En pénétrant dans ce module, une liste de groupes d'utilisateurs
apparaît ainsi que leur permissions d'accès. La liste des groupes montre
tout d'abord les groupes définis au niveau du système SYS\_PRODUCT\_NAME
comme l'ensemble des utilisateurs, les utilisateurs enregistrés, les
membres du projet, etc... Il s'agit de groupes que SYS\_PRODUCT\_NAME
gère pour vous de telle façon que vous n'avez pas à les modifier
lorsqu'un utilisateur crée un compte ou qu'il devient membre du projet.
La seconde partie de la liste est constituée de groupes d'utilisateurs
définis au niveau du projet (voir ? pour plus d'information sur la
définition et la gestion de ces groupes d'utilisateurs).

Chaque groupe peut être associé avec les permissions suivantes :

-  **HYPHEN** : ce niveau de permission qui s'affiche sous forme d'un
   tiret signifie que le groupe n'a pas de permission spécifique.

-  **Accès à tous les artefacts** : le groupe a accès à tous les
   artefacts de l'outil de suivi.

-  **Accès aux artefacts confiés au groupe** : le groupe voit uniquement
   les artefacts qui sont assignés à un ou plusieurs membres du groupe.

-  **Accès aux artefacts soumis par le groupe** : le groupe voit
   uniquement les artefacts qui ont été soumis par un des membres du
   groupe.

-  **Accès aux artefacts confiés au groupe ou soumis par le groupe** :
   le groupe a uniquement accès aux artefacts soumis par un des membres
   du groupe ou assignés à un ou plusieurs membres.

Gestion des permissions des champs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

En complément des permissions d'accès sur l'outil de suivi et ses
artefacts (voir ?) il est parfois nécessaire de restreindre l'accès à
certains champs de l'outil de suivi pour une population donnée. Par
exemple, si vous partagez un outil de suivi avec vos clients vous
souhaiterez probablement cacher certains champs ou tout du moins éviter
qu'ils ne puissent les modifier. C'est précisément le rôle de ce module.

L'écran de ce module de configuration des permissions sur les champs
permet à tout moment de basculer entre deux vues : vous pouvez soit
visualiser les permissions de tous les groupes pour un champ donné OU
pour un groupe d'utilisateurs donnés vous pouvez visualiser ses
permissions sur tous les champs de l'outil de suivi. L'expérience montre
que la vue par champ est souvent la vue la plus adaptée pour la
configuration initiale des permissions alors que la vue par groupe
d'utilisateurs est plus pratique pour ajuster la configuration des
permissions par la suite (voir ? pour plus d'information sur la
définition des groupes d'utilisateurs).

Chaque groupe d'utilisateurs peut recevoir les permissions suivantes
pour un champ donné :

-  **Peut soumettre** : permet de déterminer si un groupe d'utilisateurs
   peut spécifier la valeur initiale d'un champ lorsque l'artefact est
   soumis pour la première fois. Si la case n'est pas cochée, le champ
   ne sera pas visible sur l'écran de soumission pour ce groupe
   d'utilisateurs.

-  **Lecture seule** : avec cette permission un groupe d'utilisateurs ne
   peut que lire le champ. En d'autres terme la valeur du champ leur est
   visible mais ils ne peuvent la modifier.

-  **Mise à jour** : avec cette permission, un groupe d'utilisateurs
   peut voir la valeur d'un champ et la modifier.

-  **-** : ce niveau de permission qui s'affiche sous forme d'un tiret
   signifie que le groupe n'a pas de permission spécifique, à l'instar
   des permissions sur les outils de suivis.

**Note importante** : les permissions associés à un champ s'appliquent à
plusieurs fonctions de l'outil de suivi. Ainsi, si un groupe
d'utilisateur n'a pas du tout accès à un champ, ce champ sera invisible
sur le formulaire de soumission, mais aussi sur l'écran de recherche,
dans la table de résultats de la recherche, dans l'écran de
modification, dans l'historique des changements et, enfin, dans les
notifications email envoyées aux utilisateurs concernés.

Gestion de l'utilisation des champs
-----------------------------------

Lorsqu'un outil de suivi est créé, il comprend un ensemble de champs
préconfigurés qui proviennent du modèle utilisé pour sa création. Pour
la majorité des projets hébergés sur SYS\_PRODUCT\_NAME il est très
probable que les modèles standards (bugs, tâches, demandes d'assistance)
répondent à la plupart des besoins.

Toutefois SYS\_PRODUCT\_NAME vous permet de personnaliser les champs
utilisés par vos outils de suivi. Il peut s'agir d'une variation autour
d'un modèle standard comprenant l'ajout ou la suppression de quelques
champs mais cela peut aussi être une définition complète à partir d'un
modèle vierge.

Le gestionnaire de création d'un outil de suivi est divisé en deux
parties: une palette de champs (à gauche) et la visualisation de l'outil
de suivi (à droite)(voir la ?)

|Aperçu du gestionnaire de création d'un outil de suivi|

Palette de champs
~~~~~~~~~~~~~~~~~

La palette permet à l'utilisateur de choisir les éléments de son outil
de suivi. La palette du gestionnaire de création d'un outil de suivi est
divisée en quatre groupes :

-  *Champs*: Ce sont des champs basiques (entier, liste, etc.) que
   l'utilisateur pourra mettre à jour. Ils n'ont pas de comportement
   particulier.

-  *Champs dynamiques*: Ces champs ont un comportement particulier. Leur
   valeur ne peut être modifiée par l'utilisateur. Celle-ci est
   déterminée automatiquement (par exemple, l'utilisateur qui a soumis
   l'artefact, l'identifiant de l'artefact, la date de soumission de
   l'artefact, etc.)

-  *Elements structurels*: Ces élements ne sont pas réellement des
   champs. Ils permettent d'améliorer l'aspect des outils de suivi. Ils
   prennent la forme de conteneurs (groupes de champs, colonnes) ou
   d'élements décoratifs (saut de ligne, texte).

-  *Elements inutilisés*: Dans cette partie de la palette, se trouvent
   les champs qui ne sont pas utilisés dans l'outil de suivi. Si vous
   supprimez un champ de l'outil de suivi, il ne sera pas réellement
   supprimé mais sera placé dans la liste des éléments inutilisés. Vous
   pourrez le réutiliser plus facilement. Si vous souhaitez le supprimer
   définitivement, supprimez le directement dans la partie "Elements
   Inutilisés" de la palette. Les éléments inutilisés sont également
   utilsés dans les modèles d'outils de suivi. Vous pouvez donc
   rencontrer des champs que l'équipe n'a pas décidé d'inclure dans les
   modèles, mais qui peuvent avoir néanmoins du sens. Vous pouvez donc
   simplement les ajouter plutôt que de les créer.

Les champs
^^^^^^^^^^

Voici une description détaillée de chaque type de champs :

-  *Chaîne de caractère* : permet à l'utilisateur de saisir un texte
   libre d'une seule ligne. Le résumé d'un artefact est un exemple de
   champ de type ligne de texte.

-  *Texte* : permet à l'utilisateur de saisir un texte libre de
   plusieurs lignes. Ce type de champ est utilisé dans de nombreux
   outils de suivi pour le champ "Description".

-  *Boîte de sélection* : un champ de type "Boîte de sélection" prend sa
   valeur parmi une liste de valeurs prédéfinies par l'administrateur de
   l'outil de suivi. Les valeurs prédéfinies peuvent être soit:

   -  une liste statique de valeurs,
   -  une liste dynamique d'utilisateurs,
   -  une liste dynamique de groupes utilisateurs.

   Selon le navigateur que vous utilisez l'apparence de ce type de champ
   peut varier mais ils sont en général affichés sous la forme d'un menu
   déroulant montrant les valeurs prédéfinies. A un instant donné, ce
   type de champ ne peut avoir qu'une seule valeur.

   Ce type de champ peut également generer des notifications email, voir
   ?.

-  *Boîte de sélections multiples* : comme la boîte de sélection simple
   décrite précédemment, ce champ prend sa valeur parmi une liste de
   valeurs prédéfinies. Par contre il permet de donner plusieurs valeurs
   au champ à un instant donné. Ce type de champ peut être par exemple
   utilisé pour le champ des personnes responsables d'une tâche.

-  *Date*: un champ d'une ligne qui accepte les dates au format ISO
   (AAAA-MM-JJ). Ce champ est fourni avec un calendrier.

-  *Fichier à transmettre* : Ce champ permet d'attacher n'importe quel
   type de fichier. Il est possible d'ajouter plusieurs fichiers. Ce
   type de champ peut être utilisé par exemple dans une section
   "Attachements" d'un outil de suivi de type "Bugs".

-  *Entier* : champ d'une ligne qui accepte uniquement les nombres
   entiers (exemple : 3, -100, 2345…)

-  *Flottant* : champ d'une ligne qui accepte uniquement les nombres
   flottants(exemple : 3.56, -100.3, 2345, 34E+6…)

-  *Liste ouverte* : Ce champ prend sa valeur parmi une liste de valeurs
   mais les valeurs ne sont pas prédéfinies. Cette liste est "ouverte".
   L'utilisateur peut choisir une valeur existante, mais peut aussi
   ajouter une nouvelle valeur. Cette nouvelle valeur fera partie des
   valeurs existantes à la prochaine soumission! De plus, ce champ
   fonctionne avec de l'auto-complétion (en tapant le début d'un mot,
   des suggestions sont faites à l'utilisateur). Pour finir, ce champ
   accepte plusieurs valeurs.

   Comme les champs de listes standards, un champ "Liste Ouverte" peut
   être associé à des valeurs statiques ou dynamiques.

       **Tip**

       La précédente version de l'outil de suivi de SYS\_PRODUCT\_NAME
       contenait une section appelée "CC" qui était utilisée pour
       notifier des personnes des modifications d'un artefact. Cette
       section n'existe plus mais peut être facilement remplacée par un
       champ "Liste Ouverte" dont les valeurs sont assciées à des
       utilisateurs. N'oubliez pas de cocher l'option de notification à
       la création du champ!

-  *Lien vers des artefacts* : Ce champ permet de faire des références
   spécifiques vers d'autres artefacts. Ce type de champ peut être par
   exemple utilisé pour référencer les sous-tâches d'une tâche. ce champ
   accepte plusieurs valeurs.

-  *Permissions sur un artefact*: Ce champ permet de restreindre l'accès
   à un artefact pour certains utilisateurs. La personne ayant soumis
   l'artefact peut donc restreindre l'accès à l'artefct à des groupes
   d'utilisateurs.

Champs dynamiques
^^^^^^^^^^^^^^^^^

Voici une description détaillée de chaque type :

-  *ID de l'artefact* : Il s'agit de l'identifiant unique de l'artefact.
   Il peut être utile de l'afficher pour pouvoir le référencer. L'ID de
   l'artefact ne peut pas être modifié et est crée par le système. Ce
   champ est en lecture seule.

-  *Date de dernière mise à jour* : Ce champ est en lecture seule et ne
   peut donc être modifié par l'utilisateur. La valeur de ce champ
   correspond à la date de dernière modification de l'artefact et est
   créée automatiquement. Chaque modification (modification de la valeur
   d'un champ, ajout d'un commentaire, ...) mettre à jour la valeur de
   ce champ. Ce dernier peut être utile pour suivre l'activité d'un
   outil de suivi.

-  *Auteur de l'artefact* : Ce champ est en lecture seule et ne peut
   donc être modifié par l'utilisateur. La valeur de ce champ correspond
   à l'utilisateur ayant crée l'artefact et est ajoutée automatiquement.

-  *Date de soumission* : Ce champ est en lecture seule et ne peut donc
   être modifié par l'utilisateur. La valeur de ce champ correspond à la
   date de création de l'artefact et est ajoutée automatiquement.

-  *Références Croisées* : ce champ est automatiquement mis à jour avec
   les références existantes de l'artefact. Il affiche liste des objets
   étant référencés par l'artefact ou le référençant.

Elements Structurels
^^^^^^^^^^^^^^^^^^^^

Voici une description détaillée de chaque type :

-  *Groupe de champs* : Cet élément structurel permet de regrouper
   plusieurs champs. Ces derniers sont empilés les uns au dessous des
   autres.

-  *Colonne* : Cet élément structurel permet d'ajouter des colonnes. Les
   colonnes sont alignées les unes à côté des autres. Vous pouvez
   utiliser des colonnes pour aligner des champs sur la même ligne.

-  *Saut de ligne* : Cet élément structurel ajoute un saut de ligne
   invisible au formulaire. Vous pouvez utiliser cet élément pour
   organiser les différents éléments.

-  *Separateur* : Cet élément structurel ajoute une ligne visible au
   formulaire. Vous pouvez utiliser cet élément pour organiser les
   différents éléments.

-  *Texte Statique*: Cet élément structurel ajoute du texte statique au
   formulaire. Vous pouvez utiliser l'éditeur de texte fourni pour
   ajouter de la couleur, formatter le texte, etc. Vous pouvez utiliser
   cet élément pour ajouter des instructions par exemple.

Elements inutilisés
^^^^^^^^^^^^^^^^^^^

Les éléments inutilisés ne sont pas un type de champ, mais correspondent
à la liste des éléments non utilisés. Sélectionnez un de ces champs si
vous souhaitez le réutiliser.

Creation et Modification d'un champ de l'outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ajouter un champ à l'outil de suivi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour ajouter un champ à un outil de suivi, il suffit de sélectionner un
type de champ dans la palette. Cliquez simplement dessus et un
formulaire apparaitra à la place de la palette!

Selon les champs, les propriétés peuvent être différentes. Voici la
liste des différentes propriétés :

-  **Label** : Il s'agit du nom du champ. Bien qu'il soit tres simple de
   modifier le nom d'un champ, nous vous conseillons de le modifier avec
   un nom qui ne soit pas radicallement différent. Si c'est ce que vous
   souhaitez faire, nous vous conseillons plutôt de créer un nouveau
   champ.

-  **Description** : Il s'agit de décrire l'usage de ce champ.

-  **Taille** : Cette propriéte permet de définir l'espace que va
   prendre ce champ à l'écran. Selon le type de champ, cette propriété
   peut avoir des significations différentes.

   -  *Boîte de sélection multiple* : La taille correspond au nombre de
      valeurs qui sont visibles avant d'utiliser la barre de défilement.
      Une valeur entre 2 et 5 parait raisonnable.

   -  *Chaîne de caractères, Entier et Flottant* : "Taille" correspond
      au nombre de caractères directement visibles, la taille maximale
      est 255. "Max. caractères" correspond au nombre maximum de
      caractères pouvant être ajoutés dans ce champ.

   -  *Date* : Une date suit toujours le même modèle (YYYY-MM-DD), sa
      taille est donc fixée à 10 caractères.

   -  *Texte*: Pour les zones de textes, deux valeurs de taille existent
      : "lignes" et "colonnes", où "colonnes" correspond au nombre de
      colonnes dans la zone de texte (la largeur en nombre de
      caractères) et "lignes" correspond au nombre de lignes de texte.
      Notez que le nombre de lgnes n'est pas limité à la valeur de
      "lignes". Si le texte saisi comporte plus de "lignes" que
      définies, une barre de défilement apparaitra.

-  **Rang** : cette valeur correspond à la position du champ dans le
   formulaire.

-  **Requis** : determine s'il est obligatoire de saisir une valeur lors
   de la soumission ou de la mise à jour d'un artefact. Si cette case
   est cochée, l'outil de suivi validera le formulaire seulement si ce
   champ n'est pas vide. Les champs qui doivent être obligatoirement
   remplis comporte un astérisque rouge.

-  **Valeur par défaut** : il s'agit de la valeur qui sera affichée lors
   de la soumission d'un artefact.

-  **Valeurs** : Ceci s'applique aux champs de type "Liste de choix",
   "Liste à choix multiple" et aux champs de type "Liste ouverte" où les
   listes de valeurs que vous allez choisir seront visibles dans des
   menus déroulants lors de la soumission et de la modification d'un
   artefact.

   Vous pouvez lier ces champs à :

   -  **Ajouter des valeurs** : Pour configurer des valeurs, ajoutez
      simplement les valeurs dans la zone de texte (une par ligne).
      Cocher "par ordre alphabétique" triera automatiquement vos
      valeurs.

      SYS\_PRODUCT\_NAME permet d'ajouter ce que nous appelons un
      "decorator" à chaque valeur mais seulement en mode édition. (voir
      ?)

   -  **Une liste d'utilisateurs**: vous avez la possiblité d'associer
      les types de champs cités au-dessus à une liste de valeurs
      prédefinie, qui est générée dynamiquement par la plateforme. Ceci
      peut être utilisé pour créer une liste de choix comportant tous
      les membres du projet. Plutôt que de saisir et de maintenir cette
      liste de valeur à la main, vous ré-utilisez la définition faite
      dans l'administration du projet.

      Notez que si vous décidez de lier un champ à une liste de valeur
      générée automatiquement, vous ne pourrez plus ajouter vos propres
      valeurs. Les listes suivantes sont disponibles (d'autres seront
      ajoutées ultérieurement) :

      -  **Membres du projet** : liste des personnes appartenant au
         projet.

      -  **Administrateurs du projet** : il s'agit des membres du projet
         ayant des droits d'administration.

      -  **Personnes ayant soumis des artefacts** : la liste des
         personnes ayant soumis au moins une fois un artefact.

      -  **Groupes définis dans le projet** : Vous pouvez lier une liste
         de choix à n'importe quel groupe d'utilisateurs défini dans le
         projet. Pour savoir, comment créer de tels groupes, voir la ?.

      Sur l'image suivante on peut constater que le champ "Assigned to"
      est construit à partir de la liste d'utilisteurs du groupe
      "SupportTeam".

   -  **Une liste de groupes utilisateurs**: À l'instar de la liste
      d'utilisateurs, la liste de groupes permet de choisir parmis les
      groupes définis dans l'administration du projet (voir ?).

      Cette option permet la mise en œuvre de configurations avancées
      telles que la définition de groupes de support où plusieurs
      personnes doivent être notifiées simultanément.

      Sur l'image suivante, on peut voir que le champ permet de
      selectionner parmis les groupes d'utilisteurs en fonction de la
      nature du problème remonté:

Modifier les champs d'un outil de suivi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Editer un champ
'''''''''''''''

Afin d'apporter des modifications à un champ, cliquez sur l'icône
d'édition du champ.

Le mode édition permet de configurer certains paramètres non disponibles
à la création :

-  **Modifier le nom du champ**: Le nom du champ est différent du label
   du champ. Le nom du champ est un nom interne au champ qui n'apparait
   pas sur le formulaire. Il est utilisé par l'API SOAP. Il ne doit pas
   contenir de caractères spéciaux, et seuls les lettres en minuscule et
   le caractère "\_" sont autorisés.

-  **Ajouter un "decorator"**: La liste des valeurs peut être enjolivée
   par un "decorator", qui est un carré de couleur. Vous pouvez choisir
   la couleur de chaque valeur à l'aide d'une palette de couleurs. (voir
   la ?). Les "decorators" permettent d'obtenir un indicateur visuel.
   Par exemple, plus une couleur est foncée sur les valeurs de priorité
   d'un bug, plus le bug est prioritaire.

-  **Ajouter des valeurs** Vous pouvez simplement ajouter de nouvelles
   valeurs à une liste en cliquant sur "ajouter de nouvelles valeurs" en
   dessous des valeurs existantes.

-  **Cacher des valeurs** Vous pouvez simplement cacher des valeurs
   existantes en cliquant sur l'cône "cacher" à côté de la valeur. Si
   l'oeil est ouvert, la valeur est disponible. Si l'oeil est à moitié
   fermé, la valeur est cachée. Vous n'avez qu'à cliquer dessus pour le
   rendre de nouveau visible. Les artefacts comportant des valeurs
   cachées les verront toujours apparaître. Mais, ces valeurs ne seront
   plus proposées dans les listes.

-  **Supprimer des valeurs** Vous pouvez supprmier une valeur d'une
   liste en cliquant sur la croix à côté de la valeur. Il est cependant
   impossible de supprimer une valeur si des artefacts comportent cette
   valeur. Dans ce cas-là, vous pouvez cacher la valeur.

-  **Accéder directement au gestionnaire de permissions des champs** En
   éditant un champ, vous pouvez accéder directement au gestionnaire de
   permissions du champ en cliquant sur le lien "Editer les permissions
   du champ".

-  **Configurer les notifications** : Si le champ est une "Liste de
   choix", une "Liste à choix multiple" ou une "Liste ouverte" liée à un
   groupe d'utilisateurs, une case à cocher "Envoyer des notifications
   aux personnes selectionnées" s'affiche. Si celle-ci est cochée, tous
   les utilisateurs sélectionnés recevront un email si l'artefact est
   modifié.

|Administration : Edition d'un champ|

Supprimer un champ
''''''''''''''''''

Pour supprimer un champ, cliquez simplement sur l'icône de suppression
sur la page de visualisation. Le champ ne sera plus visible sur le
formulaire, mais sera présent dans la liste des élements inutilisés de
la palette.

Notez cependant qu'un champ ne peut être supprimé du formulaire si
celui-ci est utilisé dans la sémantique, dans le workflow, ou dans les
dépendances entre champs.

Pour supprimer définitivement un champ, cliquer sur l'icône "poubelle"
dans la liste des élements inutilisés de la palette.

Semantique
----------

Comme les outils de suivi peuvent être complétement personnalisables, il
fallait un moyen de définir ce qu'était le titre d'un artefact, ou ce
qu'on considérait être comme étant un artefact ouvert ou fermé. Cette
fonctionnalité est fournie dans la section d'administration sous le nom
de "Sémantique".

La plupart des outils de suivi que vous utilisez ont une sémantique de
définie. C'est le cas par exemple de tous les outils de suivi
prédéfinis. (voir ?).

Pour définir ou modifier la sémantique d'un champ, sélectionnez l'icône
"crayon" à côté de la propriété sémantique. L'interface d'administration
vous permet de definir les propriétés sémantiques suivantes :

Titre
~~~~~

Le titre d'un artefact est le champ qui résume le mieux l'artefact. Par
exemple, ce peut être le champ **résumé** pour un outil de suivi de
bugs, le champ **nom** pour un outil de suivi des contacts, ou le champ
**Je veux** pour un outil de suivi de "User Stories".

N'importe quel champ de type **texte** peut être choisi pour représenter
le titre d'un artefact.

Cette information est utilisée dans la page de modification d'un tracker
existant, à côté de l'identifiant de l'artefact. Elle est aussi utilisée
dans le widget "Mes Artefacts".

Statut
~~~~~~

Le statut d'un artefact est le champ qui décrit l'état d'un artefact. Si
vous attribuez une sémantique à la notion de statut, vous êtes invités à
définir les valeurs qui signifie *ouvert* pour ce champ.

Le cas le plus commun est un champ **Statut** avec la valeur **ouvert**.
Toutes les autres valeurs peuvent être considérés comme **fermées**.
Vous pouvez néanmoins choisir les valeurs de votre choix issues de n'
importe quelle **liste de choix** (simple ou multiple) pour définir le
statut des artefacts.

Cette information sémantique est utilisée dans le widget "Mes
Artefacts", qui n'affiche que les artefacts *ouverts* qui vous
appartiennent.

Contributeur/ En charge
~~~~~~~~~~~~~~~~~~~~~~~

Le contributeur d'un artéfact est la ou les personnes en charge de la
résolution de cet artéfact. Par exemple, il peut s'agir du champ
**assigned\_to** pour un tracker de bug, ou du champ **owner** pour un
tracker de tâches.

Vous pouvez choisir n'importe quel champ de type **liste
d'utilisateurs** pour définit le contributeur.

Cette information sémantique est utilisée pour définit certaines
permissions sur un tracker (par exemple, restreindre l'accès du tracker
aux groupes de personnes assignées à des artéfacts).

Tooltip/Info-Bulle
~~~~~~~~~~~~~~~~~~

Le tooltip d'un artefact est l'information affichée lorsque vous passez
la souris sur la référence d'un artefact.

Vous pouvez sélectionner tous les champs que vous voulez pour composer
le tooltip.

Dépendances entre champs
------------------------

Les dépendances entre champs permettent de lier les valeurs d'un champ
source aux valeurs d'un champ cible. Autrement dit, les valeurs
proposées à l'utilisateur final pour un champ pourront dépendre de la
valeur sélectionnée dans un autre champ.

Prenons un cas concret. Soit un champ Système d'exploitation(Linux,
MacOS X, MS Windows, NetBSD) et un champ Version(2.0, 2.1, 2.2, 2.4,
2.6, 3.0, 10.1, 10.2, 10.3, 10.4 (Tiger), NT, 2000, XP). Définissons les
dépendances dans l'interface d'administration de l'outil de suivi :

1. On sélectionne d'abord le champ source "Système d'exploitation" puis
   le champ cible "Version".

2. Pour définir des dépendances entre "Système d'exploitation" et les
   versions correspondantes, il suffit de cocher la case correspondante
   dans la matrice.

Commencez par sélectionner le champ source

|Sélection du champ source|

Une fois, le champ source sélectionné (ici, "Système d'exploitation"),
vous pouvez sélectionner le champ cible.

|Sélection du champ cible|

Validez, et une matrice avec des valeurs s'affiche :

|Matrice des dépendances|

A présent, vous pouvez cocher les cases correspondants aux dépendances.
Dans cet exemple, si la valeur du champ source est "Linux", les valeurs
cible correspondantes sont "2.0", "2.2", "2.4", "2.6".

|Une matrice des dépendances remplie|

Une fois la dépendance créée, un lien s'affiche dans la page "Choisir
Source/Cible" si vous avez besoin de la rééditer. Notez que pour
supprimer la dépendance, la matrice doit être vide.

|Récapitulatif des dépendances entre champs|

Une fois les dépendances définies, la liste des valeurs du champ
"Version" sera filtrée selon le "Système d'Exploitation" sélectionné.

|Les versions proposées pour Linux|

|Les versions proposées pour MacOS X|

|Les versions proposées pour MS Windows|

|Les versions proposées pour NetBSD|

Lors de la définition de vos dépendances, veuillez prendre en compte les
points suivants :

-  Seuls les champs de type *Boîte de sélection* et *Boîte de sélection
   multiple* peuvent avoir des dépendances,

-  Les dépendances cycliques sont interdites (Champ 1 => Champ 2 => ...
   => Champ 1),

-  Un champ ne peut dépendre que d'un seul champ,

-  Javascript doit être autorisé sur le navigateur pour pouvoir
   administrer les dépendances,

-  Si un champ n'est pas cible d'une dépendance, alors il proposera
   toutes ses valeurs. Dans le cas contraire, il ne proposera que celles
   qui satisferont les règles de dépendances.

Réponses-type
-------------

Il est assez fréquent de voir des membres d'un projet en charge de la
gestion des artefacts taper souvent le même genre de commentaires. Parmi
les exemples classiques de commentaires répétitifs, on trouve : un
message de remerciement à la personne qui a soumis l'artefact, une
demande d'information complémentaire comme un numéro de version ou le
type de machine utilisée, etc...(voir la ?).

Plutôt que de resaisir sans cesse les mêmes commentaires,
SYS\_PRODUCT\_NAME permet aux membres du projet de définir un ensemble
de commentaires prédéfinis appelés réponses-type. Après avoir défini ces
réponses-type, poster le commentaire correspondant nécessite simplement
de choisir la réponse-type dans la boîte de sélection située à proximité
de la zone de saisie du commentaire dans le formulaire de modification
d'un artefact.

|Définition d'une réponse-type|

Gestionnaire de Workflow
------------------------

Définition
~~~~~~~~~~

Un workflow peut vous aider à contôler le cycle de vie d'un artefact,
vous assurer que vos équipes suivent les méthodologies appliquées dans
votre entreprise (CMMi, etc.).

Vous pouvez définir un Workflow chaque outil de suivi de façon
indépendante.

Pour le moment, un workflow ne peut porter que sur un seul champ. Ce
dernier doit être un champ de type "Liste de Choix".

N.B. La mise à jour massive d'artefacts ne prend pas en compte les
contraintes liées au worflow

Ajouter un workflow à un outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

|Ecran de définition d'un workflow|

-  **Première étape**: vous devez choisir le champ sur lequel appliqué
   le workflow. Un workflow peut être appliqué seulement sur un champ de
   type "Liste de Choix" dont les valeurs ne sont pas liées à un groupe
   d'utilisateur.

-  **Deuxième étape**: définir les transitions du workflow. La ? montre
   un exemple de définition d'un workflow dans l'outil de suivi de Bugs
   prédéfini. Grâce à la partie "Administration du Workflow", vous voyez
   que le workflow est défini sur le champ "Status". Le workflow peut
   simplement être activé ou désactivé en cochant la case et en cliquant
   sur "Valider". Pour supprimer le workflow, cliquez simplement sur la
   croix rouge. Ceci supprimera complétement le workflow défini, et
   toutes les transitions associées.

   La partie "Définir les transitions" permet de définir les transitions
   du workflow. Dans l'exemple fourni par la ?, plusieurs transitions
   ont été définies Par exemple, à la soumission d'un artefact, définie
   par l'état "(New Artifact)", la seule valeur disponible pour le champ
   "Status" sera "New". Quand le statut sera à "New", les seules valeurs
   disponibles seront "Unconfirmed", "Verified" et "Closed".

Définir des règles sur les transitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

|Permissions sur les transitions du workflow|

Groupes autorisés à effectuer la transition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Une fois la transition définie, vous pouvez définir qui peut faire la
transition. Pour cela, cliquez sur le lien "[details]" à côté de la
transition. Sélectionnez alors le groupe d'utilisateurs que vous
autorisez à effectuer la transition. transition (voir la ?).

Actions post-transition
^^^^^^^^^^^^^^^^^^^^^^^

Vous pouvez définir une liste d'actions qui seront exécutées à la fin de
la transition. Pour le moment, les actions possibles concernent les
champs de type date. Vous pouvez mettre à jour automatiquement un champ
avec la date courante ou, au contraire, y supprimer la valeur.

Cette fonctionnalité peut-être mise en œuvre pour positionner
automatiquement une date de cloture lorsqu'un artefact passe de "Résolu"
à "Fermé". De la même façon, vous pouvez supprimer la valeur du champ
"date de cloture" lorsque l'artefact passe de "Fermé" à "Ré-ouvert".

Options de notification email
-----------------------------

Comme expliqué dans la ? les outils de suivi sont préconfigurés avec une
série de règles leur permettant d'informer les personnes concernées des
évènements survenant dans le cycle de vie d'un artefact. Ces règles de
notification par défaut peuvent être modifiées de plusieurs façons :

Notification email globale
~~~~~~~~~~~~~~~~~~~~~~~~~~

En complément des règles de notification par défaut, l'administrateur de
l'outil de suivi a la possibilité de spécifier plusieurs adresses email
séparées par une virgule auxquelles seront systématiquement envoyées des
notifications lors de la création (et éventuellement lors de la
modification) d'un artefact.

Vous pouvez désactiver la vérification des permissions pour la
notification email globale. Ce peut être utile si l'adresse en question
est une liste de distribution. En effet, pour les listes de
distribution, le système ne peut vérifier les permissions individuelles
de chaque membre de la liste. Donc, si la case "vérifier les
permissions" est cochée, les notifications seront envoyées aux membres
de la liste de distribution avec les droits 'utilisateur anonyme'.

Cette fonctionnalité peut être utilisée pour informer de la soumission
d'un nouvel artefact les personnes de l'équipe en charge de leur
qualification et leur assignation.

    **Tip**

    Si vous souhaitez notifier de nombreuses personnes, nous vous
    suggérons d'utiliser les listes de distributions de
    SYS\_PRODUCT\_NAME (voir ?). Une fois la liste de distribution en
    place, il vous suffit de taper l'adresse de la liste dans le champ
    de notification globale pour que toutes les personnes concernées
    soient informées.

    La création d'une liste de distribution a plusieurs avantages : tout
    d'abord chaque individu peut s'abonner ou se désabonner comme il le
    souhaite et, ensuite, tous les messages envoyés à une liste de
    distribution sont conservés dans une archive et peuvent donc servir
    de témoin en cas d'audit.

Importation d'artefacts
-----------------------

Les administrateurs d'un projet ont la possibilité d'importer des
artefacts dans un outil de suivi de SYS\_PRODUCT\_NAME en utilisant des
fichiers au format CSV . Voir la section ? pour plus de détails sur
cette fonctionnalité.

Exporter la structure d'un outil de suivi
-----------------------------------------

SYS\_PRODUCT\_NAME permet d'exporter la structure d'un outil de suivi
dans un fichier XML. Les modèles d'outils de suivi SYS\_PRODUCT\_NAME
sont fournis au format XML. Cette fonctionnalité est également très
utile pour copier un outil de suivi d'un serveur SYS\_PRODUCT\_NAME à un
autre.

Pour exporter la structure d'un outil de suivi, sélectionnez le lien
"Export" dans la partie "Administration". Votre navigateur ouvrira une
nouvelle fenêtre qui vous permettra de choisir où sauvegarder le fichier
XML généré.

**Note**: Cette fonctionnalité ne copie pas les artefacts de l'outil de
suivi mais seulement sa structure (options générales, champs, valeurs,
workflow, semantique, réponses-type et permissions).

.. |Page d'accueil des outils de suivi| image:: ../../screenshots/fr_FR/sc_v5_trackerwelcomescreen.png
.. |Un exemple d'écran de soumission d'artefact (ici de type "bug")| image:: ../../screenshots/fr_FR/sc_v5_artifactsubmission.png
.. |Exemple d'affichage des résultats d'une requête| image:: ../../screenshots/fr_FR/sc_v5_artifactbrowsing.png
.. |image3| image:: ../../icons/artifact-arrow.png
.. |image4| image:: ../../icons/sum--plus.png
.. |Entête d'un écran de modification d'un artefact (champs de l'outil de suivi)| image:: ../../screenshots/fr_FR/sc_v5_artifactupdateheader.png
.. |Commentaires attachés à un artefact| image:: ../../screenshots/fr_FR/sc_v5_artifactupdatecomments.png
.. |Mise à jour massive d'artefacts| image:: ../../screenshots/fr_FR/sc_trackermasschange.png
.. |Notification par email| image:: ../../screenshots/fr_FR/sc_emailnotification.png
.. |Création d'un nouvel outil de suivi| image:: ../../screenshots/fr_FR/sc_v5_trackercreatenewtracker.png
.. |Aperçu du gestionnaire de création d'un outil de suivi| image:: ../../screenshots/fr_FR/sc_tracker_admin_field_usage_overview.png
.. |Administration : Edition d'un champ| image:: ../../screenshots/fr_FR/sc_tracker_admin_field_usage_edition.png
.. |Sélection du champ source| image:: ../../screenshots/fr_FR/sc_v5_trackerfielddependencies_01.png
.. |Sélection du champ cible| image:: ../../screenshots/fr_FR/sc_v5_trackerfielddependencies_02.png
.. |Matrice des dépendances| image:: ../../screenshots/fr_FR/sc_v5_trackerfielddependencies_03.png
.. |Une matrice des dépendances remplie| image:: ../../screenshots/fr_FR/sc_v5_trackerfielddependencies_04.png
.. |Récapitulatif des dépendances entre champs| image:: ../../screenshots/fr_FR/sc_v5_trackerfielddependencies_05.png
.. |Les versions proposées pour Linux| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_07.png
.. |Les versions proposées pour MacOS X| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_08.png
.. |Les versions proposées pour MS Windows| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_09.png
.. |Les versions proposées pour NetBSD| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_10.png
.. |Définition d'une réponse-type| image:: ../../screenshots/fr_FR/sc_v5_trackercannedresponses.png
.. |Ecran de définition d'un workflow| image:: ../../screenshots/fr_FR/sc_manage_workflow.png
.. |Permissions sur les transitions du workflow| image:: ../../screenshots/fr_FR/sc_manage_workflow_transitions.png
