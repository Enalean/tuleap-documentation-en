.. contents::
   :depth: 3
..

Gestionnaire de sondages
========================

Le gestionnaire de sondage permet à une équipe de projet de créer des
sondages d'opinion. Fournir un service de sondage dans un environnement
dédié aux activités de développement logiciel peut paraître un peu
étrange au premier abord. Cependant, si vous vous souvenez que
SYS\_PRODUCT\_NAME est aussi un outil qui permet de rester en contact
avec votre communauté d'utilisateurs, vous réaliserez assez rapidement
qu'être à l'écoute de cette communauté est le meilleur moyen de la faire
croître et de la satisfaire.

Rester à l'écoute de sa communauté peut se faire de plusieurs façons sur
SYS\_PRODUCT\_NAME :

-  par le biais des listes de diffusion et des forums web,

-  à partir des commentaires reçus en réponse à une annonce publiée sur
   la page de sommaire de votre projet,

-  en analysant le contenu des demandes d'aide reçues sur une certaine
   période.

Tous ces moyens de communication permettent aux utilisateurs de
SYS\_PRODUCT\_NAME de "pousser" des avis et demandes spontanés vers le
projet concernant un sujet qui leur tient vraiment à coeur. Mais que
faire si vous souhaitez recueillir l'avis de votre communauté
d'utilisateurs sur un certain nombre de sujets et que vous voulez que
les réponses soient choisies parmi une liste de choix définis par
l'équipe de projet ? C'est précisément ce que permet de faire le
gestionnaire de sondages :

-  formuler une liste de questions précises,

-  définir un ensemble de réponses possibles pour faciliter l'analyse
   statistique,

-  rendre le sondage accessible à tout utilisateur présent sur
   l'Intranet,

-  passer les résultats en revue pour identifier les principales
   tendances de votre communauté d'utilisateurs.

|Page d'accueil du gestionnaire de sondages|

Publier un sondage
==================

*Audience : membres du projet*

Vous avez travaillé dur pour créer ce sondage parfaitement peaufiné et
vous désirez maintenant atteindre l'audience la plus large possible.
SYS\_PRODUCT\_NAME vous permet de rendre votre sondage visible de
plusieurs façons :

**Via le gestionnaire de sondages lui-même** : aussitôt qu'un sondage
est créé il apparaît sur la page d'accueil du gestionnaire de sondages
(voir ?). Tout utilisateur visitant la page de sommaire du projet verra
aussi le nombre de sondages disponibles dans la zone publique sous la
rubrique sondage. En cliquant sur le lien "Sondages", l'utilisateur
pourra répondre aux sondages disponibles.

**Service d'annonces du projet** : lorsque vous disposez d'un nouveau
sondage, assurez-vous de publier une annonce annonçant sa disponibilité,
qui est supposé y répondre et le pointeur Web (URL) où se trouve le
sondage (voir ci-dessous). En publiant une annonce vous avez aussi une
chance de la voir apparaître sur la page d'accueil du site si l'équipe
SYS\_PRODUCT\_NAME en décide ainsi.

**E-mail** : le sondage que vous avez créé est accessible directement
via un pointeur Web (URL) du site SYS\_PRODUCT\_NAME. En conséquence
vous pouvez informer votre communauté d'utilisateur en incluant ce
pointeur Web dans tout document tel que message e-mail, page Web ou tout
autre document. Même les personnes qui ne sont pas enregistrées sur
SYS\_PRODUCT\_NAME peuvent participer à un sondage.

Tous les sondages créés sur SYS\_PRODUCT\_NAME sont accessibles via un
pointeur Web (URL) comme celui-ci :

::

    http://SYS_DEFAULT_DOMAIN/survey/survey.php?group_id=N&survey_id=X

où N est l'identifiant (ID) de votre projet et X l'identifiant du
sondage tel qu'il est présenté sur la liste des sondages affichés sur la
page d'accueil du gestionnaire de sondages. Votre identifiant de projet
est visible sur la page d'administration du gestionnaire de sondages
(voir ?).

Répondre à un sondage se fait en accédant au sondage comme indiqué
précédemment, puis en répondant à la série de questions et enfin en
cliquant sur le bouton "Valider" situé au bas de la page. La ? montre un
exemple de sondage.

    **Tip**

    Les informations collectées dans ces enquêtes sont strictement
    internes à SYS\_ORG\_NAME. Elles sont uniquement destinées à mieux
    comprendre le profil du projet et de la population sondée.
    L'identité des personnes répondant au sondage ne sont visibles ni
    pour les administrateurs du projet, ni par une partie tierce et
    encore moins par le public. Les informations collectées sont
    uniquement présentées de façon agrégée et non pas dans le but de
    mettre en évidence un ou plusieurs utilisateurs ou développeurs.

