.. contents::
   :depth: 3
..

Outils de suivi ancienne génération
===================================

**Attention :** ce chapitre couvre les fonctionnalités de l'ancienne
version de l'outil de suivi (v3). Pour la documentation de l'outil de
suivi actuel (v5), se référer à ?.

Les outils de suivi (ou trackers) représentent l'un des services les
plus puissants et les plus flexibles mis à la disposition des projets
hébergés sur SYS\_PRODUCT\_NAME. Ils assurent le suivi d'artefacts aussi
variés que des bugs, des tâches, des fiches d'assistance, etc... et un
projet peut créer autant d'outils de suivi que nécessaire.

Tous les outils de suivi, qu'ils soient prédéfinis au niveau du site ou
bien créés par chaque projet sont entièrement personnalisables.

Terminologie et points commun
=============================

Avant de présenter les fonctionnalités des outils de suivi, il est utile
de passer quelques instants sur la terminologie employée pour les outils
de suivi ainsi que sur les fonctionnalités communes.

Étant donné que les outils de suivi sont conçus pour assurer le suivi de
toutes sortes d'items, le terme générique "artefact" est utilisé dans ce
document pour désigner tout type d'item faisant l'objet d'un suivi. Il
peut s'agir d'anomalies, de tâches, de demandes de nouvelles
fonctionnalités ou autres.

Pour définir un nouvel outil de suivi il suffit juste de lui donner un
nom, de choisir les champs à utiliser et les valeurs autorisées pour ces
champs.

En complément des champs personnalisables il existe un certain nombre
d'autres informations qui sont attachés à un artefact de façon immuable.
A savoir :

-  **Les commentaires** : tous les artefacts disposent d'un historique
   complet des commentaires postés par les différents utilisateurs.

-  **Fichiers attachés** : tous les artefacts peuvent recevoir un nombre
   quelconque de fichiers attachés. Ces fichiers contiennent en général
   des informations complémentaires qui précisent la nature de
   l'artefact.

-  **Destinataires en copie (CC)** : un nombre quelconque d'utilisateurs
   peuvent être informés par email de toute modification intervenant sur
   l'artefact en ajoutant leur nom dans la liste des destinataires en
   copie.

Accéder à un outil de suivi
===========================

Pour accéder au service outil de suivi d'un projet, rendez vous d'abord
sur la page de sommaire du projet (voir ?) et cliquez soit sur l'entrée
"Suivi" de la barre de services ou directement sur l'outil de suivi qui
vous intéresse dans la section Zones Publiques de la page de sommaire.

Dans le premier cas, une page récapitulant l'ensemble des outils de
suivi disponibles pour ce projet vous est présentée (voir ?). Après
avoir sélectionné l'outil de suivi qui vous intéresse, un certains
nombre de fonctionnalités vous sont accessibles selon le niveau de
permission dont vous disposez. Vous pouvez soumettre de nouveaux
artefacts, les modifier, effectuer des recherches et naviguer dans la
base d'artefacts ou configurer l'outil de suivi.

|Page d'accueil de l'outil de suivi|

Soumission d'un nouvel artefact
===============================

Pour soumettre un nouvel artefact à un projet donné, vous devez tout
d'abord accéder à l'outil de suivi approprié comme indiqué dans la
section ci-dessus (voir ?.

En pénétrant dans un outil de suivi, un écran de sélection et de
navigation apparaît (plus d'information sur cette fonctionnalité dans la
?). Pour le moment cliquez sur l'entrée "Nouveau" dans le menu de
l'outil de suivi en haut de l'écran (voir ?).

|Un exemple d'écran de soumission d'artefact (ici de type "bug")|

La ? montre un exemple de soumission d'écran provenant d'un projet
SYS\_PRODUCT\_NAME. En raison du très haut niveau de personnalisation de
service de l'outil de suivi de SYS\_PRODUCT\_NAME, les écrans de
soumission d'artefact varient énormément d'un outil de suivi à l'autre.
Suivant les cas les champs affichés et le nom des artefacts diffèrent.

Dans l'exemple fourni sur la ? les artefacts sont des bugs (aussi connu
sous le nom "défauts" ou "anomalies" dans un langage plus châtié). Ici
l'utilisateur doit fournir une catégorie, un groupe, une priorité et une
personne à laquelle assigner l'artefact à partir des boîtes de
sélection. Viennent ensuite la description d'une ligne et une entrée
texte plus longue permettant de mieux décrire le bug en question. Après
avoir soumis l'artefact en appuyant sur le bouton Soumettre, un
identifiant unique (ID) lui est automatiquement assigné.

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

Quoi qu'il en soit, n'oubliez pas de cliquer sur le bouton "Soumettre
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

Critère de sélection
--------------------

La partie supérieure de l'écran de navigation est consacrée aux critères
de recherche. La ? montre le jeu de critères par défaut disponibles à la
création d'un outil de suivi. Ici, des bugs peuvent être sélectionnés en
fonction de leur catégorie, de leur groupe, de leur statut et de la
personne à qui il a été assigné. D'autres outils de suivi peuvent
présenter d'autres critères de sélection en plus ou moins grand nombre
selon la configuration mise en place par les administrateurs de l'outil.

La façon de spécifier la valeur d'un critère de sélection dépend de son
type. Le service outil de suivi propose actuellement les types de champs
suivants :

Champ de type boîte de sélection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Une boîte de sélection prend ses valeurs dans une liste prédéfinie. Si
vous utilisez le mode de recherche simple, seule une valeur peut être
retenue comme critère de recherche. Si vous désirez sélectionner
plusieurs valeurs de recherche, utilisez le mode recherche avancée.

En général deux autres valeurs figurent dans la boîte de sélection :
"Tous" correspond à n'importe quelle valeur de la liste et "Aucun"
correspond aux artefacts pour lesquels la valeur de ce champ n'a pas
encore été remplie.

Champ de type boîte de sélection multiple
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Une boîte de sélection multiple prend ses valeurs dans une liste
prédéfinie. Contrairement à la boîte de sélection décrite précédemment
celle-ci permet d'affecter plusieurs valeurs à un même champ. En mode
recherche, elle se comporte exactement comme la boîte de sélection
précédente : si vous utilisez le mode de recherche simple, seule une
valeur peut être retenue comme critère de recherche. Si vous désirez
sélectionner plusieurs valeurs de recherche, utilisez le mode recherche
avancée.

