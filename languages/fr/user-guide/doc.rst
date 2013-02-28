.. contents::
   :depth: 3
..

Gestionnaire de Documents
=========================

La documentation est probablement le délivrable le plus important d'un
projet après le logiciel lui-même. SYS\_PRODUCT\_NAME propose un service
spécifique pour la gestion de la documentation.

Bien que le gestionnaire de documents de SYS\_PRODUCT\_NAME ne soit pas
comparable à un système de gestion documentaire dédié, il est cependant
extrêmement pratique pour gérer les documents critiques pour votre
communauté d'utilisateurs. Quelques exemples : manuel d'installation,
d'administration ou d'utilisation, documentation des API, Foire aux
Questions, etc...

Les fonctionnalités du gestionnaire de documents sont les suivantes :

-  Le gestionnaire peut gérer n'importe quel type de document.

-  Les documents sont stockés dans des dossiers. Vous pouvez avoir des
   sous-dossiers dans un dossier.

-  Les documents peuvent être édités en ligne (si ils sont embarqués au
   format text ou html).

-  Les règles de droits d'accès peuvent être définies pour chaque
   dossier ou document.

-  Les documents possèdent des propriétés.

Structure
=========

Vous pouvez structurer comme vous voulez votre gestionnaire de document
en créant des dossiers et sous-dossiers pour classer vos documents.

|Dossiers et sous-dossiers|

Actions
=======

Le gestionnaire de document permet certaines actions sur les dossiers ou
documents. Ces action sont disponible ou pas suivant les permissions.
Pour afficher le paneau des actions, il vous suffit de cliquer sur
l'icône en forme de crayon à côté du titre de l'élément.

|Actions|

Nous allons maintenant décrire toutes les actions qui peuvent être
effectuées :

Nouveau Document
----------------

Cette action est seulement disponible pour les dossiers et permet à
l'utilisateur de créer un nouveau document. Quand vous selectionnez
cette action, une fenêtre "Nouveau document" est affichée, où vous
pouvez entrer les informations concernant le nouveau document.

|Créer un nouveau document|

Le nouveau document hérite des permissions du dossier parent.

Propriétés
~~~~~~~~~~

Le titre du document est obligatoire. L'utilisateur peut fournir une
description. En fonction du projet, il peut y avoir des propriétés
supplémentaires requise pour définir le document.

Type de document
~~~~~~~~~~~~~~~~

5 types de documents sont disponibles :

-  *Vide:* le document ne sera pas typé. L'utilisateur pourra choisir le
   type définitif après la création.

-  *Lien:* autorise l'utilisateur à pointer un document avec une URL. Le
   document ne sera pas stocké localement dans le manager.

-  *Wiki:* le document peut être créé avec le service wiki.Entrez juste
   le nom correspondant à la nouvelle page wiki. Vous pouvez également
   utiliser une page wiki existante.

-  *Fichier:* n'importe quel type de documents peut être chargé. Depuis
   une présentation PowerPoint à une simple image ou un document office.
   Les fichiers sont versionnés ainsi vous pouvez ajouter de nouvelles
   versions sur les documents existants.

-  *Fichier embarqués:* les documents de type texte ou html peuvent être
   édités en ligne et sont versionnés.

Chemin
~~~~~~

Par défaut, le sytème crée un document dans le dossier qui a été
sélectionné. L'utilisateur peut aussi choisir un autre dossier. Il peut
également sélectionner la position du nouveau document dans le dossier :
au début ou à la fin.

Nouveau Dossier
---------------

Cette action est seulement disponible pour les dossiers et permet à
l'utilisateur de créer un sous-dossier.

|Créer un nouveau dossier|

Le nouveau dossier hérite des permissions du dossier parent.

Propriétés
~~~~~~~~~~

Comme pour les documents, le titre des dossier est obligatoire.
L'utilisateur peut fournir une description. Selon les projets, il peut y
avoir des propriétés supplémentaires requises pour définir les dossiers.

Chemin
~~~~~~

Comme pour les documents, par défaut, le système crée un dossier dans le
dossier qui a été sélectionné. L'utilisateur peut aussi choisir un autre
dossier. Il peut également sélectionner la position du nouveau dossier :
au début ou à la fin.

Propriétés
----------

Cette action permet à l'utilisateur de voir les propriétés d'un document
ou d'un dossier, si il en a les droits. Si il a les permissions
requises, il sera capable de modifier ces propriétés.

|Afficher et editer les propriétés|

Depuis le paneau des propriétés, il est possible de voir/éditer les
permissions, voir l'historique et d'accèder aux actions (mise à
jour/déplacement/suppression).

Notifications
-------------

Cette action permet à l'utilisateur de s'abonner à toute modification
d'un élément. Ainsi il pourra être prévenu de l'ajout d'un document dans
un dossier, de la modification d'un document, de son déplacement, ... Il
suffit de cocher la case prévue à cet effet.

|Notifications|

Historique
----------

