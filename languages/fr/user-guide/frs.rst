.. contents::
   :depth: 3
..

Gestionnaire de livrables
=========================

Publication du code source : conseils
=====================================

Il existe deux façons pour un administrateur de projet de donner accès
au code source d'un projet hébergé sur SYS\_PRODUCT\_NAME : le système
de contrôle de version (CVS ou Subversion) et le système de gestionnaire
de livrables. A première vue, le fait d'avoir deux systèmes de livraison
du code source peut paraître redondant. Cependant les deux outils ont
été développés avec des objectifs différents et pour des cibles
d'utilisateurs différentes. En ce sens ils sont très complémentaires.
Proposer les deux outils à vos utilisateurs est un vrai plus.

-  **Le système de contrôle de version (SCV)** offre un accès au code
   source y compris l'historique des différentes versions de chaque
   fichier. Toutefois accéder au SCV nécessite l'installation d'un
   logiciel particulier sur le poste client. Certains utilisateurs ne
   peuvent pas ou ne souhaitent pas le faire. L'accès au SCV est
   particulièrement adapté aux utilisateurs de SYS\_PRODUCT\_NAME qui
   souhaitent approfondir le code, ajouter de nouvelles extensions,
   corriger des anomalies et proposer des modifications à l'équipe de
   projet. A noter que certains projets n'autorisent pas l'accès de leur
   SCV aux personnes qui n'appartiennent pas à l'équipe. D'où
   l'importance du Gestionnaire de livrables.

-  **Le gestionnaire de livrables** permet de publier le logiciel
   (source, binaire ou documentation) sous forme de fichiers d'archive
   (zip, tar, jar...) qu'un utilisateur autorisé peut facilement
   télécharger depuis le site Web de SYS\_PRODUCT\_NAME. Aucun outil ni
   connaissance particulière n'est nécessaire. En complément de la
   fourniture éventuelle du code source, fournir des versions binaires
   prêtes à utiliser de vos logiciels est une excellente pratique. Le
   Gestionnaire de livrables est particulièrement adapté aux
   utilisateurs qui souhaitent utiliser rapidement votre logiciel sans
   attendre.

Comme vous pouvez le voir, les deux services sont fondamentalement
différents et nous vous encourageons vivement à les utiliser tous les
deux. Dans le but de vous aider à comprendre pourquoi ces outils sont
complémentaires, le cycle de vie typique d'un projet est illustré sur la
?.

Jargon du Gestionnaire de Livrables
===================================

Avant d'aller plus avant dans la description du Gestionnaire de
livrables nous allons définir quelques termes clés utilisés dans cette
section. Ces termes sont clés pour la compréhension de ce service aussi
bien pour les administrateurs que pour les utilisateurs. (voir ?).

|Structure du Gestionnaire de livrables|

-  **Paquets** : les paquets sont les conteneurs de plus haut niveau. Un
   paquet peut contenir une ou plusieurs version d'un logiciel. En
   général un paquet correspond à un délivrable de haut niveau de votre
   projet. Supposons que votre équipe travaille sur un moteur de base de
   données. Dans ce cas les paquets pourraient être BD-moteur pour le
   moteur de la base de données elle-même, BD-pilotes pour les
   différents pilotes ODBC et JDBC. Un troisième paquet DB-doc pourrait
   être créé pour délivrer la documentation versionnée dans un conteneur
   distinct.

-  **Versions** : une version est une collection de fichiers individuels
   qui ont été figés à un certain moment, versionnés et livrés. En
   général les fichiers contenus dans un conteneur "Version" sont comme
   leur nom l'indique de la même version. Si nous reprenons l'exemple du
   projet de moteur de base de données on pourrait imaginer que le
   paquet BD-moteur contient une version 1.0, une version 1.1 et une
   version 2.0beta. BD-pilote pourrait aussi avoir une version 1.0 mais
   pas de version 1.2 ou 2.0beta si les pilotes 1.0 fonctionnent avec le
   moteur version 1.2 et 2.0beta. En d'autres termes, le nommage des
   versions est totalement libre d'un paquet à l'autre.