En général deux autres valeurs figurent dans la boîte de sélection :
"Tous" correspond à n'importe quelle valeur de la liste et "Aucun"
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
   MySQL <http://www.mysql.com/doc/P/a/Pattern_matching.html>`__ peuvent
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
   MySQL <http://www.mysql.com/doc/P/a/Pattern_matching.html>`__ peuvent
   aussi être utilisées comme critère de recherche (exemple : /^4.\*8$/
   recherche tous les nombres dont la valeur commence par un "4", se
   termine par un "8" avec un nombre de chiffres quelconque entre les
   deux y compris le point séparant les décimales.

Requêtes favorites ou prédéfinies pour les outils de suivi
----------------------------------------------------------

    **Tip**

    Si vous effectuez souvent les mêmes recherches dans un outil de
    suivi (c'est à dire des recherches utilisant les mêmes champs de
    sélection et les mêmes valeurs), il est souhaitable que vous les
    sauvegardiez pour pouvoir les réutiliser ultérieurement. Pour ce
    faire, sélectionner le rapport de recherche approprié, spécifiez vos
    critères de sélection et cliquez sur le bouton "Afficher" pour
    lancer la requête. Après exécution et affichage des résultats, il
    suffit de cliquez sur le lien "Cette page en signet" figurant dans
    le menu principal de SYS\_PRODUCT\_NAME pour faire apparaître un
    nouveau signet dans votre page personnelle. En sélectionnant ce
    signet vous pouvez à tout moment relancer la même requête.

Vos requêtes favorites peuvent être sauvegardées comme expliqué dans
l'encadré coup de pouce ci-dessus, mais il existe aussi des requêtes
prédéfinies présentées sous forme de raccourci dans la menu de l'outil
de service. Il s'agit de :

-  **Artefacts ouverts** : affiche tous les artefacts qui ne sont pas
   encore fermés pour ce projet.

-  **Mes Artefacts** : affiche tous les artefacts qui vous sont assignés
   (sur la base du compte utilisateur que vous êtes en train d'utiliser)

Vous noterez aussi que SYS\_PRODUCT\_NAME garde toujours la trace de la
dernière requête effectuée. Lorsque vous vous présenterez à nouveau sur
l'écran de recherche et de navigation, SYS\_PRODUCT\_NAME effectuera la
même requête pour vous et vous présentera les résultats correspondants.

Mode de recherche avancé
~~~~~~~~~~~~~~~~~~~~~~~~

Au tout moment durant une phase de recherche, vous pouvez basculer entre
les modes recherche simple et recherche avancée. Le mode recherche
avancée permet de spécifier plusieurs valeurs pour chaque critère de
sélection. En utilisant ce mode vous pouvez par exemple rechercher à la
fois les bugs dont le statut est 'ouvert' ou 'en attente' qui ont été
assignés aux utilisateurs A ou B.

Résultats de la recherche dans un outil de suivi
------------------------------------------------

Sur la base de vos critères de sélection, SYS\_PRODUCT\_NAME effectue
une requête dans la base de données, sélectionne les artefacts
correspondants et les affiche juste au dessous des critères de
sélection. Le choix des colonnes affichées par la liste de résultat est
entièrement configurable par l'équipe de projet. (voir ?). C'est pour
cette raison que l'écran d'affichage des résultats d'une requête peut
être totalement différents de l'exemple montré sur la ?.

|Un exemple d'affichage des résultats d'une requête sur un tracker|

La sévérité des artefacts est codée sous forme de couleur. La palette
des couleurs utilisées peut varier d'un site à l'autre et d'un thème
graphique à l'autre. C'est pour cette raison que la correspondance entre
niveaux de sévérité et couleurs est toujours indiquée à la suite des
résultats renvoyés par une requête. Enfin, les résultats sont aussi
affichés par bloc de N artefacts où N est un nombre paramétrable par
l'utilisateur. Si plus de N artefacts sont renvoyés par une requête, une
barre de navigation vous permettra de naviguer sur les pages suivantes
et précédentes.

Pour accéder à un artefact donné à partir de la liste des résultats, il
suffit de cliquer sur l'identifiant (ID) de l'artefact correspondant.

Tri de la liste des artefacts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Par défaut, les artefacts sont triés par identifiant (ID) ce qui
correspond à l'ordre chronologique de création des artefacts dans la
base de données de SYS\_PRODUCT\_NAME.

La liste des artefacts peut être triée selon n'importe quelle colonne
affichée à l'écran en cliquant sur l'entête de la colonne. Deux clics
successifs permettent de basculer d'un ordre ascendant à un ordre
descendant. Le sens du tri est visible sous la forme d'un petite flèche
orientée vers le haut ou vers le bas figurant à côté du critère de tri
juste au dessus de la liste des artefacts. La seule exception concerne
le tri par Sévérité qui ne s'affiche pas sous la forme d'une colonne
mais sous la forme d'une palette de couleur. C'est pour cette raison
qu'il existe un lien spécifique permettant d'effectuer le tri par
sévérité.

Le tri multi-colonnes autorise des opérations de tri plus sophistiquées.
Dans ce mode, les critères de tri s'accumulent au fur et à mesure que
vous cliquez sur les entêtes de différentes colonnes. Vous pouvez par
exemple cliquer sur "Sévérité" puis sur "Assigné à" pour voir qui dans
l'équipe est en charge des artefacts critiques et combien il y en a. A
tout moment dans le tri multi-colonnes, un clic sur l'un des critères de
tri affiché dans la liste "critère 1 > critère 2 > critère 3..." vous
ramènera en arrière dans les critères de tri. Grâce à cette
fonctionnalité vous pouvez aisément tester plusieurs stratégies de tri.

    **Note**

    Note : les critères de tri, comme les critères de sélection, sont
    aussi sauvegardés dans vos préférences utilisateurs et
    SYS\_PRODUCT\_NAME appliquera les mêmes critères de tri lors de
    votre prochaine requête.

Exporter les résultats d'une requête
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Au bas de la liste des résultats renvoyés par la requête figure un
bouton qui permet d'exporter les artefacts sélectionné au format CSV. En
utilisant cette fonctionnalité vous pouvez aisément sélectionner les
artefacts auxquels vous souhaitez appliquer des traitements
supplémentaires avec des outils externes à SYS\_PRODUCT\_NAME.

Version imprimable
~~~~~~~~~~~~~~~~~~

Vous pouvez à tout moment cliquer sur le lien "Version imprimable" pour
générer une version simplifiée et non décorée de la liste des artefacts
que vous pourrez imprimer depuis votre navigateur ou copier-coller dans
un document de votre choix. Pour une meilleure lisibilité nous vous
conseillons d'imprimer les résultats en format paysage.

Visualisation graphique
~~~~~~~~~~~~~~~~~~~~~~~

Il est également possible de visualiser les résultats de la requête dans
la section 'Graphiques' . Il y a trois types de graphiques disponibles
nativement : le camembert, le graphique en bâton, et le diagramme de
Gantt.

Rapports de recherche des outils de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les rapports de recherche des outils de suivi permettent de configurer
l'agencement de la page de recherche en choisissant les critères de
sélection et les colonnes de résultats à afficher. Suivant le projet,
les utilisateurs apprécieront la possibilité de pouvoir choisir parmi
plusieurs rapports de recherche en utilisant la boîte de sélection
prévue à cet effet en haut de la page de recherche. Si aucun rapport
spécifique n'a été défini, le rapport appelé 'Défault' est le seul
disponible.

Tout utilisateur SYS\_PRODUCT\_NAME ayant accès à l'outil de suivi peut
définir son propre rapport de recherche. Dans ce cas, le rapport est
personnel et il est uniquement visible par l'utilisateur qui l'a créé. A
l'inverse, les administrateurs du tracker peuvent définir des rapports
de recherche pour l'ensemble du projet que tous les utilisateurs
pourront utiliser. Reportez vous à la ? pour plus de détails concernant
la configuration des rapports de recherche.

Rapports graphiques
~~~~~~~~~~~~~~~~~~~

Il existe également un système de rapport graphique pour les outils de
suivi. Suivant le projet, les utilisateurs apprécieront la possibilité
de pouvoir choisir parmi plusieurs rapports de recherche en utilisant la
boîte de sélection prévue à cet effet en haut de la page de recherche.
Si aucun rapport spécifique n'a été défini, le rapport appelé 'Défault'
est le seul disponible.

Tout utilisateur SYS\_PRODUCT\_NAME ayant accès à l'outil de suivi peut
définir son propre rapport graphique de recherche. Dans ce cas, le
rapport est personnel et il est uniquement visible par l'utilisateur qui
l'a créé. A l'inverse, les administrateurs du tracker peuvent définir
des rapports graphiques de recherche pour l'ensemble du projet que tous
les utilisateurs pourront utiliser. Reportez vous à la ? pour plus de
détails concernant la configuration des rapports graphiques de
recherche.

Modifier un artefact
====================

La sélection de l'identifiant (ID) d'un artefact dans la liste générée
suite à une opération de recherche entraîne l'affichage d'une page qui
comporte toutes les informations concernant cet artefact. Selon les
droits qui vous ont été octroyés sur cet outil de suivi (voir ?) la vue
détaillée présente un certain nombre de champs texte immuables ou
d'autres champs modifiables. Si vous êtes un visiteur anonyme ou un
utilisateur enregistré qui n'est pas membre du projet, il est très
probable que la plupart des champs apparaissent comme non modifiables.
Par défaut, les utilisateurs extérieurs à l'équipe ne peuvent modifier
les champs d'un artefact. Ils sont uniquement en mesure de soumettre un
commentaire, de s'ajouter dans la liste des destinataires en copie ou
d'attacher un fichier à l'artefact.

L'écran de modification d'un artefact se divise en plusieurs sections
:**Entête, Commentaires, Destinataires en copie, Fichier attachés,
Dépendances et Historique.**

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

|Entête d'un écran de modification d'un artefact (champs de l'outil de
suivi)|

Commentaires
------------

Autant de commentaires que nécessaire peuvent être attachés à un
artefact. Il s'agit de commentaires libres saisis dans un champ texte.

Les commentaires présentent plusieurs caractéristiques intéressantes :

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
   sélection prévue à cet effet et de soumettre les modifications. La
   définition d'une réponse-type peut se faire à la volée à partir de
   l'écran de modification d'un artefact en cliquant sur le lien
   "définir une réponse-type".

-  **Types de commentaire** : dans le but d'éviter la croissance
   exponentielle du nombre de champs texte d'un outil de suivi destinés
   à recevoir du texte libre, SYS\_PRODUCT\_NAME offre un mécanisme de
   typage des commentaires. L'équipe de projet peut définir un certain
   nombre de labels qui peuvent servir à étiqueter un commentaire. C'est
   une fonctionnalité intéressante pour définir la nature de
   l'information contenue dans un commentaire et pour les repérer
   rapidement dans la liste des commentaires. Voici quelques exemples
   typiques de labels utilisés dans un système de suivi d'anomalies :
   "Solution de Rechange" pour un commentaire qui explique comment
   contourner un problème, "Fichiers concernés" pour un commentaire qui
   donne la liste des fichiers à modifier pour corriger l'anomalie, "Cas
   de test" pour un commentaire qui décrit comment tester l'anomalie et
   la reproduire, etc... Les types de commentaires sont définis dans le
   module d'administration de l'outil de suivi (voir ?)

-  **Références croisées** : lorsque vous saisissez un commentaire, vous
   pouvez utiliser certains patrons de texte pour référencer d'autres
   artefacts, des commits CVS ou Subversion, des documents, etc... Ces
   patrons seront automatiquement transformés en hyperliens vers les
   objets correspondants lors d'un prochain affichage du commentaire. Il
   s'agit d'un mécanisme extrêmement puissant et simple d'usage qui est
   décrit en détail dans la ?.

|Commentaires attachés à un artefact|

Destinataires en copie
----------------------

Comme nous le verrons plus loin dans ce chapitre (voir ?) les outils de
suivi de SYS\_PRODUCT\_NAME offrent un puissant mécanisme de
notification par email aux utilisateurs qui, à un moment ou à un autre,
ont été impliqués dans le cycle de vie de l'artefact que se soit comme
soumetteur, comme responsable ou simplement pour avoir poster un
commentaire.

Parfois il est cependant utile d'inclure d'autres personnes dans le
processus de notification email même si elles n'y jouent aucun rôle
direct. Par exemple, il se pourrait que vous vouliez envoyer une
copie-carbone (CC) de la notification email à votre responsable
assurance qualité ou bien à la personne qui est à l'origine de
l'artefact si ce n'est pas la même que celle qui l'a soumis. C'est
précisément le rôle que remplit la section Destinataires en copie. Les
utilisateurs insérés dans cette liste recevront les notifications en
rapport avec cet artefact.

Noms des destinataires en copie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les noms des destinataires en copie peuvent être fournis soit sous la
forme d'une adresse email soit comme un nom d'utilisateur
SYS\_PRODUCT\_NAME.

-  **Nom d'utilisateur SYS\_PRODUCT\_NAME** : lorsque la personne que
   vous souhaitez notifier dispose d'un compte SYS\_PRODUCT\_NAME il est
   recommandé d'utiliser ce nom plutôt que son adresse email. En
   utilisant son nom d'utilisateur vous permettez à l'utilisateur de
   définir finement le type de modification qui doit faire l'objet d'une
   notification le concernant. Pour plus d'information sur la
   personnalisation des préférences en matière de notification,
   reportez-vous à la ?.

-  **Adresse email** : il n'existe aucune restriction concernant les
   adresses emails saisies dans la liste des destinataires en copie. Il
   peut s'agir d'adresse email individuelle ou de liste de distribution
   - voir ?. Contrairement au destinataire en copie saisi sous la forme
   d'un nom d'utilisateur, les adresses email ne permettent pas au
   destinataire de personnaliser les notifications reçues et il les
   reçoit donc toutes.

Ajouter et supprimer des destinataires en copie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plusieurs destinataires en copie peuvent être ajoutés simultanément en
séparant leur nom ou leur adresse email par une virgule ou un point
virgule dans le champ "Ajouter en CC". En utilisant le champ commentaire
en regard, on peut aussi préciser la raison pour laquelle ces
destinataires ont été ajoutés ou qui ils sont.

L'ajout et la suppression de destinataires en copie sont sujets à
certaines permissions :

-  Ajout d'un destinataire : les utilisateurs anonymes ne peuvent
   ajouter de destinataire. Tout autre utilisateur possédant un compte
   sur SYS\_PRODUCT\_NAME peut ajouter un destinataire et la liste des
   destinataires indiquera clairement qui a ajouté cette entrée et
   quand.

-  Suppression d'un destinataire : les utilisateurs ayant les droits
   d'administrateurs sur un outil de suivi (voir ?) peuvent détruire
   toute entrée dans la liste des destinataire pour cet outil de suivi.
   Tous les autres utilisateurs peuvent détruire les destinataires
   ajoutés par leurs soins ou les entrées où le destinataire correspond
   à leur adresse email ou à leur nom d'utilisateur. En d'autres termes,
   un utilisateur SYS\_PRODUCT\_NAME a le droit de défaire ce qu'il a
   fait ou de s'enlever lui-même de la liste des destinataires dans
   n'importe quel outil de suivi.

Fichiers attachés à un artefact
-------------------------------

En complément des commentaires, l'outil de suivi permet d'attacher
n'importe quelle information à un artefact sous la forme de fichiers.
Les copies d'écran d'application au format PNG, GIF ou JPEG, le core
dump d'un programme ou un simple fichier texte montrant la pile d'appel
ou un message d'erreur sont autant d'exemples de fichiers qu'il est
possible d'attacher à un artefact.

Les fichiers attachés peuvent être de n'importe quel type (image, vidéo,
son, texte, binaire…) et un commentaire permet éventuellement d'annoter
le fichier attaché. La taille maximum d'un fichier attaché est variable
selon le site. Elle est en général de 2 Moctets.

Dépendances entre artefact
--------------------------

La section qui suit les fichiers attachés sur l'écran de modification
d'un artefact, concerne les dépendances entre artefacts.(voir la ?). Les
utilisateurs de SYS\_PRODUCT\_NAME ont la possibilité d'établir un lien
de dépendance depuis un artefact vers un ou plusieurs autres artefacts
appartenant à n'importe quel outil de suivi de n'importe quel projet.
Ceci est rendu possible par le fait que les artefacts possèdent un
identifiant (ID) unique sur l'ensemble du système SYS\_PRODUCT\_NAME.

SYS\_PRODUCT\_NAME n'attache aucune sémantique aux liens qui unissent
des artefacts. Votre équipe de projet est donc libre de s'entendre sur
la signification d'un tel lien. Il peut s'agir d'une dépendance causale,
d'une duplication de l'information ou d'une dépendance temporel dans le
cas d'un outil de suivi de tâches.

|Dépendance entre artefacts|

Pour créer une dépendance, il faut indiquer l'identifiant d'un ou
plusieurs artefacts (séparés par une virgule) dans le champ réservé à
cet effet et soumettre le formulaire. Les artefacts référencés
apparaîtront dans une table juste en dessous du formulaire de saisie
précisant la description de l'artefact ainsi que l'outil de suivi et le
projet auquel ils appartiennent.

Pour supprimer une dépendance il suffit de cliquer sur l'icône corbeille
située à la droite de la ligne de description de l'artefact et confirmer
(ou infirmer) la suppression dans la boîte de dialogue.

Les dépendances sont affichées dans les deux sens : non seulement on
montre la liste des artefacts dont dépend l'artefact courant mais on
montre aussi tous les artefacts qui dépendent de l'artefact courant.

Références croisées entre artefact
----------------------------------

En complément de la façon plutôt formelle d'exprimer une dépendence
entre deux artefacts présentée dans la ?, SYS\_PRODUCT\_NAME permet de
créer une référence sur n'importe quel artefact ou autre objet
SYS\_PRODUCT\_NAME dans un commentaire.

Lorsque vous tapez du text dans n'importe quel champ texte ou
commentaire d'un artefact, tout morceau de texte qui suit le patron "XXX
#NNN" est interprété comme une référence à l'item XXX numéro NNN, où XXX
est le nom court de l'item (qui peut être un artefact, un commit cvs,
une révision svn...) et NNN l'identifiant unique (ID) (exemple : "bug
#123", "tache #321", "req #12", etc...). Si vous ne connaissez pas le
nom court de l'outil de suivi ou si vous souhaitez ne pas le spécifier
vous pouvez utiliser le patron générique "art #NNN". Lorsque
SYS\_PRODUCT\_NAME affiche un commentaire contenant une référence, elle
est automatiquement transformée en hyperlien vers la page de
SYS\_PRODUCT\_NAME donnant toutes les informations sur cet artefact.

