.. contents::
   :depth: 3
..

Site Web d'un projet
====================

Visiter un site Web
===================

Lorsqu'un projet est créé sur SYS\_PRODUCT\_NAME un site Web spécifique
est initialisé. Vous pouvez accéder au site Web de deux façons
différentes :

-  En tapant l'URL suivant sur votre navigateur Web favori (nom\_projet
   est le nom court du projet) :

   ::

       http://nom_projet.SYS_DEFAULT_DOMAIN
                 

   Ou si votre serveur SYS\_PRODUCT\_NAME est en mode sécurisé :

   ::

       https://nom_projet.SYS_DEFAULT_DOMAIN
                 

-  En cliquant sur le lien "Site Web" dans la barre de services du
   projet en haut de la page de sommaire.

Si l'équipe de projet n'a pas créé ses propres pages Web, vous verrez
apparaître la page d'accueil par défaut vous informant que le site sera
bientôt disponible complétée d'un lien de retour vers le site
SYS\_PRODUCT\_NAME.

Création d'un site Web
======================

Emplacement et structure des répertoires
----------------------------------------

Chaque projet possède son propre emplacement de stockage des pages HTML,
des images, des fichiers de données et des documents qui constituent le
site Web. Tous ces fichiers doivent être placés dans :

::

    /home/groups/nom_projet

Si vous avez la possibilité d'utiliser votre compte Shell (voir ?) pour
vous connecter au serveur SYS\_PRODUCT\_NAME et vous placer dans ce
répertoire en utilisant la commande Unix "cd /home/groups/nom\_projet"
vous verrez trois répertoires :

-  **htdocs** : c'est dans ce répertoire que doivent se trouver toutes
   les pages HTML y compris celles incluant du PHP ou des directives SSI
   (voir ci-dessous pour plus de détails). Toutes les images, icônes ou
   documents utilisés ou référencés dans vos pages Web doivent aussi se
   trouver à  cet endroit (ou dans un sous-répertoire sous htdocs). Dans
   le jargon Apache le répertoire ``/home/groups/projectname/htdocs``
   est appelé le 'Document Root' (Racine des documents) de votre site
   Web.

       **Tip**

       Apache est un serveur HTTP développé par la Consortium Apache. Il
       est disponible sous une licence Open Source et il est de loin de
       le serveur Web le plus populaire avec plus de 60% de part de
       marché. Pour plus d'information consultez le site Web Apache sur
       `http://httpd.apache.org <http://www.apache.org>`__

   Apache s'attend à  ce que la page d'accueil de votre site Web se
   trouve dans un des fichiers suivants :

   -  ``index.html, index.htm`` pour les pages en HTML pur

   -  ``index.shtml`` pour les pages utilisant les extensions SSI de
      Apache

   -  ``index.php`` si vous incluez du PHP dans vos pages.

   Si votre page d'accueil se nomme index.php, prenez soins de renommer
   le fichier index.php d'origine en utilisant les commandes suivantes
   depuis votre compte Shell :

   ``
               cd /home/groups/nom_projet/htdocs
               mv index.php index_default.php ``

-  **cgi-bin** : ce répertoire accueille tous les scripts CGI. Les
   scripts CGI peuvent être écrits en Perl, Python , Shell ou même C.

-  **log** : il s'agit d'un répertoire réservé. N'y placez aucun
   fichier.

Utilisez PHP pour votre site Web
--------------------------------

Les membres d'un projet peuvent concevoir des sites Web sophistiqués en
utilisant le `langage PHP <http://www.php.net>`__. PHP est en train de
devenir un langage de scripting serveur pour le Web extrêmement
populaire. PHP est facile à  apprendre , il est optimisé pour le Web et
interagit aisément avec les bases de données SQL.

Si vous décidez d'inclure des scripts PHP dans les pages Web de votre
projet, assurez-vous d'utiliser l'extension ".php" pour tous les
fichiers concernés. Pour les pages contenant du HTML pur utilisez les
extensions habituelles "htm" ou "html".

Pour des `raisons de
sécurité <http://www.php.net/manual/en/security.php>`__ vos scripts PHP
ont uniquement le droit d'accéder à  des fichiers situés sous la racine
des documents (DocumentRoot) de votre projet à  savoir
``/home/groups/nom_projet/htdocs``.

Publication du site Web
-----------------------

Vous pouvez utiliser différentes méthodes pour publier les pages de
votre site Web sur le serveur SYS\_PRODUCT\_NAME :

-  Édition à  distance avec des éditeurs HTML comme celui de
   Netscape/Mozilla, Microsoft Frontpage ou Emacs avec accès FTP
   transparent.

-  Édition locale sur votre machine et transfert des fichiers soit par
   FTP ou, encore mieux, par SCP.

-  De petits changements peuvent aussi être effectués depuis votre
   compte Shell SYS\_PRODUCT\_NAME en utilisant un éditeur comme vi,
   emacs mais nous vous déconseillons d'effectuer des modifications
   lourdes par ce biais.

Netscape Composer 4.x
~~~~~~~~~~~~~~~~~~~~~

Vous pouvez utiliser Netscape Composer 4.x pour éditer des pages HTML à 
distance. Pour ce faire affichez la page concernée depuis le navigateur
Netscape puis utilisez l'entrée du menu Fichier->Editer la page pour
modifier le contenu de la page et cliquez finalement sur le bouton
'Publier' dans la barre d'outil située en haut de la page.

