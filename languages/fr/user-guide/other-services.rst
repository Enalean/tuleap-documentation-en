.. contents::
   :depth: 3
..

Autres Services
===============

Compte Shell
============

**Note Importante** : cette fonctionnalité peut avoir été désactivée par
l'administrateur de votre site SYS\_PRODUCT\_NAME et s'avérer
indisponible dans votre organisation.

Si l'administrateur SYS\_PRODUCT\_NAME a activé cette fonctionnalité,
chaque utilisateur enregistré dispose alors de son compte Shell Unix sur
le serveur de comptes Shell SYS\_PRODUCT\_NAME. Vous pouvez accéder à ce
compte de deux façons :

-  **SSH** : l'utilisation du client de compte shell sécurisé est
   recommandée pour se connecter au serveur de comptes Shell
   SYS\_PRODUCT\_NAME. Les clients SSH sont disponibles sur toutes les
   plateformes (Windows, Linux, Unix et Mac). Ils établissent un lien
   sécurisé avec vos répertoires personnels et vous permettent aussi de
   disposer d'autres utilitaires comme SCP pour le transfert de fichiers
   à distance. Pour accéder à votre compte Shell, tapez la commande
   suivante et utilisez votre nom d'utilisateur et mot de passe
   SYS\_PRODUCT\_NAME pour vous identifier :

   ::

       ssh -l nom_utilisateur SYS_SHELL_HOST

-  **Telnet** : telnet est livré en standard dans les environnement
   Windows et Unix. Pour accéder à votre compte Shell, tapez la commande
   suivante et utilisez votre nom d'utilisateur et mot de passe
   SYS\_PRODUCT\_NAME pour vous identifier (remarque : sur certains
   sites SYS\_PRODUCT\_NAME il se peut que telnet soit désactivé pour
   des raisons de sécurité) :

   ::

       telnet SYS_SHELL_HOST

Que vous utilisiez SSH ou telnet, une bannière de bienvenue vous est
présentée une fois la connexion établie. Ce message vous indique quels
sont les répertoires auxquels vous avez accès. Utilisez la commande Unix
"cd" pour changer le répertoire de travail courant. Si vous êtes membre
de plusieurs projets vous devez spécifier pour quel projet vous allez
travailler durant cette session Shell en utilisant la commande suivante
:

::

    newgrp nom_projet

Vous pouvez utiliser cette commande autant de fois que vous le souhaitez
lorsque vous vous apprêtez à travailler pour un autre de vos projets.

Espaces de stockage FTP anonyme
===============================

Chaque projet dispose de son propre espace de stockage FTP anonyme. Si
vous souhaitez controller les accès à vos fichiers, utilisez plutôt le
gestionnaire de fichiers (?)

L'espace FTP anonyme peut être utilisé par les membres du projet pour
télécharger tout type de documents, données ou délivrables du projet.
Cet espace de stockage est accessible en lecture à tous les utilisateurs
SYS\_PRODUCT\_NAME et tous les fichiers placés dans cet espace peuvent
donc être librement téléchargés. En conséquence, assurez-vous d'utiliser
cet espace de stockage uniquement pour des fichiers lisibles par tous.

-  Accès en utilisateur anonyme : utilisez un client ftp pour vous
   connecter à ````. Utilisez "ftp" comme nom d'utilisateur et votre
   adresse email comme mot de passe. Ensuite utilisez la commande
   ``cd /pub/nom_projet`` pour accéder à l'espace FTP anonyme.

-  Accès pour les membres du projet : utilisez un client ftp pour vous
   connecter à ````. utilisez votre nom d'utilisateur et mot de passe
   SYS\_PRODUCT\_NAME pour vous identifier, puis tapez la commande
   ``cd SYS_DATA_DIR/ftp/pub/nom_projet`` pour accéder à l'espace FTP
   anonyme. A partir de là les membres du projet ont accès en lecture et
   en écriture et peuvent télécharger des fichiers dans les deux sens.

   Pour pointer sur cet espace de stockage dans une page Web ou dans un
   email, utilisez l'URL suivant :

   ``ftp://nom_projet.SYS_DEFAULT_DOMAIN:/pub/nom_projet``

API SOAP
========

SYS\_PRODUCT\_NAME fournit une API SOAP pour accéder à
SYS\_PRODUCT\_NAME avec les 'web services'. Actuellement, seuls les
sessions (login/logout) et le service Outil de suivi sont disponibles
via l'API.

Une description des services est disponible à l'adresse
`http://SYS\_DEFAULT\_DOMAIN/soap/ <http://&SYS_DEFAULT_DOMAIN;/soap/>`__.
Il s'agit d'une liste de services, avec pour chaque fonction, ses
paramètres d'entrée, de sortie et une documentation.

Une description plus détaillée des services est également disponible
dans le language formel WSDL à l'adresse
`http://SYS\_DEFAULT\_DOMAIN/soap/?wsdl <http://&SYS_DEFAULT_DOMAIN;/soap/?wsdl>`__
Le WSDL contient en plus la définition des type.

Client en Ligne de Commande SYS\_PRODUCT\_NAME (Command Line Interface, CLI)
============================================================================

Une autre manière d'utiliser SYS\_PRODUCT\_NAME est d'utiliser le client
en ligne de commande (CLI). Il s'agit d'une application cliente qui
utilise l'API SOAP pour communiquer avec le serveur SYS\_PRODUCT\_NAME.
Pour l'instant, seuls les sessions (login/logout) et le service des
Outils de suivi sont disopnibles. Le client en ligne de commande
n'implémente pas non plus certaines fonctions de l'API SOAP (par
exemple, il n'est pas possible d'attacher un fichier, une adresse en
copie CC ou une dependance à un artefact), et la notification par mail
n'est pas active.

La documentation du client en ligne de commande est disponible à
l'adresse :
`http://SYS\_DEFAULT\_DOMAIN/documentation/cli/html/fr\_FR/ <http://&SYS_DEFAULT_DOMAIN;/documentation/cli/html/fr_FR/>`__