Un commentaire peut contenir un référence à un artefact de n'importe
quel type appartenant à n'importe quel projet. Ce mécanisme **n'est**
pas limité aux artefact appartenant aux outils de suivi du même projet.
Cela est rendu possible par le fait qu'un artefact dispose d'un
identifiant unique sur tout le site SYS\_PRODUCT\_NAME.

Les patrons de référence de SYS\_PRODUCT\_NAME peuvent etre utilisees
pour référencer des artifacts, mais aussi des commits CVS, des révision
Subversion, des documents, des fichiers, etc. Voir la ? pour plus
d'information sur les Références.

De plus les références vers les outils de suivi, les révision SVN et les
commits CVS sont stockées en base de données, et sont résumées dans la
section suivante, classées par type puis par sens de référence initial.

Permissions sur les artefacts
-----------------------------

Les administrateurs d'outil de suivi peuvent restreindre l'accès à un
artefact pour certains utilisateurs. Ces permissions s'ajoutent ainsi à
celles définies au niveau de l'outil de suivi et des champs.

Il suffit à l'administrateur d'éditer un artefact et de restreindre les
permissions comme le montre l'exemple suivant, où l'artefact est
restreind aux administrateurs et aux membres du projet.

|Permissions d'un artefact|

Historique des artefacts
------------------------

La dernière partie de l'écran de modification d'un artefact est consacré
à l'historique des changements subis par l'artefact (voir ?).
L'historique de l'artefact garde la trace de tous les changements
intervenus sur les différents champs de l'artefact depuis sa création.

L'historique de l'artefact montre quel champ a changé, son ancienne
valeur ainsi que la nouvelle, la date de la modification et qui l'a
faite.

|Historique d'un artefact|

Mise à jour massive d'artefacts
===============================

SYS\_PRODUCT\_NAME permet aux administrateurs d'un outil de suivi ou du
projet d'effectuer la même modification sur un ensemble d'artefacts en
une seule étape. Il est ainsi possible d'ajouter le même destinataire en
copie ou le même fichier attaché à un ensemble d'artefacts, d'assigner
une collection d'artefact à une même personne, etc... Une application
typique de cette fonctionnalité de mise à jour massive consiste
précisément à réassigner tous les artefacts d'une personne à une autre.

Critères de sélection
---------------------

Les artefacts à modifier peuvent être sélectionnés en utilisant les
critères de sélection du processus de recherche. Pour une sélection plus
fine, vous pouvez ensuite utiliser les cases à cocher situées à
proximité de chaque artefact. Voyez la ? pour obtenir plus d'information
sur l'utilisation des critères de sélection.

Dans l'écran montré en exemple sur la ?, un clic sur le bouton "Mettre à
jour les artefacts sélectionnés" va retenir les trois artefacts
sélectionnés alors qu'un clic sur le bouton "Tous les mettre à jour"
retiendra les neuf artefacts renvoyés par la recherche dans la base
d'artefacts.

|Écran de sélection des artefacts pour une mise à jour massive|

Mise à jour
-----------

Une fois sélectionnés les artefacts à modifier on peut passer à l'écran
de mise à jour suivant. Cet écran est très similaire à l'écran de
modification d'un artefact. Il comporte les mêmes sections : entête,
commentaire, destinataires en copie, fichiers attachés et dépendances.

|Section d'entête de l'écran de mise à jour massive d'artefacts|

Dans la zone d'entête figurent tous les champs utilisés par l'artefact.
Seuls les champs qui passent de la valeur Inchangé à une valeur
spécifique seront pris en compte lors de la phase de mise à jour. Dans
l'exemple de la ? seul le champ 'Assigné à' des trois artefacts sera mis
à jour. Tous les autres champs restent inchangés.

|Section destinataire en copie de l'écran de mise à jour massive
d'artefacts|

La section des destinataires en copie diffère de son comportement en ce
qu'elle montre tous les destinataires de tous les artefacts retenus pour
la mise à jour massive avec un compteur indiquant dans combien
d'artefacts un destinataire est présent. Dans l'exemple de la ?, un des
destinataires est utilisé dans un des trois artefacts. En sélectionnant
la case Détruire ? on supprime le destinataire de la liste des
destinataires.

De la même façon, la section consacrée aux fichiers attachés montre
l'ensemble des fichiers attachés de tous les artefacts sélectionnés pour
la mise à jour massive. La section des dépendances est structurée de la
même façon.

Chaque modification massive est consignée dans l'historique de chaque
artefact affecté (?). Par contre aucune notification email n'est envoyée
suite à ces changements.

Dupliquer un artefact
=====================

Si la duplication d'artefacts est activée pour le tracker (voir la
section ?), les membres du projets peuvent dupliquer un artefact. Pour
ce faire, sélectionnez un artefact existant (comme si vous vouliez le
modifier) et cliquez sur le lien "Dupliquer cet artefact". Vous arrivez
alors sur une page de soumission d'artefact, avec toutes les valeurs de
l'artefact dupliqué déjà remplies. Comme le champ Summary est unique,
une indication de la duplication est simplement ajoutée à sa valeur
originale. Par défaut, un commentaire est également pré-rempli, avec une
indication de la duplication, et une dépendance est également
pré-remplie, avec une référence vers l'artefact original. Bien entendu,
vous êtes libre de modifier le nouvel artefact dupliqué.

Seuls les membres du projet sont autorisés à dupliquer les artefacts.

Notification email
==================

Les outil de suivi de SYS\_PRODUCT\_NAME sont munis d'un mécanisme de
notification d'évènements par email puissant et flexible. A moins que
l'administrateur de projet ou les utilisateurs eux-mêmes n'en décident
autrement, le système de notification par email adopte un comportement
par défaut très simple. A chaque fois qu'un artefact est créé ou modifié
- que ce soit avec un nouveau commentaire, un nouveau fichier attaché ou
un changement dans l'un quelconque des champs - un message est envoyé
aux acteurs suivants :

-  La personne qui a soumis l'artefact

-  La ou les personnes à qui l'artefact a été assigné

-  Les personnes présentes dans la liste des destinataires en copie.

-  Tous les utilisateurs ayant posté au moins un commentaire sur cet
   artefact.

En plus de ces règles simples, le module d'administration de l'outil de
suivi permet aux utilisateurs SYS\_PRODUCT\_NAME de personnaliser le
processus de notification email. Pour plus d'information reportez-vous à
la ?).

Le message de notification généré par l'outil de suivi se compose d'une
première partie montrant les changements récemment intervenus dans
l'artefact à l'occasion de la dernière mise à jour. A la suite se trouve
un récapitulatif complet de l'artefact. Des pointeurs Web sont aussi
présents dans le message pour vous permettre d'accéder facilement et
rapidement à l'artefact sur SYS\_PRODUCT\_NAME.

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
reportez-vous à la ?). Les permissions par défaut sont résumées dans la
table ci-dessous :