-  **Fichiers** : les fichiers sont les entités de base qu'on trouve
   dans une version. En nous appuyant encore une fois sur notre exemple
   de moteur de base de données, on peut imaginer que la version 1.0 du
   paquet BD-moteur comprend le fichier bd-moteur-src-1.0.zip pour le
   code source et bd-moteur-win32-1.0.zip pour la version précompilée
   pour MS Windows. Lorsque la version 1.2 est publiée, elle pourrait
   comporter les fichiers bd-moteur-src-1.2.zip pour les sources,
   bd-moteur-win32-1.0.zip pour la version précompilée pour MS Windows
   et bd-moteur-linux-intel-1.0.zip pour la version précompilée pour
   Linux sur plateforme Intel. Nous n'avons rien dit du paquet BD-doc.
   Il est peut être vide pour le moment ;-)

    **Note**

    Voici véritablement le genre de structure qu'une équipe de projet
    doit adopter pour rendre ses livraisons faciles à comprendre et à
    télécharger. Réfléchir à la structure de vos délivrables logiciels
    et documentation peut vous aider considérablement dans
    l'organisation de votre projet et de vos processus de travail (comme
    les opérations de build ou de test). Ne négligez pas cette partie de
    votre projet.

Navigation dans les fichiers publiés et téléchargement
======================================================

La version la plus récente de chaque paquet d'un projet peut être
visible sur le Tableau de bord Projet (voir ?). Cette version peut être
immédiatement téléchargée en cliquant sur le lien "Téléchargement" ou en
visitant la liste complète des paquets et versions en cliquant sur le
lien "Voir tous les fichiers du projet".

|Exemple de Gestionnaire de livrables|

Navigation dans les paquets
---------------------------

Comme expliqué dans la ?, les projets peuvent contenir plusieurs
paquets.

Le contenu de chaque paquet peut être caché en cliquant sur l'icône
*moins* située juste avant le nom du paquet. Cela peut être utile pour
améliorer la lisibilité si votre projet comprend beaucoup de paquets et
de versions. Pour rendre visible un paquet caché, il suffit de cliquer
sur l'icône *plus* avant le nom du paquet. Par défaut, tous les paquets
sont visibles.

SYS\_PRODUCT\_NAME vous permet également de surveiller des paquets. De
cette manière, vous serez averti lors de la parution d'une nouvelle
version ou lors de la modification d'une version existante. Pour
surveiller un paquet, il suffit de cliquer sur l'icône représentant une
cloche, située après le nom du paquet. Si vous surveillez déjà le
paquet, il y a un petit signe rouge sur la cloche, vous permettant
d'arrêter de surveiller le paquet en question. Si vous ne surveillez pas
le paquet, la cloche aura un petit *plus* vert.

Navigation dans les versions
----------------------------

Un paquet peut contenir plusieurs versions listées dans l'ordre
chronologique. Chaque version contient un certain nombre de fichiers.

Tout comme les paquets, le contenu des versions peut être caché afin
d'améliorer la lisibilité. Le mécanisme est identique : il suffit de
cliquer sur les icônes *plus* et *moins* pour rendre visible/cacher le
contenu des versions. Par défaut, seule la première version de chaque
paquet est visible. Il s'agit de la dernière version disponible.

Après chaque nom de version, l'icône représentant un fichier texte vous
donne accès aux notes et aux changements de la version.

Téléchargement de fichiers
--------------------------

Chaque version contient un certain nombre de fichiers qui peuvent être
téléchargés. Certaines informations sur les fichiers sont également
affichées, comme la taille du fichier, son type, son architecture (le
cas échéant) la date et le nombre de fois qu'il a été téléchargé. Pour
télécharger un fichier, il suffit de cliquer sur le nom du fichier et de
suivre les instructions.