|Un exemple de sondage émanant du projet SYS\_PRODUCT\_NAME|

Administration des sondages
===========================

*Audience : membres du projet*

Les fonctions d'administration du gestionnaire de sondages sont
uniquement utilisables par les administrateurs du projet. Le module
d'administration vous permet de

-  Créer ou modifier un sondage

-  Créer ou modifier des questions

-  passer en revue les résultats d'un sondage

Pour accéder aux fonctions d'administration, rendez vous sur la page de
sommaire de votre projet, cliquez sur le lien "Sondages" de la barre de
services située en haut de l'écran puis sur le lien "Administration" du
menu du gestionnaire de sondages (voir ?). A partir de cette page vous
avez accès à l'ensemble des fonctions d'administrations (voir ?).

|Écran d'administration du gestionnaire de sondages|

Structure d'un sondage
----------------------

Pour maîtriser le processus de création et de mise à jour d'un sondage,
il est nécessaire de bien comprendre que le gestionnaire de sondages
gère deux réservoirs d'entités distinctes : un réservoir de sondages et
un réservoir de questions. En conséquence, la création d'un sondage
complet est un processus en deux étapes :

Vous devez tout d'abord créer un ensemble de questions avec les réponses
possibles. Toutes les questions de tous les sondages d'un projet sont
gérées dans un même réservoir.

La création du sondage se fait ensuite en définissant son titre et en
attachant une série de questions précédemment définies.

L'un des intérêts de cette gestion séparée des questions et des sondages
réside dans le fait de pouvoir utiliser la même question dans différents
sondages si besoin est.

Créer et éditer des questions
-----------------------------

En tout premier lieu vous devez définir un jeu de questions et les
réponses possibles pour chacune d'elles. Créer un bon sondage n'est pas
chose aisée et cela demande du travail et de la réflexion : la valeur
ajoutée des réponses reçues est directement liée à la qualité des
questions. Quelques conseils : ne mettez pas trop de questions dans un
sondage, les questions doivent être courtes, claires, sans ambiguïté et
non redondantes. Prenez donc du temps pour penser aux questions avec
votre équipe.

Pour créer des questions, cliquez sur le lien du même nom dans la barre
de menu du gestionnaire de sondages ou dans la page d'accueil du module
d'administration. Pour définir une question il suffit de taper le texte
et de choisir un type de question. Il existe 5 types de réponses
possibles (voir ? pour quelques exemples de questions) :

-  **Boutons radio 1-5** : ce type de question oblige l'utilisateur à
   répondre en cochant un des boutons radio parmi les valeurs 1 à 5.

-  **Boutons radio Oui/Non** : il s'agit d'une variante du type
   précédent où seules les réponses Oui ou Non sont possibles.

-  **Boutons radio spécifiques** : ce type de question permet à
   l'administrateur projet de définir un ensemble de réponses parmi
   lesquelles l'utilisateur pourra en choisir une. Les différents choix
   sont affichés sous forme de boutons radio.

-  **Boîte de sélection** : ce type de question permet à
   l'administrateur projet de définir un ensemble de réponses parmi
   lesquelles l'utilisateur pourra en choisir une. Les différents choix
   sont proposés dans une boîte de sélection.

-  **Champ texte** : question pour laquelle vous souhaitez une réponse
   sous forme de texte court (une ligne).

-  **Zone de texte** : comme précédemment si ce n'est que l'utilisateur
   peut saisir plusieurs lignes de texte. A utiliser lorsque vous
   souhaitez obtenir des réponses détaillées à vos questions.

-  **Commentaire** : il ne s'agit pas vraiment d'une question mais d'un
   moyen d'insérer des commentaires entre deux questions dans votre
   sondage.

-  **Aucun** : choisir ce type de réponse pour une question revient à la
   désactiver. La question disparaît alors de tous les sondages qui
   l'utilisent. Comme souvent en pareil cas dans SYS\_PRODUCT\_NAME, la
   question n'est pas détruite et toutes les réponses associées émanant
   des divers sondages demeurent intactes.

A tout moment durant la phase de création vous pouvez afficher la liste
complète des questions en cliquant sur le lien 'Lister les questions
existantes' au bas de l'écran.