+----------------------------------+------------------------------------------+
| Tracker Feature                  | Access Permission                        |
+==================================+==========================================+
| `Soumission d'un nouvel          | Par défaut tout visiteur, connecté à     |
| artefact <#ArtifactSubmission>`_ | SYS\_PRODUCT\_NAME ou pas, peut          |
| _                                | soumettre un nouvel artefact.            |
|                                  | L'administrateur de l'outil de suivi     |
|                                  | peut limiter l'usage de cette fonction   |
|                                  | aux utilisateurs enregistrés ou aux      |
|                                  | membres du projet si l'outil de suivi    |
|                                  | est privé.                               |
+----------------------------------+------------------------------------------+
| `Navigation/Recherche            | La recherche et la navigation dans la    |
| d'artefact <#ArtifactBrowsing>`_ | base d'artefacts est accessible à tous   |
| _                                | les visiteurs SYS\_PRODUCT\_NAME sauf si |
|                                  | l'outil de suivi est privé auquel cas    |
|                                  | seuls les membres de l'équipe y ont      |
|                                  | accès.                                   |
+----------------------------------+------------------------------------------+
| `Modification des                | Par défaut seuls les membres du projet   |
| artefacts <#ArtifactUpdate>`__   | peuvent modifier un artefact. Les        |
|                                  | visiteurs externes ne peuvent soumettre  |
|                                  | qu'un commentaire ou attacher un         |
|                                  | fichier.                                 |
+----------------------------------+------------------------------------------+
| `Mise à jour massive des         | Uniquement accessible aux                |
| artefacts <#ArtifactMassChange>` | administrateurs du projet et aux membres |
| __                               | du projet ayant les droits               |
|                                  | d'administration sur l'outil de suivi en |
|                                  | question.                                |
+----------------------------------+------------------------------------------+
| `Importation                     | Uniquement accessible aux                |
| d'artefacts <#ArtifactImport>`__ | administrateurs du projet et aux membres |
|                                  | du projet ayant les droits               |
|                                  | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Création d'un outil de          | Uniquement accessible aux                |
| suivi <#TrackerFieldUsageManagem | administrateurs du projet.               |
| ent>`__                          |                                          |
+----------------------------------+------------------------------------------+
| `Administration d'un outil de    | Uniquement accessible aux                |
| suivi - Options                  | administrateurs du projet et aux membres |
| générales <#TrackerFieldUsageMan | du projet ayant les droits               |
| agement>`__                      | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration d'un outil de    | Uniquement accessible aux                |
| suivi - Gérer l'utilisation des  | administrateurs du projet et aux membres |
| champs <#TrackerFieldUsageManage | du projet ayant les droits               |
| ment>`__                         | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration d'un outil de    | Uniquement accessible aux                |
| suivi - Gérer les valeurs des    | administrateurs du projet et aux membres |
| champs <#TrackerFieldValuesManag | du projet ayant les droits               |
| ement>`__                        | d'administration sur l'outil de suivi.   |
+----------------------------------+------------------------------------------+
| `Administration d'un outil de    | Seuls les administrateurs du projet et   |
| suivi - Gérer les rapports de    | les membres du projet ayant les droits   |
| recherche <#TrackerReportManagem | d'administration sur l'outil de suivi    |
| ent>`__                          | peuvent définir des rapports de          |
|                                  | recherche pour l'ensemble des            |
|                                  | utilisateurs. Tous les autres            |
|                                  | utilisateurs (sauf les anonymes) ne      |
|                                  | peuvent définir que des rapports         |
|                                  | personnels.                              |
+----------------------------------+------------------------------------------+
| `Administration d'un outil de    | Seuls les administrateurs du projet      |
| suivi - Notification             | peuvent configurer les adresses de       |
| email <#TrackerEmailNotification | notification globale. Tout membre du     |
| Settings>`__                     | projet peut demander à suivre les        |
|                                  | notifications des autres membres. Tout   |
|                                  | utilisateur enregistré peut              |
|                                  | personnaliser sa matrice de notification |
|                                  | personnelle.                             |
+----------------------------------+------------------------------------------+

Table: Permissions d'accès par défaut des outils de suivi

Création d'un outil de suivi
============================

Avant de choisir les champs et les valeurs associés aux champs d'un
outil de suivi, il faut tout d'abord créer cet outil de suivi. On peut
accéder à la page de création d'un tracker depuis l'entrée "Créer un
outil de suivi" visible à la fois dans le menu de la partie publique et
dans celui de la partie administration.

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

|Création d'un nouvel outil de suivi (ici pour des anomalies)|

L'étape suivante consiste à prendre une décision concernant les champs à
utiliser dans l'outil de suivi. Pour vous éviter d'avoir à redéfinir
sans cesse les outils de suivi les plus fréquemment utilisés (par
exemple un outil de suivi d'anomalies, de tâches, de demandes
d'assistance, etc...) SYS\_PRODUCT\_NAME offre un certain nombre de
patrons d'outils de suivi prédéfinis à partir desquels vous pouvez créer
votre propre outil de suivi. Ces patrons sont définis soit au niveau du
site (patrons-site) soit au niveau du projet.

**Remarque** : l'utilisation de patrons ne signifie pas que vous deviez
vous conformer strictement aux champs proposés. Il est toujours possible
d'ajouter, de supprimer ou de modifier des champs en partant du patron
initial.

-  **Patrons-site** : il s'agit de patrons définis par les
   administrateurs du site SYS\_PRODUCT\_NAME qui sont en général utiles
   à de nombreux projets. C'est aussi un moyen d'assurer une certaine
   harmonie d'un projet à l'autre tout en facilitant la vie des équipes
   de projet. La liste des patrons-site disponibles varie d'un site à
   l'autre mais vous y trouverez typiquement des outils de suivi pour
   les anomalies, les tâches, etc... Un patron particulier appelé
   "Aucun" permet de créer un tracker vierge de tout champ sauf certains
   qui restent obligatoires. Voir ? pour plus d'information concernant
   ces patrons.

-  **Patrons-projet** : si vous avez déjà défini un outil de suivi qui
   répond à vos besoins et que vous souhaitez le réutiliser, il suffit
   de spécifier l'identifiant du projet et celui de l'outil de suivi
   soit manuellement soit en utilisant les flèches du menu déroulant,
   puis de cliquer sur le bouton de création. Vous allez ainsi créer un
   nouvel outil de suivi strictement identique au précédent. (**Note** :
   cette opération ne copie pas les artefacts mais uniquement la
   configuration des champs)

Patrons d'outils de suivi du site
=================================

Les outils de suivi standards fournis pour chaque projet sont :

-  Bugs

-  Patch

-  Support Requests

-  Tasks

-  Scrum Backlog

Chacun de ces outils de suivi possède des champs prédéfinis qui
correspondent à un processus de travail spécifique autour des
correctifs, des bugs, etc... Dans les paragraphes qui suivent, nous
donnons une présentation très générale de ces processus de travail. Pour
chaque outil de suivi, l'équipe SYS\_PRODUCT\_NAME a essayé de maintenir
un équilibre entre sophistication et facilité d'utilisation. En
conséquence, les patrons proposés aux projets hébergés sur
SYS\_PRODUCT\_NAME sont simples. Les membres du projet sont ensuite
libres de décider par eux-mêmes des informations qu'un artefact doit
comporter et de personnaliser la définition des champs en conséquence.

L'outil de suivi d'anomalies (bugs)
-----------------------------------

L'une des règles d'or d'un environnement de projet collaboratif est de
permettre à ces utilisateurs de tester le logiciel et de rendre compte
librement des anomalies (bugs) rencontrées. L'outil de suivi Bug a
précisément été conçu dans cet objectif.

L'outil de suivi Bug est pré-configuré avec un ensemble de champs
(utilisés ou pas) qui sont probablement suffisant pour une grande
majorité des projets hébergés sur SYS\_PRODUCT\_NAME. Vous pouvez bien
sûr décider que certains champs critiques doivent être créés ou, au
contraire, passez le statut de certains champs à "Inutilisé" pour
simplifier l'outil de suivi.

L'outil de suivi de correctifs (patches)
----------------------------------------

Le rôle de l'outil de suivi de correctifs est de permettre aux personnes
extérieures au projet ou aux membres du projet ayant des droits
restreints de soumettre des propositions de modifications dans le code
source du projet.

Concernant la façon de générer des correctifs s'appliquant au code
source, reportez-vous au chapitre CVS (?) ou Subversion (?).

    **Note**

    *Note à l'intention des équipes de projet*

    Recevoir des modifications du code source d'autres utilisateurs
    n'implique pas que vous deviez les intégrer de façon systématique
    dans l'arbre de code source principal. Il revient à l'équipe de
    projet de décider quoi faire de ces contributions. L'une des
    caractéristiques intéressantes de l'outil de suivi de correctifs est
    de donner accès aux fichiers de corrections que l'équipe de projet
    ait décidé de l'intégrer dans l'arbre de développement principal ou
    pas. Ainsi les visiteurs peuvent non seulement consulter les
    contributions des autres personnes mais aussi les utiliser pour
    eux-mêmes s'ils le souhaitent même si l'équipe de projet a décidé de
    ne pas intégrer le correctif.

L'outil de suivi de demandes d'assistance (support requests)
------------------------------------------------------------

L'outil de suivi de demandes d'assistance (DA) est l'un des mécanismes
de communication que votre projet devrait toujours offrir à ses
utilisateurs. L'outil de suivi DA leur permet de poser des questions ou
de demander de l'aide à l'équipe de projet.

Les utilisateurs qui ont accès à l'outil de suivi DA peuvent suivre les
fils de discussion entre les autres utilisateurs et les membres de
l'équipe. Il est aussi possible de passer les DA déjà postées en revue
ainsi que les réponses apportées par l'équipe. Avec l'outil de suivi DA,
une équipe de projet peut coordonner facilement et efficacement
l'ensemble de ces activités de support technique.

L'outil de suivi de tâches
--------------------------

L'outil de suivi de tâches de SYS\_PRODUCT\_NAME est un gestionnaire de
tâches et pas un logiciel de gestion de projet comme CA-SuperProject,
MS-Project ou d'autres logiciels puissants et complexes qu'on peut
trouver sur le marché. L'outil de suivi de tâches n'est pas capable de
construire un diagramme de Pert et il n'a pas non plus de fonction de
planification. Il s'agit plutôt d'un outil qui permet aux membres du
projet de suivre l'évolution de leur tâche et le temps qu'ils y
consacrent ou bien encore de suivre au quotidien la liste des choses à
faire.

Malgré sa simplicité, l'outil de suivi de tâches offre un certain nombre
de fonctionnalités qui en font un outil très complémentaire des
logiciels de gestion et de planification de projets :

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

L'outil de suivi des besoins de la méthodologie Scrum (Scrum Backlog)
---------------------------------------------------------------------

SYS\_PRODUCT\_NAME facilite le déploiement de la méthodologie Scrum en
permettant de gérer le "backlog Scrum" (cahier de suivi des besoin) dans
un outil de suivi dédié. Vous pourrez trouver une description de la
méthodologie sur `Wikipedia <http://fr.wikipedia.org/wiki/Scrum>`__.

L'outil de suivi du backlog Scrum est composée d'artefacts, appelées
"User Stories" qui décrivent les besoins exprimés par les clients du
projet. L'outil a été spécialisé pour proposer les champs permettant de
capturer les besoins: outre les champs "description", "catégories",
etc., il est possible de définir la valeur (Customer Value), les
critères d'acceptation, l'effort estimé ainsi que le backlog concerné
(Product backlog ou Sprint backlog).

Certains champs optionnels sont également proposés, et bien sûr, chaque
projet est bien sûr libre de personnaliser l'outil de suivi en fonction
de sa méthode de travail.

Au démarrage d'un projet utilisant la méthodologie Scrum, il convient de
modéliser les besoins des clients dans l'outil de suivi, en plaçant
chaque besoin dans le "Product Backlog" (champ 'backlog'). Puis, lors du
premier Sprint, l'équipe évalue les besoins qui vont être réalisés dans
la première itération. Ces besoins sont alors placés dans le "Sprint
Backlog" (champ 'backlog'), et évalués plus précisément (champ 'Initial
Effort'), voire décomposés en besoins plus élémentaires. L'équipe se
répartit alors les besoins (champ 'Owner'), et peut démarrer
l'implémentation.