Administration et Livraison de fichiers
=======================================

Cette section s'adresse uniquement aux administrateurs de projet ou aux
administrateurs du Gestionnaire de livrables. Elle explique par le menu
le processus de livraison de fichiers. Il se décompose en deux étapes :

**Création de paquets** : il faut tout d'abord créer un ou plusieurs
paquets. Ceci ne doit être fait qu'une seule fois. Lorsque les paquets
sont en place vous pouvez y ajouter de nouvelles versions à n'importe
quel moment.

**Création de versions** : une fois le paquet créé on peut y ajouter une
ou plusieurs versions. Pour chaque version, on peut attacher des
fichiers, définir la date de publication, lister les changements
contenus dans cette version, etc....

De plus, vous pouvez aussi définir des permissions d'accès au niveau de
chaque paquet et de chaque version.

Si vous êtes administrateur de votre projet ou administrateur du service
fichier de votre projet, vous remarquerez que l'interface des fichiers
contient certains lien supplémentaires, vous permettant de réaliser les
actions d'administration sur le service Fichier (Voir ?

Administration des paquets
--------------------------

Pour administrer les paquets, vous devez être administrateur du projet
ou administrateur du service Fichier. La création et la modification de
paquets sont quasiment identiques.

Création d'un paquet
~~~~~~~~~~~~~~~~~~~~

Pour créer un paquet, il suffit de cliquer sur le lien [ajouter un
paquet] situé en haut de l'écran du service Fichier. Vous devez ensuite
remplir le formulaire, en renseignant le nom du paquet, son rang à
l'écran et son statut :

-  **Nom du paquet** : Il s'agit du nom qui apparaîtra dans l'interface
   des Fichiers. Le nom des paquets doit être unique à l'intérieur d'un
   même projet.

-  **Rang à l'écran** : le rang indique la position à laquelle le paquet
   s'affichera à l'écran. Vous pouvez choisir entre les valeurs : 'au
   début', 'à la fin', ou après chaque paquet déjà présent.

-  **Statut** : un paquet actif sera affiché, alors qu'un paquet caché
   n'apparaîtra pas à l'écran. Les administrateurs veront toutefois les
   paquets caché, afin de pouvoir les modifier. Dans ce cas, ils sont
   affichés en italique pour les différencier des autres.

Modification d'un paquet
~~~~~~~~~~~~~~~~~~~~~~~~

Pour modifier un paquet, cliquer sur l'icône d'édition située après
chaque nom de paquet. Ensuite, le formulaire de modification est
identique à celui de création, à l'exception près que vous pouvez
maintenant définir des permissions sur le paquet (see ?).

|Ecran de modification d'un paquet|

Les membres projet ayant les droits 'Administrateur Fichier' (see ?)
peuvent définir et modifier les permissions des paquets.

Par défaut, les permissions appliquées à un paquet s'appliquent à toutes
les versions et les fichiers de ce paquet. Mais vous pouvez également
affecter des permissions différentes pour chaque version (voir
ci-dessous).

Administration des versions
---------------------------

Pour administrer les versions, vous devez être administrateur du projet
ou administrateur du service Fichier. La création et la modification de
versions sont identiques.

Création et modification d'une version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Une fois le paquet créé vous pouvez y insérer de nouvelles versions
immédiatement. Pour ce faire, cliquez sur le lien [Créer une version]
situé en regard du paquet approprié (voir ?).

Le processus de création et de modification de versions est vraiment
très simple à utiliser. Il peut se décomposer en 6 étapes, mais
certaines sont optionnelles. (see ?). Dans tous les cas, vous pouvez
modifier les versions a posteriori.

|Ecran de modification d'une version|

-  **Etape 1 - Propriétés de la version**

   La première étape est la seule obligatoire pour créer la version dans
   un premier temps. Cette étape vous permet de modifier le paquet de la
   version, la date et le statut de la version. Vous devez également
   renseigner le nom de la version.