Modifier des questions est aussi possible. Pour ce faire, cliquez sur le
lien 'Modifier les questions' dans le menu de la page d'administration
du gestionnaire de sondages ou dans la page d'accueil du module
d'administration. Vous verrez alors s'afficher la liste des questions
actuellement disponibles dans le réservoir. En cliquant sur
l'identifiant de la question situé dans la colonne de gauche, vous
pouvez modifier les propriétés de la question.

*Remarque* : modifier une question après que des réponses aient été
collectées est une très mauvaise idée particulièrement si vous changez
le type de la question. Dans ce cas les réponses déjà collectées
deviennent incohérentes avec le nouveau type de la question. Il est
toutefois parfaitement possible de clarifier ou de corriger des fautes
dans l'intitulé d'une question sans pour autant affecter les réponses
déjà collectées.

Créer ou modifier un sondage
----------------------------

Une fois que vous avez créé des questions, vous pouvez créer un sondage
et lui attacher des questions.

Pour créer un sondage cliquez sur le lien du même nom dans la barre de
menu du gestionnaire de sondages ou dans la page d'accueil du module
d'administration (voir ?). Ensuite, saisissez les informations suivantes
:

-  Le nom du sondage (donnez lui un titre court)

-  La liste des questions attachées à ce sondage. Il s'agit d'une liste
   d'identifiant des questions que vous voulez voir apparaître dans ce
   sondage séparés par des virgules. Pour consulter la liste des
   identifiants dans une fenêtre séparée, cliquez sur le lien 'Lister
   les questions existantes' et choisissez les identifiants appropriés
   dans la liste. Les questions apparaîtront dans le sondage dans le
   même ordre que les identifiants.

-  Le statut d'un sondage : il peut être actif ou pas. Tant qu'un
   sondage est inactif il n'apparaît pas sur l'écran de bienvenue du
   gestionnaire de sondages et il n'est donc pas accessibles aux
   utilisateurs.

-  Si vous autorisez les réponses anonymes ou non. Autoriser les
   réponses anonymes permettra à des personnes non enregistrées (ou à
   des utilisateurs non authentifiés) de pouvoir répondre au sondage. Si
   les réponses anonymes ne sont pas autorisées, seuls les utilisateurs
   enregistrés et authentifiés pourront répondre au sondage.

Au bas de la page se trouve la liste de l'ensemble des sondages du
projet. Vous pouvez éditer l'un d'entre eux en cliquant sur
l'identifiant dans la colonne de gauche. La modification d'un sondage
peut aussi se faire en cliquant sur le lien "Modifier les sondages" dans
la barre de menu du gestionnaire de sondages puis en cliquant sur le
sondage concerné. Lors de l'édition d'un sondage vous pouvez modifier la
liste des questions ou leur ordre sans effet sur les réponses
existantes. Si vous supprimez une question de la liste, vous ne pourrez
plus consulter les réponses associées s'il y en a. Elles ne sont
cependant pas perdues. En ré-insérant la question dans la liste vous
pourrez consulter les réponses associées (voir la section suivante).

Consulter les résultats d'un sondage
------------------------------------

*Audience : membres du projet*

A n'importe quel moment dans le cycle de vie d'un sondage, il est
possible de consulter les réponses recueillies auprès des utilisateurs
qui ont déjà participé au sondage. Pour consulter les résultats d'une
enquête cliquez sur le lien 'Voir les résultats' dans la barre du menu
d'administration du gestionnaire de sondages puis choisissez le sondage
qui vous intéresse.

|Résultats d'un sondage|

Une liste de l'ensemble des questions du sondage apparaît alors à
l'écran. A côté de chaque question on trouve une vue agrégée de toutes
les réponses. Pour les questions de type 'champ texte' ou 'zone texte'
vous pouvez passer en revue toutes les réponses. Pour les boutons radio,
le gestionnaire de sondages calcule le nombre total de réponses, la
moyenne des valeurs ainsi que la distribution des valeurs.

    **Tip**

    Si vous souhaitez procéder à des traitements plus poussés sur les
    réponses d'un sondage, souvenez-vous que SYS\_PRODUCT\_NAME permet
    aux administrateurs du projet d'exporter les données du projet y
    compris les résultats des sondages. Pour plus d'information voir ?

.. |Page d'accueil du gestionnaire de sondages| image:: ../../screenshots/fr_FR/sc_surveywelcome.png
.. |Un exemple de sondage émanant du projet SYS\_PRODUCT\_NAME| image:: ../../screenshots/fr_FR/sc_surveysample.png
.. |Écran d'administration du gestionnaire de sondages| image:: ../../screenshots/fr_FR/sc_surveyadmin.png
.. |Résultats d'un sondage| image:: ../../screenshots/fr_FR/sc_surveyresults.png