A la fin du Sprint (d'une période de 4 semaines environ), l'équipe se
réunit à nouveau, modifie le statut des besoins du Sprint précédent, et
sélectionne les besoins qui seront traités dans le Sprint suivant.

Administration des outils de suivi
==================================

Depuis le début du chapitre concernant les outils de suivi, il a été
fait plusieurs fois mention de la flexibilité de ce service et de la
facilité à personnaliser vos propres outils de suivi. La configuration
se fait via le module d'administration des outils de suivi accessible
par l'entrée "Administration des outils de suivi" de la barre de menu.

La page d'accueil du module d'administration des outils de suivi montre
l'ensemble des outils de suivi utilisés par le projet. A partir de cette
page, les outils de suivi existants peuvent être configurés et de
nouveaux outils peuvent être créés (voir ?). Cette section couvre la
partie configuration d'un outil de suivi existant. La création d'un
nouvel outil de suivi est traitée dans la ?.

|Administration des outils de suivi - Page d'accueil|

La configuration d'un outil de suivi se divise en sept sections :

-  **Options Générales** : le nom, la description et quelques autres
   paramètres généraux sont définis dans cette section.

-  **Gestion des permissions** : permet d'octroyer des permissions
   d'accès différentes aux utilisateurs en fonction de leur rôle.

-  **Gestion des groupes de champs** : définition des groupes de champs
   utilisés dans cet outil de suivi.

-  **Gestion de champs** : définition des champs utilisés dans cet outil
   de suivi.

-  **Gestion des valeurs des champs** : définition des valeurs
   prédéfinies ou valeurs par défaut associées aux champs.

-  **Gestion des réponses-type** : permet de créer des commentaires
   prédéfinis que l'équipe utilise régulièrement.

-  **Manage Reports** : définition de rapport de recherche d'artefacts
   (critères de recherche et table de résultats).

-  **Options de notification** : réglage des options de notification par
   email globales ou personnelles.

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

-  **Autoriser la copie d'artefacts**: si la copie d'artefacts est
   autorisée ou non. Si la copie d'artefatcs est autorisée, seuls les
   membres du projet sont autorisés à copier des artefacts.

-  **Instancier dans les nouveaux projets**: Ce paramètre n'est affiché
   que lorsque le projet courant est du type "patron de projet" (voir
   ?). Si ce paramètre est sélectionné, alors les projets créés depuis
   ce patron de projet auront cet outil de suivi. S'il n'est pas
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

Toutes les permissions sont définis pour des groupes d'utilisateurs et
non au niveau des individus. Reportez vous à la ? pour plus
d'information sur la définition et la gestion des groupes
d'utilisateurs.

Gestion des permissions
~~~~~~~~~~~~~~~~~~~~~~~

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

    **Tip**

    |Exemple d'écran de permissions pour un outil de suivi|

    A titre d'exemple supposons que vous avez créé un outil de suivi qui
    sera utilisé par deux de vos clients pour rendre compte d'anomalies
    sur votre logiciel. Dans ce genre de situation, vous pouvez décider
    qu'un client d'une société donnée ne doit voir que les anomalies
    soumises par sa société et non pas les anomalies soumises par les
    autres sociétés.

    Pour parvenir à ce résultat, il suffit de créer un groupe compagnie
    A qui comprend tous les noms des utilisateurs de la société A puis
    de faire la même chose pour la compagnie B. Ensuite on donne à ces
    deux groupes une permission de type 'Accès aux artefacts soumis par
    le groupe' pour limiter l'accès aux seules anomalies soumises par
    leur groupe d'utilisateur. De plus, vous donnerez vraisemblablement
    la permission 'Accès à tous les artefacts' aux membres du projet ou
    aux administrateurs de l'outil de suivi de façon à ce qu'ils
    puissent avoir accès à toutes les anomalies quelle qu'en soit
    l'origine.

    Dans cet exemple :

    -  un utilisateur non connecté n'aura pas accès aux artefacts,

    -  un utilisateur connecté n'aura pas accès aux artefacts,

    -  un membre du projet aura accès à tous les artefacts,

    -  un admin projet aura accès à tous les artefacts, puisqu'il est
       membre du projet,

    -  un admin outil de suivi aura accès à tous les artefacts,
       puisqu'il est membre du projet,

    -  un membre de Compagnie\_A aura accès seulement aux artefacts
       soumis par un membre de Compagnie\_A (pareil pour Compagnie\_B),

    -  un membre du projet qui est aussi membre de Compagnie\_A aura
       accès à tous les artefacs puisqu'il est membre du projet,

    -  un membre de Compagnie\_C n'aura pas accès aux artefacts (si il
       n'est pas membre d'un groupe comme membres\_projet, Compagnie\_A
       ou Compagnie\_B).

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

Gestion des groupes de champs
-----------------------------

Pour améliorer la saisie et la visualisation des artefacts, les champs
de l'outil de suivi sont regroupés en groupes de champs. Cela permet
d'aérer le formulaire de saisie de l'artefact, ou de grouper des champs
ayant une même sémantique, ou encore de grouper des champs jouant un
rôle particulier (par exemple, grouper les champs destinés à la personne
qui fera le diagnostic de l'artefact, puis regrouper ceux destinés à la
personne qui le résoudra, etc.).

Tous les champs doivent appartenir à un groupe de champs, et un même
champ ne peut appartenir qu'à un seul groupe de champs.

Liste des groupes de champs de l'outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour configurer les groupes de champs de l'outil de suivi, sélectionnez
l'item "Gérer les groupes de champs" sur la page d'accueil du module
d'administration d'un outil de suivi. L'écran de gestion des groupes de
champs (?) montre un exemple de groupes de champs disponibles dans un
outil de suivi de SYS\_PRODUCT\_NAME. Cet écran se divise en deux
sections :

la liste des groupes de champs de l'outil de suivi en cours
d'utilisation

un formulaire permettant de créer de nouveaux groupes de champs dans
l'outil de suivi.

Les informations suivantes sont présentées sur la liste des groupes de
champs :

-  **Label du groupe de champs** : le nom du groupe de champs. Pour
   ajuster les propriétés d'un groupe de champs il faut cliquer sur le
   nom.

-  **Description** : la description du groupe de champs.

-  **Champs appartenant au groupe de champs** : liste des champs faisant
   partie de ce groupe de champs. Les champs utilisés sont affichés en
   police grasse, les champs inutilisés en italique.

-  **Rang à l'écran** : le rang indique dans quel ordre les groupes de
   champs apparaîtront à l'écran dans le formulaire de soumission ou
   dans le formulaire de mise à jour. Les groupes de champs avec le plus
   petit rang apparaissent en premier.

-  **Détruire ?** : lorsqu'un groupe de champs est détruit il disparaît
   complètement de la liste des groupes de champs disponibles. Seuls les
   groupes de champs vides (ne contenant aucun champ) peuvent être
   détruit.

|Écran de gestion des groupes de champs dans un outil de suivi|

Création et modification du groupe de champs d'un outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Étant donné que les formulaires de création et de modification d'un
groupe de champs sont très similaires ils sont tous deux traités dans
cette section.

L'écran de création d'un groupe de champs est disponible au bas de la
liste des groupes de champs alors que le formulaire de modification d'un
groupe de champs s'obtient un cliquant sur le label du groupe de champs
à modifier.

Les propriétés à définir pour un groupe de champs sont les suivantes :

-  **Label du groupe de champs**: il s'agit du nom du groupe de champs.

-  **Description** : une description plus longue du rôle de ce groupe de
   champs.

-  **Rang à l'écran** : ce nombre entier de valeur quelconque vous
   permet de définir la position des groupes de champs à l'écran dans
   les formulaires de soumission et de modification par rapport aux
   autres groupes de champs. Les groupes de champs avec les valeurs les
   plus petites apparaissent en premier à l'écran. Les valeurs n'ont pas
   à être consécutives. Il est même recommandé de les numéroter à
   intervalle régulier comme 10, 20, 30... pour pouvoir facilement
   insérer de nouveaux groupes de champs sans avoir à renuméroter tous
   les autres.

Gestion de l'utilisation des champs
-----------------------------------