Cette action permet à l'utilisateur de voir les journaux et les
anciennes versions (si disponibles).

|Historique|

Mise à jour
-----------

Cette action permet à l'utilisateur de mettre à jour le nom d'une page
wiki ou l'url d'un lien.

|Mise à jour d'un lien|

Nouvelle version
----------------

Cette action permet à l'utilisateur de mettre à jour un document de type
fichier ou fichier embarqué.

|Créer une nouvelle version d'un fichier embarqué|

Permissions
-----------

Cette action permet à l'utilisateur de gérer les permissions d'un
document ou d'un dossier. Les permissions d'un dossier peuvent être
appliquées recursivement à sa sous-hiérarchie.

|Definir les permissions|

Il y a 3 types de permission.

Lecteurs
~~~~~~~~

Ceux qui peuvent lire un document ou accèder au contenu d'un dossier.

"lecture" signifie accès au document/dossier, voir ses propriétés, voir
son historique.

Merci de noter que si un utilisateur ne peut pas lire un dossier alors
il ne pourra pas accèder à tout les éléments en dessous de lui, quelques
soient leurs permissions.

Rédacteurs
~~~~~~~~~~

Les Rédacteurs sont des lecteurs qui peuvent modifier un document ou
créer un sous-élément dans un dossier.

"Modifier" signifie mettre à jour/ajouter une nouvelle version, modifier
un lien ou le nom d'un page wiki, modifier les propriétés, déplacer un
élément ou le supprimer.

Gestionnaires
~~~~~~~~~~~~~

Les gestionnaires sont des rédacteurs qui peuvent aussi définir les
permissions d'un document ou d'un dossier. Ils peuvent aussi consulter
les historique d'accès à un document.

Déplacer
--------

Les documents ou les dossiers peuvent être déplacés au sein des
documents du projet.

L'utilisateur ne peut déplacer un élément que si les dossiers source et
destination sont modifiables.

Vous pouvez déplacer un item de différentes façons.

La façon usuelle est de selectionner "déplacer" dans le menu popup d'un
élément. Vous aurez alors à choisir un dossier de destination (ou
éventuellement le laisser au même endroit) et la nouvelle position (au
début, à la fin ou à une position spécifique). Les permissions de
l'élément ne seront pas changées.

|Déplacer un document|

Si vous ne voulez que réordonner le contenu d'un dossier, vous pouvez
cliquer sur les raccourcis à coté de "déplacer" dans le menu popup :
décaler d'une place vers le haut, d'une place vers le bas, placer au
début du dossier ou à la fin.

|Raccourcis pour déplacer un élément au sein d'un dossier|

Delete
------

Les documents ou dossiers peuvent être supprimés. Si un utilisateur veut
supprimer un dossier, il sera averti que tous les sous-éléments seront
supprimés (si il a les permissions ad-hoc).

Pour pouvoir supprimer un élément, l'utilisateur doit avoir le droit
"rédacteur" sur le répertoir parent.

Administration
==============

Permissions
-----------

Cette section définie qui peut administrer le gestionnaire de documents.

Les administrateurs du gestionnaire de documents ont tous les droits sur
tous les éléments du gestionnaires.

Afficher les permissions
------------------------

Cette section permet de définir la vue par défaut du gestionnaire de
documents. Ce paramètre peut être surchargé par les préférences de
l'utilisateur.

Propriétés
----------

Cette section gère les propriétés des documents. Chaque propriété peut
être valuée lors de la soumission ou de l'édition d'un document.

Il n'y a pas de permissions spécifiques aux propriétés. Si un
utilisateur peut lire(modifier) un document, il peut également
lire(modifier) chacune de ses propriétés.

.. |Dossiers et sous-dossiers| image:: ../../screenshots/fr_FR/sc_docman2_folders.png
.. |Actions| image:: ../../screenshots/fr_FR/sc_docman2_actions.png
.. |Créer un nouveau document| image:: ../../screenshots/fr_FR/sc_docman2_newdocument.png
.. |Créer un nouveau dossier| image:: ../../screenshots/fr_FR/sc_docman2_newfolder.png
.. |Afficher et editer les propriétés| image:: ../../screenshots/fr_FR/sc_docman2_properties.png
.. |Notifications| image:: ../../screenshots/fr_FR/sc_docman2_notifications.png
.. |Historique| image:: ../../screenshots/fr_FR/sc_docman2_history.png
.. |Mise à jour d'un lien| image:: ../../screenshots/fr_FR/sc_docman2_update.png
.. |Créer une nouvelle version d'un fichier embarqué| image:: ../../screenshots/fr_FR/sc_docman2_newversion.png
.. |Definir les permissions| image:: ../../screenshots/fr_FR/sc_docman2_permissions.png
.. |Déplacer un document| image:: ../../screenshots/fr_FR/sc_docman2_move.png
.. |Raccourcis pour déplacer un élément au sein d'un dossier| image:: ../../screenshots/en_US/sc_docman2_move_shortcuts.png