-  **Etape 2 - Télécharger et attacher les fichiers à une version
   (facultatif)**

   Cette étape est optionnelle dans le sens où vous pouvez ajouter les
   fichiers après avoir créé la version, mais il est évident qu'une
   version devrait toujours contenir au moins un fichier pour être
   pertinente. Comme expliqué auparavant, plusieurs fichiers peuvent
   être attachés à une même version. Pour ajouter un fichier, cliquer
   sur le lien [ajouter un fichier]. Une boîte de sélection apparaît
   alors, vous permettant de sélectionner le fichier à ajouter. Il y a
   deux moyens d'attacher un fichier :

   -  *Téléchargement direct* : vous pouvez télécharger le fichier via
      l'interface web en utilisant l'option "Fichier Local - Parcourir"
      de la boîte de sélection, et en choisissant le fichier approprié
      sur votre disque local.

   -  *FTP / SCP* : télécharger votre fichier via ftp ou scp avant et
      sélectionner son nom dans la boîte de sélection, dans la section
      "Liste des fichiers FTP/SCP".

          **Tip**

          SYS\_PRODUCT\_NAME vous permet de télécharger vos fichiers par
          FTP (ou SCP). Pour ce faire, suivez les indications qui vous
          sont données lorsque vous cliquez sur le *?* situé après le
          lien [ajouter un fichier]. Ensuite rafraîchissez la page Web
          ou cliquez sur le lien "Rafraîchir la liste des fichiers" puis
          ajouter un nouveau fichier pour voir apparaître les fichiers
          chargés.

      Avant de charger les fichiers assurez-vous de leur donner des noms
      parlants pour les utilisateurs. Idéalement le nom des fichiers
      doit comprendre le numéro de version et une extension indiquant
      s'il s'agit d'un fichier source ou binaire.

-  **Etape 3 - Renseigner les notes concernant la version et les
   modifications (facultatif)**

   Avec la version, vous pouvez également fournir des notes et/ou des
   modification (change log). Vous pouvez au choix copier/coller du
   texte ou télécharger les notes en cliquant sur le lien [télécharger].

   Les notes concernant la version sont typiquement un texte court (10 à
   20 lignes) et de haut niveau résumant les modifications visibles pour
   l'utilisateur (nouvelle interface utilisateur, nouvelles
   fonctionnalités, nouvelles interfaces de programmation...). C'est un
   document important et les versions publiées devraient toutes être
   assorties de ce document. Il permet par exemple à vos utilisateurs de
   décider s'ils doivent mettre à jour leur ancienne version ou pas..

   Le document décrivant les modifications (ChangeLog) est un document
   beaucoup plus technique décrivant en détail tous les défauts corrigés
   dans cette version et tous les changements intervenus dans le code,
   le design ou l'architecture. Ce document n'est pas aussi critique que
   le précédent pour l'utilisateur final mais il est critique pour ceux
   qui utilisent votre logiciel dans d'autres activités de développement
   ou d'intégration.

       **Tip**

       Si vous utilisez CVS comme outil de contrôle de version vous
       pouvez très facilement générer un fichier de Changelog informatif
       et correctement formaté. L'outil cvs2cl disponible sur
       `http://www.red-
       bean.com/cvs2cl <http://www.red- bean.com/cvs2cl>`__ extrait
       automatiquement tous les messages associés aux opérations de
       commit et les présente avec la liste des fichiers impactés, les
       dates de modifications et le nom de l'auteur. C'est une
       excellente base pour un document de type ChangeLog.

-  **Etape 4 - Modification des permissions d'une version (facultatif)**

   Si vous ne spécifiez aucune permission d'accès pour une version, la
   version hérite des permissions définies pour le paquet dans lequel
   elle se trouve. (Par défaut un paquet a la permission
   "utilisateurs-enregistrés".)Si vous avez besoin d'un contrôle d'accès
   plus fin sur vos délivrables logiciels, vous pouvez aussi définir des
   permissions au niveau de chaque version.

   Pour cela, séléctionnez le lien "[Voir/Modifier]" de la partie
   permissions, puis procédez à la sélection des groupes d'utilisateurs
   autorisés pour définir des permissions sur une version. Les
   permissions sur les versions peuvent uniquement être plus strictes
   que celles du paquet auquel elle appartient.