Lorsqu'un outil de suivi est créé, il comprend un ensemble de champs
préconfigurés qui proviennent du patron utilisé pour sa création. Pour
la majorité des projets hébergés sur SYS\_PRODUCT\_NAME il est très
probable que les patrons standards (bugs, tâches, demandes d'assistance)
répondent à la plupart des besoins.

Toutefois SYS\_PRODUCT\_NAME vous permet de personnaliser les champs
utilisés par vos outils de suivi. Il peut s'agir d'une variation autour
d'un patron standard comprenant l'ajout ou la suppression de quelques
champs mais cela peut aussi être une définition complète à partir d'un
patron vierge.

Types de champs d'un outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les champs d'un outil de suivi peuvent être de plusieurs types : boîte
de sélection, boîte de sélections multiples, zone de texte, champ de
texte, champ à nombre entier, champ à nombre flottant et champ date.

Voici une description détaillée de chaque type de champ :

-  *Boîte de sélection* : un champ de type "Boîte de sélection" prend sa
   valeur parmi une liste de valeurs prédéfinies par l'administrateur de
   l'outil de suivi. Selon le navigateur que vous utilisez l'apparence
   de ce type de champ peut varier mais ils sont en général affichés
   sous la forme d'un menu déroulant montrant les valeurs prédéfinies. A
   un instant donné, ce type de champ ne peut avoir qu'une seule valeur.

-  *Boîte de sélections multiples* : comme la boîte de sélection simple
   décrite précédemment, ce champ prend sa valeur parmi une liste de
   valeurs prédéfinies. Par contre il permet de donner plusieurs valeurs
   au champ à un instant donné. Ce type de champ peut être par exemple
   utilisé pour le champ des personnes responsables d'une tâche.

-  *Zone de texte* : permet à l'utilisateur de saisir un texte libre de
   plusieurs lignes. Ce type de champ est utilisé dans de nombreux
   outils de suivi pour le champ "Description original Submission".

-  *Ligne de texte* : permet à l'utilisateur de saisir un texte libre
   d'une seule ligne. Le résumé d'un artefact est un exemple de champ de
   type ligne de texte.

-  *Champ date* : un champ d'une ligne qui accepte les dates au format
   ISO (AAAA-MM-JJ)

-  *Champ à nombre entier* : champ d'une ligne qui accepte uniquement
   les nombres entiers (exemple : 3, -100, 2345…)

-  *Champ à nombre flottant* : champ d'une ligne qui accepte uniquement
   les nombres flottants(exemple : 3.56, -100.3, 2345, 34E+6…)

Liste des champs de l'outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour configurer les champs à utiliser ou à ne pas utiliser sélectionnez
l'item "Gérer l'utilisation des champs" sur la page d'accueil du module
d'administration d'un outil de suivi. L'écran d'utilisation des champs
(?) montre un exemple de champs disponibles dans un outil de suivi de
SYS\_PRODUCT\_NAME. Cet écran se divise en trois sections :

la liste des champs de l'outil de suivi en cours d'utilisation

la liste des champs inutilisés (invisible sur la figure ?)

un formulaire permettant de créer de nouveaux champs dans l'outil de
suivi (invisible sur la figure ?)

Les informations suivantes sont présentées sur la liste des champs :

-  **Label du champ** : le nom du champ. Pour ajuster les propriétés
   d'un champ il faut cliquer sur le nom.

-  **Type** : un champ peut prendre un des types suivants : boîte de
   sélection, boîte de sélections multiples, ligne de texte, zone de
   texte, champ date, champ à nombre entier, champ à nombre flottant.
   Pour une description détaillée des types de champs voir la ?.

-  **Description** : la description du champ.

-  **Groupe de champs** : groupe auquel le champ appartient.

-  **Rang à l'écran** : le rang indique dans quel ordre les champs
   apparaîtront à l'écran dans le formulaire de soumission ou dans le
   formulaire de mise à jour. Les champs avec le plus petit rang
   apparaissent en premier. Les rangs sont relatifs au groupe de champs
   (les champs sont d'abod affichés par groupe de champs, puis par rang
   à l'intérieur de leur propre groupe de champs).

-  **Statut** :

   -  *Utilisé* : le champ est utilisé par l'outil de suivi.

   -  *Inutilisé* : le champ n'est pas utilisé par l'outil de suivi.
      Notez qu'un champ inutilisé n'est rien d'autre qu'un champ
      "caché". Si vous changez le statut d'un champ de utilisé à
      inutilisé toutes les données associées à ce champ sont préservées.

-  **Détruire ?** : lorsqu'un champ est détruit il disparaît
   complètement de la liste des champs disponibles. De plus toutes les
   données associées à ce champ sont supprimées de tous les artefacts.

|Écran de gestion de l'utilisation des champs dans un outil de suivi|

Création et modification du champ d'un outil de suivi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Étant donné que les formulaires de création et de modification d'un
champ sont très similaires ils sont tous deux traités dans cette
section.

L'écran de création d'un champ est disponible au bas de la liste des
champs alors que le formulaire de modification d'un champ s'obtient un
cliquant sur le label du champ à modifier.

    **Tip**

    A tout instant dans la vie de votre projet vous pouvez enrichir vos
    outils de suivi avec de nouveaux champs. Cependant avant de créer un
    nouveau champ, prenez la peine de consulter la liste des champs
    inutilisés : l'un d'eux correspond peut-être à ce que vous cherchez.
    En utilisant les champs prédéfinis vous contribuez à l'unité globale
    des environnements de projet et vous facilitez la vie de vos
    visiteurs, contributeurs ou nouveaux membres de l'équipe lorsqu'il
    sont amenés à travailler sur plusieurs projets.

Les propriétés à définir pour un champ sont les suivantes :

-  **Label du champ** : il s'agit du nom du champ. Bien que vous soyez
   entièrement libre de modifier le nom d'un champ, nous vous
   recommandons de le modifier uniquement si vous lui donnez une
   signification équivalente (par exemple le champ Sévérité peut être
   renommé en Gravité). Si vous voulez changer le nom pour faire jouer
   au champ un rôle radicalement différent, nous vous recommandons de
   créer un nouveau champ et de déplacer le champ existant dans la liste
   des champs inutilisés.

-  **Description** : une description plus longue du rôle de ce champ.

-  **Type du champ** : un champ peut prendre un des types suivants :
   boîte de sélection, boîte de sélections multiples, ligne de texte,
   zone de texte, champ date, champ à nombre entier, champ à nombre
   flottant. Pour une description détaillée des types de champs voir la
   ?.

-  **Taille d'affichage** : cette propriété vous permet de définir
   l'espace occupé par le champ à l'écran. Ce champ a une signification
   et un format différent en fonction du type du champ.

   -  *Boîte de sélection* : la taille d'affichage ne s'applique pas à
      ce champ. Toute information saisie est ignorée.

   -  *Boîte de sélections multiples* : la taille d'affichage se compose
      d'une seule valeur indiquant combien de valeurs associées à ce
      champ sont visibles simultanément à l'écran. La valeur raisonnable
      se situe en général entre 2 et 5.

   -  *Champ texte, entier ou flottant* : pour tous les champs qui
      tiennent sur une seule ligne, la taille d'affichage suit le patron
      "V/M" où V est le nombre de caractères visibles à l'écran et M est
      le nombre maximum de caractères qu'il est possible de taper dans
      ce champ. Si V est plus petit que M alors le texte tapé se
      décalera automatiquement sur la gauche lorsque vous avez tapé plus
      de caractères que la zone visible n'est capable d'en afficher. La
      valeur maximale de M est 255.

      Une taille d'affichage de "10/40" signifie qu'un champ accepte 40
      caractères maximum et que la portion visible n'est que 10
      caractères.

   -  *Champ date* : une date suit toujours le patron AAAA-MM-JJ et les
      champs date ont donc une taille fixe de 10 caractères.

   -  *Zone de texte* : pour les zones de texte, la taille d'affichage
      s'exprime sous la forme "C/L" ou C est le nombre de colonnes de la
      zone de texte (sa largeur) et R le nombre de lignes de texte (sa
      hauteur). Notez que le nombre de lignes que l'on peut taper n'est
      pas limité à R. Si le texte a plus de R lignes un ascenseur de
      défilement apparaît automatiquement pour naviguer dans le texte.

      Une taille d'affichage de 60/7 donne une zone texte de 7 lignes
      visibles et 60 caractères de long.

-  **Groupe de champs** : il s'agit du groupe de champs auquel le champ
   appartient. Tout champ doit appartenir à un groupe de champs, et un
   champ ne peut pas appartenir à plus d'un groupe de champs (en
   d'autres termes, un champ appartient à un et un seul groupe de
   champs).

-  **Rang à l'écran** : ce nombre entier de valeur quelconque vous
   permet de définir la position des champs à l'écran dans les
   formulaires de soumission et de modification. Les champs avec les
   valeurs les plus petites apparaissent en premier à l'écran. Les
   valeurs n'ont pas à être consécutives. Il est même recommandé de les
   numéroter à intervalle régulier comme 10, 20, 30... pour pouvoir
   facilement insérer de nouveaux champs sans avoir à renuméroter tous
   les autres.

   |Configuration des champs utilisés dans un outil de suivi|

-  **Autoriser la valeur vide** : indique s'il est permis de laisser le
   champ sans valeur dans les écrans de soumission et de modification
   d'un artefact. Si la case n'est pas cochée l'outil de suivi
   n'acceptera pas le formulaire tant qu'une valeur n'aura pas été
   spécifiée par l'utilisateur. Les champs dont la saisie est
   obligatoire sont marqués d'un astérisque rouge sur les formulaires de
   saisie.

-  **Conserver l'historique des changements** : indique si les valeurs
   successives de ce champ doivent être conservées dans l'historique de
   l'artefact (voir ?).

-  **Utiliser ce champ** : cette propriété apparaît uniquement sur
   l'écran de modification des propriétés du champ. Lorsqu'un champ est
   créé il prend automatiquement le statut "Utilisé". Les champs qui
   passent du statut utilisé à inutilisé ne font que disparaître des
   écrans de l'outil de suivi et toutes les données attachées à ce champ
   dans les artefacts demeurent intactes. En d'autres termes, en
   repassant un champ du statut Inutilisé à Utilisé on fera aussi
   réapparaître toutes les valeurs de ce champ dans les différents
   artefacts. Seule la destruction effective d'un champ supprime
   définitivement les données du champ (voir ?.

Gestion des valeurs des champs
------------------------------

Une fois les champs définis, l'étape suivante consiste à définir les
valeurs associées à ces champs. Ceci concerne essentiellement les champs
de type "Boîte de sélection" et "Boîte de sélections multiples" où la
liste des valeurs que vous définissez apparaît dans les menus déroulants
des écrans de soumission et de modification des artefacts. Les autres
types de champs ne nécessitent pas de définition de valeurs. Pour ces
champs, seule la valeur par défaut peut être spécifiée.

Liste des champs
~~~~~~~~~~~~~~~~

Pour configurer les valeurs associées aux champs de l'outil de suivi,
sélectionnez l'item "Gérer les valeurs des champs" sur la page d'accueil
du module de configuration de l'outil de suivi.

|Liste des champs dont les valeurs sont définies par l'utilisateur|

Les informations affichées sur cette première page :

-  **la label du champ** : le nom du champ. Cliquez sur ce champ pour
   voir la liste des valeurs du champ.

-  **Description** : la description du champ

Afficher les valeurs d'un champ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Un clic sur le nom d'un champ listé sur la page de gestion des valeurs
de champ (voir ?) vous mène à la liste des valeurs pour ce champ (voir
?).

La table des valeurs fournit les informations suivantes :

-  **Label de la valeur** : l'intitulé de la valeur telle qu'elle
   apparaît dans la boîte de sélection. Pour modifier les propriétés
   d'une valeur il suffit de cliquer sur le label (voir ?).

-  **Description** : description de la valeur.

-  **Rang** : permet de définir l'ordre dans lequel les valeurs
   apparaissent dans la boîte de sélection. Les valeurs ayant les
   valeurs de rang les plus petites apparaissent en tête de la boîte.

-  **Statut** :

   -  *Active* : la valeur est visible dans la boîte de sélection et
      peut-être utilisée dans le champ correspondant.

   -  *Cachée* : la valeur n'est pas visible dans la boîte de sélection.
      Cependant si la valeur a été utilisée par certains artefacts de
      l'outil de suivi avant d'être cachée, elle continuera à être
      visible dans ces artefacts spécifiquement.

   -  *Permanente* : une valeur permanente est définie pour l'ensemble
      des outils de suivi utilisant ce champ. Elle ne peut être cachée
      ni supprimée. Seuls les administrateurs du site en charge de la
      définition des patrons d'outils de suivi de niveau site peuvent
      marquer une valeur comme permanente.

La ? montre la liste des valeurs pour le champ Resolution d'un outil de
suivi de "Bugs". Le champ Resolution est proposé avec un certain nombre
de valeurs prédéfinies qui sont communes à tous les projets
SYS\_PRODUCT\_NAME. Par défaut 8 valeurs sont disponibles (Accepted,
Analyzed, etc.).

Vous avez bien sûr la possibilité d'ajouter vos propres valeurs au champ
Resolution. Cependant dans le but de conserver une certaine harmonie
entre les différents outils de suivi de SYS\_PRODUCT\_NAME, nous vous
recommandons vivement d'utiliser la liste des valeurs prédéfinies autant
que vous le pouvez avant d'en créer de nouvelles.

|Liste des valeurs du champ "Resolution"|

Définition d'une valeur par défaut
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Il est possible de définir une valeur par défaut pour chacun des champs
d'un outil de suivi. Suivant le type de champ vous aurez à saisir la
valeur par défaut dans un champ texte (champ entier, flottant, date et
texte) ou dans une boîte de sélection montrant toutes les valeurs
actuellement définies pour un champ de type boîte de sélection ou boîte
de sélections multiples (invisible sur la ?) .

Création d'une valeur de champ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour ajouter une nouvelle valeur à un champ, utilisez le formulaire qui
se trouve sous la liste des valeurs existantes (invisible sur ?).

Association d'un champ avec une liste de valeurs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SYS\_PRODUCT\_NAME vous permet non seulement de créer une liste de
valeurs pour un champ de type boîte de sélection mais il offre aussi la
possibilité d'associer un champ avec une liste de valeurs prédéfinies
générées dynamiquement par SYS\_PRODUCT\_NAME. L'exemple le plus
classique consiste à montrer la liste des membres du projet dans une
boîte de sélection. Au lieu d'avoir à la créer et à la maintenir
manuellement, SYS\_PRODUCT\_NAME construit cette liste pour vous et vous
permet de l'associer à un champ.

Notez que si vous décidez d'associer un champ à une liste de valeurs
générées dynamiquement vous ne pouvez plus définir vos propres valeurs.
Les listes dynamiques suivantes sont actuellement disponibles :

-  **Membres du projet** : la liste des utilisateurs membres du projet.

-  **Administrateurs du projet** : les membres du projet qui ont le
   statut d'administrateur de ce projet.

-  **Les personnes ayant soumis un artefact** : la liste complète des
   utilisateurs ayant soumis au moins un artefact dans l'outil de suivi.

-  **Un groupe d'utilisateurs défini par le projet** : vous pouvez
   associer une boîte de sélection avec la liste des utilisateurs d'un
   groupe d'utilisateurs quelconque du projet. Sur la façon de définir
   des groupes d'utilisateurs voir la ?.

Modification d'une valeur de champ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A partir de l'écran montrant la liste des valeurs d'un champ (voir ?)
vous pouvez changer les propriétés d'une valeur en cliquant sur le label
de la valeur.

-  **Valeur** : changer la valeur elle-même. La valeur saisie dans ce
   champ apparaît telle quelle dans la boîte de sélection. Gardez
   présent à l'esprit que si vous modifiez une valeur, cette
   modification prend effet dans tous les artefacts qui utilisaient
   l'ancienne valeur.

-  **Rang** : un nombre entier quelconque qui permet de définir l'ordre
   d'apparition des valeurs dans la boîte de sélection. Les valeurs
   ayant le plus petit rang apparaissent en premier. Lorsque la valeur
   "None" (ou "Aucun") est proposée dans la liste des valeurs sa valeur
   de rang est 10. Ce nombre est délibérément faible car, par
   convention, "None" (ou "Aucun") apparaît toujours en première
   position dans la boîte de sélection. Soyez donc bon citoyens et
   utilisez des valeurs de rang supérieures à 10 pour vos propres
   valeurs.

-  **Statut** : Active ou Cachée. Comme expliqué plus haut changer cette
   propriété au cours de la vie du projet n'a aucun impact négatif sur
   la base d'artefacts.

-  **Description** : nous en dit un peu plus sur la signification de
   cette valeur.

|Configuration des valeurs d'un champ|

    **Tip**

    Que ce soit pour les champs ou les valeurs de champs nous vous
    recommandons d'utiliser des nombres assez grands pour les valeurs de
    rang comme 100, 200, 300. En procédant de la sorte, vous pourrez
    facilement insérer de nouvelles valeurs ou de nouveaux champs sans
    avoir à redéfinir l'ordre d'apparition de tous les autres champs ou
    valeurs de champ.

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
   le champ cible "Version". L'ensemble des valeurs pour ces deux champs
   sont alors affichées. Les valeurs qui font partie d'une définition de
   dépendance entre les deux champs sont mises en valeur (police
   grasse).

2. Pour créer des dépendances entre la valeur Linux et les versions
   correspondant à ce système, il suffit de selectionner la valeur puis
   de cocher/decocher les valeurs correspondantes dans l'autre champ. Le
   surlignage permet de faire le rapprochement visuel entre les
   correspondances, aidé par les petites flèches indiquant le sens de
   lecture "source vers cible".

3. A tout moment vous pouvez annuler les modifications en cours en
   cliquant sur le bouton de réinitialisation. Une fois validées, les
   modifications sont enregistrées.

Voici ce que donnent nos dépendances pour le système Linux :

|Dépendances pour le système Linux|

On continue en sélectionnant la prochaine valeur source MacOS X

|Dépendances pour le système MacOS X|

On continue en sélectionnant la prochaine valeur source MS Windows

|Dépendances pour le système MS Windows|

On finit avec la dernière valeur source NetBSD

|Dépendances pour le système NetBSD|

Il est aussi possible de "naviguer" à travers les dependances dans le
sens inverse : définir l'ensemble des valeurs sources qui correspondent
à une valeur cible :

|La version 2.0 "dépend" de Linux et NetBSD|

Une fois les dépendances définies, l'utilisateur final (lors de la
soumission/édition d'un artefact) verra les options du champ Version
filtrées en fonction de la sélection du champ Système d'exploitation :

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
type de machine utilisée, etc...(voir ?).

Plutôt que de retaper sans cesse les mêmes commentaires,
SYS\_PRODUCT\_NAME permet aux membres du projet de définir un ensemble
de commentaires prédéfinis appelés réponses-type. Après avoir défini ces
réponses-type, poster le commentaire correspondant nécessite simplement
de choisir la réponse-type dans la boîte de sélection située à proximité
de la zone de saisie du commentaire dans le formulaire de modification
d'un artefact.

Notez qu'il est aussi possible de définir des réponses-type à la volée
en cliquant sur le lien "Définir une nouvelle réponse type" dans l'écran
de modification d'un artefact (voir ?).

|Définition d'une réponse-type|

Gestion des rapports de recherche
---------------------------------

Sachant que les administrateurs d'un projet, les membres ou les autres
utilisateurs peuvent avoir des besoins très différents en matière de
recherche dans la base des artefacts, SYS\_PRODUCT\_NAME permet de
définir des rapports de recherche valables pour l'ensemble du projet ou
par un utilisateur en particulier.

Créer un rapport de recherche consiste à choisir quels champs vous
souhaitez utiliser en tant que critère de recherche et quels champs
afficher dans le tableau de résultats de la recherche. Vous pouvez aussi
définir l'ordre dans lequel les critères de recherche et les colonnes de
la table de résultats apparaissent à l'écran.

Les administrateurs d'un outil de suivi ont la possibilité de définir
des rapports de recherche utilisables par tous les utilisateurs
enregistrés ayant accès à l'outil de suivi alors que les autres
utilisateurs ne peuvent définir que des rapports de recherche à usage
personnel.

    **Tip**

    Lors de la configuration d'un rapport de recherche vous remarquerez
    certainement que l'écran de configuration permet de définir les
    champs que vous allez utiliser en tant que critère de recherche mais
    pas les valeurs à mettre dans ces champs pour la recherche. La
    définition de la structure d'un rapport et le remplissage des
    critères de recherche sont deux opérations distinctes sur
    SYS\_PRODUCT\_NAME. Une fois le rapport de recherche défini dans le
    module d'administration (par exemple : 'Rapport simple', 'Rapport
    Qualité', 'Rapport quotidien',…) vous pouvez vous rendre sur l'écran
    de recherche et de navigation, sélectionner le rapport de recherche
    qui vous convient, remplir les valeurs des critères de recherche et
    lancer la requête. Ensuite vous pouvez sauvegarder la totalité de
    cette recherche (choix du rapport et des valeurs des critères) à
    l'aide du mécanisme de signets de SYS\_PRODUCT\_NAME (voir le coup
    de pouce de la ?). Et voila !

Afficher les rapports de recherche
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Un clic sur l'entrée "Rapport" du menu de la page d'administration d'un
outil de suivi affiche la liste des rapports de recherche disponibles
(voir ?) accompagnée des informations suivantes :

-  **ID** : l'identifiant unique du rapport. Un clic sur l'ID vous
   conduit vers la page de configuration du rapport (voir ?).

-  **Nom du rapport** : le nom du rapport tel qu'il apparaîtra dans la
   boîte de séléction des rapports sur la page de recherche des
   artefacts (Exemple de nom : Rapport simple, Rapport qualité, Rapport
   quotidien…).

-  **Description** : une description plus détaillée du rapport.

-  **Portée** :

   -  *Projet* : ce rapport est utilisable par tous les membres du
      projet. Seuls les administrateurs de l'outil de suivi peuvent
      définir des rapports dont la portée s'étend à l'ensemble des
      utilisateurs.

   -  *Personnel* : ce rapport est uniquement utilisable par la personne
      qui l'a créé.

   -  *Système* : ce type de rapport est défini au niveau du système
      SYS\_PRODUCT\_NAME et ne peut être supprimé. Le rapport de
      recherche par défaut qui est préconfiguré à la création de l'outil
      de suivi est un rapport de type Système.

-  **Détruire ?** : cliquez sur l'icône corbeille pour supprimer le
   rapport. Les rapports de type Projet ne peuvent être détruit que par
   les administrateurs de l'outil de suivi.

|Exemple d'une liste de rapports de recherche|

La même interface est disponible pour la navigation dans les rapports
graphiques de recherche.

Configuration des rapports de recherche
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Après avoir sélectionné l'identifiant (ID) d'un rapport de recherche
présenté dans la liste des rapports (voir ?), l'écran de configuration
du rapport s'affiche. Cet écran vous permet de définir quels champs
utiliser comme critères de recherche et quels champs doivent figurer
dans les colonnes de la table de résultats constituée à partir des
artefacts sélectionnés dans la base de données.

Les informations suivantes sont présentes à l'écran :

-  **Nom** : chaque rapport porte un nom. Il ne doit pas être trop long
   car il apparaît dans une boîte de sélection sur l'écran de recherche
   des artefacts lorsque vous choisissez le rapport de recherche
   souhaité.

-  **Portée** : les administrateurs de l'outil de suivi peuvent définir
   des rapports de type projet utilisables par tous les utilisateurs.
   Les autres utilisateurs ne peuvent définir que des rapports de
   recherche personnels.

-  **Description** : une description plus détaillée du rapport.

-  **Sélection des champs** : La table des champs montre l'ensemble des
   champs utilisés par l'outil de suivi. Pour chaque champ, on peut
   définir les paramètres suivants :

   -  *Utiliser comme critère de recherche* : si vous cochez cette case,
      le champ apparaîtra comme l'un des critères de sélection
      utilisable lors de vos recherches dans la base d'artefacts.

   -  *Rang à la recherche* : un nombre peut être précisé dans ce champ.
      Le rang vous permet de placer le champ par rapport aux autres à
      l'écran. Les champs avec la plus petite valeur de rang sont
      affichés en premier. Ces nombres ne sont pas nécessairement
      consécutifs.

   -  *Utiliser comme colonne dans le rapport* : si vous cochez cette
      case, le champ apparaîtra comme l'une des colonnes dans la table
      de résultats de la recherche.

   -  *Rang dans le rapport de recherche* : un nombre peut être précisé
      dans ce champ. Le rang vous permet de placer le champ par rapport
      aux autres à l'écran. Les champs avec la plus petite valeur de
      rang sont affichés en premier (de gauche à droite). Ces nombres ne
      sont pas nécessairement consécutifs.

-  **Largeur de la colonne**\ (optionnel) : si vous souhaitez imposer
   une largeur de colonne pour ce champ dans la table de résultats vous
   pouvez la spécifier ici sous forme d'un pourcentage de la largeur
   totale de la page. Cette valeur est optionnelle et nous vous
   recommandons de la laisser vierge à moins que votre navigateur ne
   formate pas la table comme vous le souhaitez. Si vous voulez qu'une
   colonne soit la plus étroite possible, spécifiez un pourcentage très
   faible comme 1 ou 2.

    **Note**

    **Note** : il est parfaitement possible d'utiliser un champ comme
    critère de recherche sans le faire figurer dans la table de résultat
    et inversement. Pour les champs que vous ne souhaitez pas utiliser
    du tout dans le rapport laissez les deux cases à cocher vierges.

|Configuration d'un rapport de recherche|

Configuration des rapports graphiques de recherche
--------------------------------------------------

Après avoir sélectionné l'identifiant (ID) d'un rapport graphique de
recherche présenté dans la liste des rapports (voir ?), l'écran de
configuration du rapport s'affiche. Cet écran vous permet de définir
quels types de graphiques afficher.

Il y a trois types de graphiques possibles: Camembert, Bâtons et Gantt.
Créer / Modifier un graphique
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour créer un nouveau graphique pour le rapport, cliquer simplement sur
le type de graphique que vous voulez créer (camembert, bâton ou Gantt)
Pour modifier un graphique existant, cliquez sur l'icône en forme de
crayon dans le coin en haut à droite du graphique. En cliquant sur la
croix rouge, vous effacerez le graphique. Les informations communes à
tous les types de graphique disponible sur l'écran de création /
modification de graphique sont les suivantes :

-  **Titre**: le titre du graphique, il sera affiché dans la partie
   supérieur du graphique.

-  **Description**: une description courte du graphique, elle sera
   également affichée sur le graphique.

-  **Rang**: le rang détermine l'ordre d'affichage des graphiques dans
   le rapport.

Créer / Modifier un graphique camembert
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les informations spécifiques disponibles pour les graphiques camemberts
sont les suivantes :

-  **Largeur et Hauteur**: déterminent la taille du graphique en pixels.

-  **Données sources**: données principales à partir desquelles le
   graphique sera tracé

|image32|

Créer / Modifier un graphique en bâtons
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les informations spécifiques disponibles pour les graphiques en bâtons
sont les suivantes :

-  **Largeur et Hauteur**: déterminent la taille du graphique en pixels.

-  **Données sources**: données principales à partir desquelles le
   graphique sera tracé

-  **Grouper par**: données servant à regrouper les données sources par
   catégories.

|image33|

Créer / Modifier un diagramme de Gantt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Les informations spécifiques disponibles pour le diagramme de Gantt sont
les suivantes :

-  **Date de début**: détermine le champ de l'outil de suivi utilisé
   comme date de début.

-  **Date de fin**: détermine le champ de l'outil de suivi utilisé comme
   date de fin estimé.

-  **Fin prévue**: détermine le champ de l'outil de suivi utilisé comme
   date de fin.

-  **Echelle Temporelle**: peut être jour, semaine, mois et année.

-  **A la date**: Date de référence pour l'affichage du graphique, la
   valeur par défaut est le jour courant.

-  **Résumé**: Texte affiché dans la colonne de gauche (Summary), et
   dans les info-bulles des barres.

-  **Progression**: Pourcentage d'achèvement de la tache. Ce champ doit
   être de type entier, son mode d'affichage un champ texte, et ses
   valeurs doivent être comprises entre 0 et 100.

-  **Information à droite des barres**: Texte affiché à la droite des
   barres dans le diagramme de Gantt.

|image34|

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
modification) d'un artefact. Notez que dans ce cas, les notifications
sont envoyées aux utilisateurs sans tenir compte des préférences
personnelles (voir la section "?" ci-dessous).

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

