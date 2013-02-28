.. contents::
   :depth: 3
..

Contrôle de version avec Git
============================

Ce chapitre n'est pas un tutoriel Git. Il a pour objectif d'expliquer
comment utiliser les fonctionnalitées proposées par SYS\_PRODUCT\_NAME
Si vous n'êtes pas familier avec Git nous vous conseillons de vous
référer à la documentation (voir ?).

Le support de Git a été développé pour supporter plusieurs dépôts par
projet. Ceci est en accord avec la philosophie des systèmes de gestion
de version distribués qui permet de mettre en place des workflow
distribuant le développement de fonctionnalités sur plusieurs dépôts.

L'accès à Git (à la fois pour les opérations de lecture et d'écriture)
nécessite une clef SSH valide et configurée dans vos préférences
utilisateur. Se référer à ? pour les détails.

Deux types de dépôt se distinguent:

-  Référence : le mode par défaut. Ce type de dépôt a pour vocation de
   représenter la référence public du projet. Cette référence peut être
   organisée sous forme de plusieurs dépôts et structurée par une
   hiérarchie.

-  Fork (clone) : Chaque membre de projet a la possibilité de forker les
   dépôt référence dans son espace personnel. Cette fonctionnalité
   permet de supporter un mode de développement "dépôt
   public/intégrateur".

Référence
=========

Seul un administrateur projet peut créer une référence. Cela se fait
depuis la page d'accueil du service. L'administrateur peut créer autant
de dépôt que nécessaire et peut les organiser via des sous-répertoires.

Une référence doit être initialisée. Notez cependant qu'une référence ne
peut être vide. Si tel est le cas, rajoutez un fichier README par
exemple.

::

        cd mysources
        git init
        git add .
        git commit -m 'initial commit'
        git push gitolite@SYS_DEFAULT_DOMAIN:<nom_court_du_projet>/<nom_du_depot>.git master
        

Si vous avez un dépôt Git existant avec des branches et des tags, vous
pouvez l'importer de la façon suivante:

::

        git push --mirror gitolite@SYS_DEFAULT_DOMAIN:<nom_court_du_projet>/<nom_du_depot>.git
        

Fork
====

Les dépôts "Référence" peuvent être forké de deux façon :

-  Á l'interieur du projet, pour l'usage personnel d'un développeur ;

-  Dans un autre projet, par un administrateur de projet, afin de créer
   de nouvelles "Références" dans le projet de destination.

Dans les deux cas, il faut être membre du projet afin de pouvoir forker.

Le fork "personnel" permet de supporter un mode de développement propre
aux gestionnaires de source décentralisé : le mode
publication/intégrateur. Dans ce mode, chaque développeur travaille
séparément et publie régulièrement dans un dépôt public qu'il est le
seul à pouvoir modifier. Le partage se fait via "git push" / "git pull"
entre les dépôts personnels des développeurs.

Veuillez noter que, pour l'instant, l'écriture dans un dépôt personnel
n'est pas encore restreinte au seul propriétaire du dépôt. Lors d'un
fork, le dépot hérite des permissions de la source.

|Interface de fork de dépôt Git|

L'interface ci-dessus permet également de grouper les dépôt dans une
sous-répertoire (via le champ "chemin").

Paramètres du dépôt
===================

L'administrateur de projet a la possibilité de modifier la configuration
du dépôt. En particulier:

-  la description textuelle du dépôt,

-  les permissions,

-  et la notification suite à un "push"

Permissions
-----------

Dans l'interface de gestion d'un dépôt, l'administrateur de projet peut
permettre à un ou plusieurs groupes d'utilisateur :

-  Lecture : accéder au dépôt en lecture seule.

-  Écriture : pousser (push) de nouvelles révisions, des branches, des
   tags (mais aussi les supprimer).

-  Rewind : dépasser les barrières de protection de git et jouer avec
   l'historique du dépôt. Il est fortement déconseillé d'activer cette
   possibilité si vous ne comprenez par parfaitement ce que vous faites.
   Cette capacité permet de corrompre définitivement l'historique d'un
   dépôt.

|Réglage des permissions Git du dépôt|

Notification par courriel
-------------------------

Il est souvent conseillé de tenir informée toute l'équipe lorque
quelqu'un "pousse" (push) des nouvelles choses dans un dépôt. Vous
pouvez configurer celui ci pour qu'il envoie automatiquement un courriel
à une liste de personnes (ou, mieux, à une liste de diffusion).

Le contenu du message dépend du contenu du push mais vous pouvez
configurer:

-  le préfixe du sujet

-  la liste des destinataires

Lorsque vous ajoutez un destinataire, l'autocompletion est faite sur les
noms d'utilisateurs de la plateforme. Vous pouvez néanmoins forcer
n'importe quelle autre adresse (comme celle d'une liste de diffusion)

Dès la liste configurée, tous les push suivant enverrons un message
contenant :

-  la liste des commits contenus dans le push,

-  les fichiers modifiés (+diffstats),

-  pour chaque commit, un lien vers diff dans l'interface gitweb de
   SYS\_PRODUCT\_NAME,

-  pour chaque référence (dans un message de commit par exemple),
   l'automagic link correspondant.

L'extraction des références croisées ne sera pas faite si la
fonctionnalité de notification par mail n'est pas activée.

Suppression d'un dépôt
======================

Un dépôt peut être supprimé, une archive compressée sera créée sous le
nom {PROJECT\_SHORT\_NAME}\_{REPOSITORY\_NAME}\_{DEL\_TIMESTAMP}.tar.bz2
et déplacée dans le répertoire de sauvegarde. Se référer à la section ?
pour l'import des dépôts.

Import de dépôt
===============

Il n'existe pas de procédure automatique pour importer un dépôt, se
référer à la documentation de l'administrateur.

Les références Git
==================

-  Site officiel de git http://git-scm.com/

-  Le livre : Pro Git http://progit.org/book/ch1-1.html.

.. |Interface de fork de dépôt Git| image:: ../../screenshots/fr_FR/sc_git_personal_fork.png
.. |Réglage des permissions Git du dépôt| image:: ../../screenshots/fr_FR/sc_git_permissions.png