-  **Step 5 - Créer automatiquement une annonce (facultatif)**

   Cette étape est optionnelle, vous pouvez choisir de ne pas en tenir
   compte. Cette étape donne la possibilité aux administrateurs du
   projet de soumettre automatiquement une annonce concernant la
   nouvelle version tout juste créée (si vous n'êtes pas administrateur
   du projet ou pas administrateur des annonces, vous ne verrez tout
   simplement pas cette étape). Pour créer une annonce, il suffit de
   cocher la case située en regard de "Soumettre une annonce", puis de
   compléter votre annonce. Le sujet et le message de l'annonce sont
   préremplis avec un texte par défaut. Vous pouvez bien entendu les
   modifier avant de valider. L'annonce apparaîtra sur la page de
   sommaire de votre projet. Il s'agit là d'un bon moyen d'avertir vos
   utilisateurs de la disponibilité d'une nouvelle version. L'annonce
   apparaîtra ensuite dans la page d'administration des annonces, comme
   toute autre annonce.

-  **Step 6 - Envoyer une notification par email (facultatif)**

   Cette étape est optionnelle, c'est à dire qu'elle peut ne pas
   apparaître à l'écran. Si certains utilisateurs SYS\_PRODUCT\_NAME ont
   activé la surveillance de l'un de vos paquets, l'étape 4 vous
   indiquera combien l'ont fait. SYS\_PRODUCT\_NAME vous donne alors la
   possibilité de leur envoyer (ou pas) une notification email les
   avertissant de la publication d'une nouvelle version conformément à
   leur demande. Nous vous conseillons vivement de ne pas négliger cette
   étape et de tenir vous utilisateurs informés.

       **Tip**

       Lorsque vous préparez les fichiers d'une nouvelle version,
       assurez vous de toujours inclure dans le répertoire de
       pluReleasePropertiess haut niveau de votre archive un fichier
       LISEZMOI (ou README). Ce fichier doit comporter toutes les
       informations utiles concernant votre projet telles que l'adresse
       de votre site Web sur SYS\_PRODUCT\_NAME, les listes de
       distributions destinées aux utilisateurs, comment soumettre un
       bug ou une demande d'assistance à l'équipe de projet (via
       SYS\_PRODUCT\_NAME bien sûr)

Administration de la liste des processeurs
==========================================

Les administrateurs projet et les administrateur du service fichier
peuvent gérer la liste des processeurs pour un projet donné. Le
processeur est une propriété (optionnelle) d'un délivrable. Selon le
projet ou selon votre domaine d'activité, vous pouvez souhaiter ajouter
certains processeurs à la liste existante. Pour ce faire, suivez le lien
"administration - Gérer les processeurs" du service Fichier. Vous
obtenez alors la liste des processeurs pour le projet courant. Les
processeurs *systèmes* ne sont pas modifiables (et ne peuvent être
supprimés). Les autres processeurs sont spécifiques au projet courant.
Vous pouvez les modifier, les supprimer et en créer de nouveaux. Un
processeur a pour attribut un nom et un rang d'affichage dans la liste
des processeurs..

.. |Structure du Gestionnaire de livrables| image:: ../../slides/fr_FR/File_Release.png
.. |Exemple de Gestionnaire de livrables| image:: ../../screenshots/fr_FR/sc_filereleasedownloads.png
.. |Ecran de modification d'un paquet| image:: ../../screenshots/fr_FR/sc_filereleasepackageadmin.png
.. |Ecran de modification d'une version| image:: ../../screenshots/fr_FR/sc_frsreleases.png