Utilisateurs à suivre
~~~~~~~~~~~~~~~~~~~~~

Les outils de suivi de SYS\_PRODUCT\_NAME offrent à tous les membres du
projet la possibilité de recevoir une copie de toutes les notifications
envoyées à certaines autres personnes.

Voici quelques exemples où cette fonctionnalité se révèle
particulièrement utile :

-  **Remplacement** : lorsqu'un membre de l'équipe est absent il est
   souvent très commode de pouvoir déléguer le traitement des artefacts
   dont il est en charge à une autre personne de l'équipe qui le
   remplace. Pour devenir le remplaçant d'une personne il suffit de
   taper le nom de la personne à remplacer dans le champ "Utilisateurs à
   suivre" lorsque la personne s'en va et de l'enlever à son retour.

   Dès que vous spécifiez le nom d'une personne à suivre, vous recevez
   toutes les notifications de cette personne et vous pouvez agir en
   conséquence à sa place.

-  **Contact assurance qualité** : une autre utilisation de cette
   fonctionnalité consiste pour les responsables de l'assurance qualité
   de l'équipe à taper le nom des ingénieurs avec lesquels ils
   travaillent. Ils savent ainsi où en sont les anomalies assignées à
   "leur" ingénieur.

    **Note**

    Remarque : le but de cette fonctionnalité n'est pas de vous
    espionner. Ainsi, pour être sûr que personne ne suit vos
    notifications email sans votre consentement, SYS\_PRODUCT\_NAME
    montre sur cette page le nom des utilisateurs qui ont demandé à
    suivre vos notifications email.