Saisissez les paramètres suivants dans la boîte de dialogue :

-  Upload Files to this location :

   ::

       ftp://nom_projet.SYS_DEFAULT_DOMAIN/home/groups/nom_projet/htdocs/

-  Login and Password : tapez votre nom d'utilisateur et votre mot de
   passe SYS\_PRODUCT\_NAME. Cliquez sur la case à  cocher pour éviter
   d'avoir à  taper le mot de passe à  chaque opération de sauvegarde.

Macromedia Dreamweaver
~~~~~~~~~~~~~~~~~~~~~~

Vous pouvez utiliser DreamWeaver pour créer le site Web de votre projet.
Contrairement à FrontPage, DreamWeaver supporte parfaitement la
publication à distance par FTP. Pour créer un nouveau site utilisez le
menu Site -> New Site. Dans la boîte de dialogue renseignez le nom du
site et le répertoire local pointant à la racine. Choisissez 'FTP
access' comme méthode d'accès et indiquez
``nom_projet.SYS_DEFAULT_DOMAIN`` en tant que serveur hôte et
``/home/groups/nom_projet/htdocs`` pour le répertoire de publication .
Le nom d'utilisateur et le mot de passe sont les mêmes que ceux de votre
compte SYS\_PRODUCT\_NAME.

Édition locale et transfert à distance
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour ceux d'entre vous qui utilisez un éditeur HTML dépourvu d'une
fonctionnalité d'exportation des fichiers à distance, il est possible de
transférer vos fichiers HTML par d'autres moyens.

-  **FTP** : c'est le moyen le plus simple de transférer vos pages Web
   vers l'emplacement SYS\_PRODUCT\_NAME distant. Utilisez un client ftp
   de votre choix pour vous connecter au serveur
   ``nom_projet.SYS_DEFAULT_DOMAIN`` et utilisez votre nom d'utilisateur
   et mot de passe SYS\_PRODUCT\_NAME. Une fois connecté, utilisez la
   commande suivante :

   ::

       cd /home/groups/nom_projet/htdocs

   et utilisez enfin la commande put (ou mput) pour transférer les
   fichiers modifiés. Vérifiez que les fichiers ont été correctement mis
   à jour à l'aide de votre navigateur. Prenez garde au cache de votre
   navigateur et assurez vous de forcer le rechargement de la page pour
   être bien sûr d'afficher la dernière version !

-  **SCP** :

   ::

       scp -r * nom_utilisateurSYS_SHELL_HOST:/home/groups/nom_projet/htdocs/

   où nom\_utilisateur est votre nom d'utilisateur SYS\_PRODUCT\_NAME.
   L'option -r déclenche une copie récursive et copie donc tous les
   fichiers dans le répertoire ainsi que tous les autres fichiers dans
   les sous-répertoires tout en préservant la même structure
   arborescente.

Référencer le site SYS\_PRODUCT\_NAME
=====================================

L'équipe SYS\_PRODUCT\_NAME demande à ce que tous les sites Web des
projets affichent le logo SYS\_PRODUCT\_NAME sur leur page d'accueil.
Ceci pour deux raisons :

-  Tout d'abord, en référençant le site SYS\_PRODUCT\_NAME sur votre
   page Web vous permettez à vos utilisateurs d'être informé de
   l'existence de SYS\_PRODUCT\_NAME et vous leur donnez une chance de
   le visiter et de prendre connaissance d'autres projets hébergés sur
   SYS\_PRODUCT\_NAME. Ce faisant vous augmentez les opportunités de
   réutilisation.

-  La seconde raison tient au fait que la présence du logo
   SYS\_PRODUCT\_NAME sur votre site Web déclenchera l'incrémentation
   automatique d'un compteur d'accès que SYS\_PRODUCT\_NAME maintient
   pour vous. Le nombre d'accès à votre site est consultable depuis la
   page de sommaire de votre projet en cliquant sur le lien
   "Statistiques" situé sous la description du projet (voir ?). Ceci
   nous aidera aussi à identifier les projets qui pourraient avoir
   besoin de capacités d'hébergement plus importantes en raison de leur
   niveau d'activité.

Pour afficher le logo SYS\_PRODUCT\_NAME sur votre page Web utilisez
l'URL suivant :

::

    http://SYS_DEFAULT_DOMAIN/sflogo.php?group_id=N&type=1
          

utilisez "https" au lieu de "http" si votre serveur est configuré pour
fonctionner en mode sécurisé.

Vous pouvez utiliser ce logo dans des balises de type ancre ou image.
Ainsi vous pouvez par exemple lui associer un hyperlien pointant
directement sur la page de sommaire de votre projet :

::

    <A href="http://SYS_DEFAULT_DOMAIN/projects/nom_projet">
    <IMG src="http://SYS_DEFAULT_DOMAIN/sflogo.php?group_id=N&type=1 width="80"
         height="20" border="0" alt="Code source disponible !">
    </A>
            

    **Note**

    **Attention !** Veillez à remplacer le nombre situé après
    "group\_id" (N dans cet exemple) par votre propre identifiant de
    projet. Vous pouvez prendre connaissance de votre identifiant de
    projet en visitant n'importe quelle page Web d'un des services de
    votre projet et en cherchant la valeur du paramètre group\_id dans
    l'URL (voir la barre de navigation de votre navigateur Web).
