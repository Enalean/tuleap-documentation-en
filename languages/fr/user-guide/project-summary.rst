.. contents::
   :depth: 3
..

Tableau de bord Projet
======================

Le Tableau de bord Projet est le point d'entrée d'un projet hébergé sur
SYS\_PRODUCT\_NAME et c'est une page très importante que vous pouvez
conserver dans vos signets. A partir de cette page les utilisateurs
enregistrés, les membres du projet ou les administrateurs peuvent suivre
en temps réel l'avancement du projet et accéder aux ressources et
services qui leur sont autorisés. Contrairement à la page
d'Administration du Projet (voir ?), le Tableau de bord Projet est
accessible à tous les utilisateurs. D'une certaine façon il s'agit de la
façade publique du projet.

Accéder au Tableau de bord Projet
=================================

Pour les membres d'un projet, la façon la plus simple d'accéder au
Tableau de bord Projet consiste à se rendre sur la page personnelle et à
cliquer sur le nom de projet approprié.

Pour les autres utilisateurs, il existe plusieurs façons de se rendre
sur le Tableau de bord d'un projet :

Vous pouvez utiliser la boîte de recherche par mots-clés pour retrouver
un projet dont vous connaissez tout ou partie du nom.

Vous pouvez explorer l'arbre des projets si vous savez dans quelles
catégories se trouve le projet.

Vous pouvez aussi cliquer sur le nom du projet s'il apparaît dans la
page d'accueil de SYS\_PRODUCT\_NAME.

Et enfin vous pouvez aussi indiquer explicitement l'URL à votre
navigateur sous la forme :

::

    http://SYS_DEFAULT_DOMAIN/projects/nom_court_du_projet

Si vous devez consulter régulièrement des projets dont vous n'êtes pas
membre, nous vous conseillons de faire apparaître l'URL du tableau de
bord dans votre page personnelle SYS\_PRODUCT\_NAME en utilisant la
fonction "Cette page en signet" du menu de SYS\_PRODUCT\_NAME (voir ?).

    **Tip**

    Le Tableau de bord Projet ne doit pas être confondu avec la page
    d'accueil. Le Tableau de bord donne une vue d'ensemble des activités
    et des délivrables du projet alors que la page d'accueil est le
    point d'entrée du site Web de votre projet. Le site Web d'un projet
    peut être utilisé pour accueillir vos visiteurs, les informer et les
    orienter vers les différents services de SYS\_PRODUCT\_NAME. (voir ?
    pour plus d'information sur l'élaboration du site Web de votre
    projet).

Contenu du Tableau de bord Projet
=================================

Un exemple de Tableau de bord Projet est visible sur la ?. La page se
divise en plusieurs zones :

-  **Menu principal du projet** : il se trouve en haut de la page. Le
   menu principal est un récapitulatif de l'ensemble des services
   disponibles pour ce projet. Ce menu reste visible sur toutes les
   pages qui concernent le projet dans lequel vous naviguez.

-  **Description courte et catégorisation** : ces éléments ont déjà été
   décrits auparavant. A côté de la description courte figure un
   pointeur vers une description plus détaillée du projet.

-  **Membres et administrateurs du projet** : ils apparaissent en haut à
   droite de la page. Un clic sur l'un des noms vous donnera plus
   d'information sur l'utilisateur et la possibilité de lui envoyer un
   email.

-  **Une zone configurable**.

|Un exemple de Tableau de bord du Projet Playground|

SYS\_PRODUCT\_NAME permet aux administrateurs du projet de personnaliser
le Tableau de bord du projet. Le contenu de la page est constitué de
*widgets*. Tous les widgets peuvent être déplacés, fermés ou supprimés.
Certains d'entre eux peuvent fournir un flux rss ou des préférences
peuvent être choisies.

Les utilisateurs autres qu'administrateurs du projet verront une page
statique. Les widgets seront les mêmes, organisés de la même façon, mais
les utilisateurs ne pourrront pas modifier la page.

Les widgets peuvent être ajoutés grâce au lien "Ajouter des widgets".
Voici une liste non-exhaustive de widgets disponible pour les projets :

-  **Derniers fichiers publiés** : montre la liste des versions les plus
   récentes des paquets logiciels disponibles en téléchargement. L'icône
   Notes (|image1|) permet de consulter les notes concernant cette
   version ainsi qu'un résumé des changements (Changelog). A proximité
   se situe l'icône de surveillance de ce paquet (|image2|). La
   sélection de cette icône active la surveillance automatique de ce
   paquet logiciel par SYS\_PRODUCT\_NAME. A chaque fois que l'équipe de
   projet dépose une nouvelle version du logiciel, un message de
   notification vous est envoyé. Tous les paquets sous surveillance se
   trouvent sur votre Page Personnelle et la surveillance peut être
   désactivée depuis cette page ou depuis la page principale du
   gestionnaire de fichiers.

-  **Zones publiques** : il s'agit d'une liste de tous les services
   disponibles pour ce projet assortis d'informations complémentaires
   (comme par exemple le nombre d'artefact ouvert ou fermé). Le rôle de
   cette liste est quasiment identique à celui du menu principal du
   projet situé en haut de la page à savoir fournir un accès rapide à
   chacun des services du projet.

-  **Dernières annonces** : les dix dernières annonces publiées par les
   membres du projet. Certaines de ces annonces peuvent aussi apparaître
   sur le page d'accueil du site si l'équipe SYS\_PRODUCT\_NAME en
   décide ainsi.

-  **RSS Reader** vous permet d'inclure dans votre page personnelle des
   fils rss (ou atom) publiques. Par exemple le lecteur peut afficher un
   flux publié par un outil externe utilisé par le projet (ex:
   intégration continue).

.. |Un exemple de Tableau de bord du Projet Playground| image:: ../../screenshots/fr_FR/sc_projectsummarypage.png
.. |image1| image:: ../../icons/text.png
.. |image2| image:: ../../icons/notification_stop.png