Configuration des notifications par rôle/évènement
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Il s'agit là de la partie la plus sophistiquée du processus de
personnalisation des notifications email. Elle permet à n'importe quel
utilisateur de définir les types d'évènements qui doivent faire l'objet
d'une notification et ceux qui doivent, au contraire, ne pas être
signalés. Cette configuration est spécifique à un utilisateur pour un
projet donné. Il est donc possible de spécifier ces préférences de façon
très fine pour chaque outil de suivi dans lequel vous êtes impliqué.

La matrice de personnalisation (voir ?) montre une série de cases à
cocher. Chaque case vous permet de spécifier quel type d'évènement vous
souhaitez recevoir suivant le rôle que vous jouez dans un artefact.

Un utilisateur peut avoir quatre rôles vis à vis d'un artefact :

-  **A soumis** : vous êtes la personne qui a initialement soumis
   l'artefact en remplissant le formulaire de soumission.

-  **En charge** : l'artefact vous a été assigné et c'est à vous de le
   gérer.

-  **CC** : Votre nom apparaît dans la liste des destinataires en copie
   (voir ?).

-  **Commentateur** : vous avez posté au moins un commentaire dans
   l'artefact.

Pour chacun de ces rôles vous pouvez indiquer à l'outil de suivi de vous
envoyer une notification uniquement quand certains évènements
surviennent. Il existe neuf évènements différents visibles sur la
colonne la plus à gauche de la ?. Les descriptions des évènements
parlent d'elles mêmes et n'appellent qu'un commentaire : les huit
premiers évènements de la liste ne peuvent survenir que lors de la
modification d'un artefact. Seul le dernier évènement se rapporte à la
création d'un nouvel artefact.

Passons en revue la matrice de personnalisation donnée en exemple sur la
? et voyons, étape par étape, comment cet utilisateur a configuré ses
paramètres de notification :

-  Commençons par la colonne Commentateur. Ici l'utilisateur a décidé
   que s'il est impliqué dans un artefact en tant que commentateur (il a
   juste posté un commentaire) il souhaite recevoir un message de
   notification uniquement lorsque le statut de l'artefact passe à
   "Fermé" ou lorsque l'un quelconque des champs Priorité, Statut ou
   Sévérité est modifié. Tous les autres évènements doivent être ignorés
   par l'outil de suivi et ne pas donner lieu à une notification pour
   cet utilisateur.

-  Ensuite si nous examinons la matrice par évènement et non plus par
   rôle, on peut voir que l'utilisateur a indiqué que lorsqu'il modifie
   un artefact lui-même (évènement "Je suis l'auteur de la
   modification") il ne souhaite pas recevoir de notification quel que
   soit son rôle dans cet artefact. Veuillez noter que l'évènement "Je
   suis l'auteur de la modification" prend le pas sur d'autres
   évènements. Ainsi dans notre exemple, aucune notification n'est
   envoyée à cet utilisateur s'il soumet un artefact bien que
   l'évènement "Un nouvel artefact a été soumis" soit coché.

-  Pour finir l'utilisateur a aussi spécifié que lorsqu'un nouvel
   artefact est soumis et qu'il lui est assigné, il veut en être
   informé. Cependant si c'est lui même qui a soumis l'artefact alors il
   ne souhaite pas recevoir de notification email.

   Notez aussi que le rôle Commentateur n'a pas de signification pour
   l'évènement "Un nouvel artefact a été soumis" car un commentaire ne
   peut être ajouté qu'au moment de la modification d'un artefact et pas
   lors de sa création. De plus, l'évènement "On me donne ou on m'enlève
   ce rôle" n'a pas de signification pour une commentateur ou la
   personne qui a soumis un commentaire car ces rôles ne peuvent être
   modifiés dans un artefact.

|Configuration de la matrice de notification personnelle|

Suspension des notifications email
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Il est parfois utile de suspendre toutes les notifications email d'un
outil de suivi particulier, par exemple lors de tâches de maintenance.
En sélectionnant cette option, un administrateur de l'outil de suivi
peut suspendre les notifications globales, ainsi que les notifications
par rôle/évènement

Cette option est typiquement utilisée lors d'une mise à jour massive, ou
pour faire des tests.

.. |Page d'accueil de l'outil de suivi| image:: ../../screenshots/fr_FR/sc_trackerwelcomescreen.png
.. |Un exemple d'écran de soumission d'artefact (ici de type "bug")| image:: ../../screenshots/fr_FR/sc_artifactsubmission.png
.. |Un exemple d'affichage des résultats d'une requête sur un tracker| image:: ../../screenshots/fr_FR/sc_artifactbrowsing.png
.. |Entête d'un écran de modification d'un artefact (champs de l'outil de suivi)| image:: ../../screenshots/fr_FR/sc_artifactupdateheader.png
.. |Commentaires attachés à un artefact| image:: ../../screenshots/fr_FR/sc_artifactupdatecomments.png
.. |Dépendance entre artefacts| image:: ../../screenshots/fr_FR/sc_artifactupdatedependencies.png
.. |Permissions d'un artefact| image:: ../../screenshots/fr_FR/sc_artifactpermissions.png
.. |Historique d'un artefact| image:: ../../screenshots/fr_FR/sc_artifacthistory.png
.. |Écran de sélection des artefacts pour une mise à jour massive| image:: ../../screenshots/fr_FR/sc_masschangeselection.png
.. |Section d'entête de l'écran de mise à jour massive d'artefacts| image:: ../../screenshots/fr_FR/sc_masschangeupdate_header.png
.. |Section destinataire en copie de l'écran de mise à jour massive d'artefacts| image:: ../../screenshots/fr_FR/sc_masschangeupdate_cc.png
.. |Création d'un nouvel outil de suivi (ici pour des anomalies)| image:: ../../screenshots/fr_FR/sc_trackercreatenewtracker.png
.. |Administration des outils de suivi - Page d'accueil| image:: ../../screenshots/fr_FR/sc_trackertopadminpage.png
.. |Exemple d'écran de permissions pour un outil de suivi| image:: ../../screenshots/fr_FR/sc_trackerpermissions.png
.. |Écran de gestion des groupes de champs dans un outil de suivi| image:: ../../screenshots/fr_FR/sc_trackerfieldset.png
.. |Écran de gestion de l'utilisation des champs dans un outil de suivi| image:: ../../screenshots/fr_FR/sc_trackerfieldusage.png
.. |Configuration des champs utilisés dans un outil de suivi| image:: ../../screenshots/fr_FR/sc_trackerfieldusagesettings.png
.. |Liste des champs dont les valeurs sont définies par l'utilisateur| image:: ../../screenshots/fr_FR/sc_trackerfieldvaluesmgt.png
.. |Liste des valeurs du champ "Resolution"| image:: ../../screenshots/fr_FR/sc_trackerfieldvalues.png
.. |Configuration des valeurs d'un champ| image:: ../../screenshots/fr_FR/sc_trackerfieldvalueupdate.png
.. |Dépendances pour le système Linux| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_02.png
.. |Dépendances pour le système MacOS X| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_03.png
.. |Dépendances pour le système MS Windows| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_04.png
.. |Dépendances pour le système NetBSD| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_05.png
.. |La version 2.0 "dépend" de Linux et NetBSD| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_06.png
.. |Les versions proposées pour Linux| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_07.png
.. |Les versions proposées pour MacOS X| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_08.png
.. |Les versions proposées pour MS Windows| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_09.png
.. |Les versions proposées pour NetBSD| image:: ../../screenshots/fr_FR/sc_trackerfielddependencies_10.png
.. |Définition d'une réponse-type| image:: ../../screenshots/fr_FR/sc_trackercannedresponses.png
.. |Exemple d'une liste de rapports de recherche| image:: ../../screenshots/fr_FR/sc_trackerreportbrowsing.png
.. |Configuration d'un rapport de recherche| image:: ../../screenshots/fr_FR/sc_trackerreportsetting.png
.. |image32| image:: ../../screenshots/fr_FR/sc_trackergraphpie.png
.. |image33| image:: ../../screenshots/fr_FR/sc_trackergraphbar.png
.. |image34| image:: ../../screenshots/fr_FR/sc_trackergraphgantt.png
.. |Configuration de la matrice de notification personnelle| image:: ../../screenshots/fr_FR/sc_trackernotificationmatrix.png
