.. contents::
   :depth: 3
..

Contrôle de version avec Subversion
===================================

Ce chapitre n'est pas un tutoriel Subversion. Il couvre l'intégration de
Subversion avec SYS\_PRODUCT\_NAME et comment l'utiliser de façon
optimale dans ce contexte. Si vous n'êtes pas familier avec le système
de contrôle de version Subversion, nous vous recommandons de consulter
les références Subversion (voir ?).

Il est important de comprendre que le contrôle de version ne constitue
qu'une partie de l'activité de gestion de configuration. Pour cette
raison, Subversion ne représente pas à lui seul une solution complète de
gestion de configuration pour votre projet. Selon la maturité de votre
projet, vous pouvez être amené à définir des recommandations concernant
la mise à jour de la ligne de base de votre dépôt Subversion ou la
correction de bug dans le code, etc... Il est du ressort du chef de
projet de s'assurer que ces politiques de changement sont bien définies
et appliquées.

Un projet peut, par exemple, souhaiter committer (de l'anglais "to
commit") tous les changements intervenus dans le code en fin de journée
pour ne pas perdre de données tout en s'assurant que la ligne de base de
Subversion est passée au crible des tests unitaires. Comme la fin de la
journée peut survenir sans que les tests unitaires n'aient été
complètement développés, une seule ligne de base Subversion ne peut
convenir aux deux usages et le projet devra sûrement avoir recours à des
branches. Ne vous inquiétez pas si vous ne parvenez pas à définir
totalement votre politique de gestion de configuration en début de
projet - elle se précisera avec le temps - mais n'oubliez pas de
communiquer sur le sujet avec les membres de votre projet et d'améliorer
régulièrement votre plan de gestion de configuration.

Subversion : l'après CVS
========================

Subversion est un système de contrôle de version Open Source qui gère
l'historique de vos fichiers et répertoires. L'effort de développement
de Subversion a commencé au début de l'année 2000 sous la direction de
Karl Fogel, un expert reconnu de CVS et auteur du célèbre 'CVS Black
Book'(voir ?). Comme des millions de développeurs dans le monde, Karl
avait utilisé CVS pendant des années et il reconnaissait qu'en dépit de
tous ses mérites, CVS souffrait d'un certain nombre de manque qu'il
aurait été vraiment souhaitable de corriger.

Dès le début du projet, l'équipe Subversion, sponsorisée par la société
CollabNet, a clairement indiqué qu'il n'était pas question de créer un
système de contrôle de version révolutionnaire mais plutôt de conserver
tous les point forts de CVS et de corriger ses faiblesses. Il en résulte
que, comme CVS, Subversion est un système de contrôle de version
concurrent, ce qui veut dire que plusieurs développeurs peuvent gérer
leur propre version du même code source et fusionner les changements
apportés par les autres membres de l'équipe à tout moment.

Subversion présente aussi un nombre important d'amélioration par rapport
à CVS :

-  **Versionnage des répertoires** : étant donné que CVS s'appuie sur le
   système de fichiers de la machine sur laquelle il est installé, il
   s'est avéré impossible de versionner les répertoires. Subversion
   s'appuie sur un système de fichiers virtuel stocké dans une base de
   données pour suivre l'historique des changements sur l'ensemble des
   répertoires et des fichiers.

-  **Véritable historique des versions** : le déplacement et le
   renommage des fichiers dans un dépôt CVS sont soumis à certaines
   limitations car CVS gère un numéro de version pour chaque fichier.
   Avec Subversion il est possible d'ajouter, de supprimer, de renommer
   et de copier des fichiers ou des répertoires entiers sans pour autant
   compromettre le nommage des fichiers et leur historique.

-  **Commits atomiques** : bien que SYS\_PRODUCT\_NAME offre une
   surcouche au dessus de CVS qui donne une vue atomique des opérations
   de commits, CVS en lui-même ne conserve aucune trace du fait que vous
   avez fait remonter des modifications sur une douzaine de fichiers en
   une seule opération de commit pour corriger une anomalie. Subversion
   au contraire attribue un nouveau numéro de révision au code source à
   chaque fois que vous opérez un changement.

-  **Méta-données versionnées** : Subversion peut attacher un nombre
   quelconque de propriétés (sous la forme de paires clé/valeur) à des
   fichiers ou à des répertoires. Ces propriétés sont elles-même
   versionnées comme les fichiers et les répertoires auxquels elles sont
   attachées.

-  **Divers protocoles d'accès** : comme CVS, Subversion offre un
   éventail de protocoles permettant l'accès au dépôt. Il peut s'agir
   d'un accès local via le système de fichiers, ou d'un accès par le
   protocole léger de Subversion (svnserve) ou encore d'un accès à
   travers un canal crypté SSH. Plus important, on peut accéder au dépôt
   Subversion via le protocle WebDAV qui est lui même une extension de
   HTTP. Cette approche présente un certain nombre d'avantages comme la
   possibilité d'effectuer toutes les transactions au dessus du
   protocole HTTP sécurisé, de passer à travers les pare-feu et de
   profiter des méthodes d'authentification de HTTP.

-  **Détermination efficace des différences** : lorsque vous créez une
   copie de travail sur votre machine, une version complète des fichiers
   originaux est conservée sur le disque dur local ce qui permet
   d'effectuer des opérations comme ``status`` et ``diff`` même lorsque
   vous travaillez en mode déconnecté.

-  **Etiquetage et création de branches efficaces** : dans Subversion
   ces deux opérations sont effectuées en copiant (tout ou partie) du
   dépôt. La copie est virtuelle dans le sens où le système de fichiers
   virtuel de Subversion établit un lien pour indiquer de quelle
   révision provient la copie. Il en ressort que l'étiquetage et la
   création de branches consomment très peu d'espace disque et, surtout,
   que la durée de ces opérations est indépendante de la taille du
   dépôt.

-  **Contrôle d'accès fin** : tel qu'intégré dans SYS\_PRODUCT\_NAME,
   votre dépôt Subversion communique à travers le protocole HTTP (ou
   HTTPS) et il tire donc parti de la richesse des méthodes
   d'authentification proposées par HTTP. Il en ressort que
   SYS\_PRODUCT\_NAME vous permet de définir finement les droits d'accès
   a votre dépôt Subversion que ce soit pour autoriser la lecture,
   l'écriture ou au contraire interdire l'accès.

-  **Extensibilité** : comme CVS, Subversion propose une ensemble de
   points d'accrochage (hooks) aux différents stades d'une opération de
   commit (pre-check, post-check, etc...). Contrairement à CVS,
   Subversion propose une interface de programmation bien documentée et
   accessible depuis de nombreux langages de programmation comme C/C++,
   Java, Python et Perl.

Les clients Subversion
----------------------

Subversion repose sur une architecture client-serveur. En d'autres
termes, Les développeurs SYS\_PRODUCT\_NAME qui souhaitent interagir
avec un dépôt Subversion doivent installer Subversion sur leur poste de
travail (appelé poste client). SYS\_PRODUCT\_NAME fait fonctionner un
serveur Subversion de façon permanente en tâche de fond. Les clients
Subversion s'adressent à ce serveur pour agir sur le dépôt. Les clients
Subversion sont disponibles sous plusieurs formes pour toutes les
plateformes (Windows et tous les Unix) : ligne de commandes, interface
graphique et interface Web.

Interface par ligne de commandes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Subversion offre un mode ligne de commande sur toutes les plateformes
(Linux/Unix, MS Windows, Mac...). Bien que Subversion possède de
nombreuses options, la plupart des commandes utilisées au quotidien
n'utilisent qu'une ou deux options. Il est donc facile de s'en souvenir
et, qui plus est, elles ressemblent beaucoup aux commandes CVS.
Référez-vous à la ? pour plus d'information sur l'interface par ligne de
commandes de Subversion.

Frontaux graphiques
~~~~~~~~~~~~~~~~~~~

Subversion propose déjà plusieurs frontaux graphiques. rapidSVN fait
partie de la distribution standard de Subversion et fonctionne sur Linux
et Windows. Tortoise SVN est un choix alternatif pour les utilisateurs
MS Windows. jSVN est un client Java qui fonctionne sur toutes les
plateformes. Avec le temps, la liste des frontaux graphiques ne cessera
de s'allonger. Référez-vous à la ? pour plus d'information sur les
frontaux graphiques.

Configurer rapidSVN pour SYS\_PRODUCT\_NAME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Comme indiqué précédemment, rapidSVN est le frontal graphique livré avec
Subversion pour Linux et Windows. Vous trouverez ci-dessous toutes les
instructions pour faire fonctionner rapidSVn avec le dépôt Subversion de
vos projets SYS\_PRODUCT\_NAME. Dans les paramètres utilisés ci-dessous,
"nom\_utilisateur" est le nom d'utilisateur SYS\_PRODUCT\_NAME et
"nom\_projet" le nom court du projet SYS\_PRODUCT\_NAME sur lequel
travaille l'utilisateur.

-  Téléchargez rapidSVN depuis le site Web de Subversion et installez
   sur votre poste de travail.

-  Démarrez l'application rapidSVN.

-  Créez un nouveau signet (bookmark) pour votre dépôt Subversion :
   ``Bookmarks->Add Repository...``

   A l'invite, saisissez l'URL d'accès de votre dépôt :
   ``http://svn.nom_projet.SYS_DEFAULT_DOMAIN/svnroot/nom_projet``

-  Cliquez sur le signet qui vient juste d'être créé et indiquez votre
   nom d'utilisateur et votre mot de passe comme demandé. Vous devriez
   maintenant être capable de naviguer dans le dépôt et de consulter le
   statut des fichiers ainsi que l'historique des révisions.

-  Pour créer votre propre copie de travail, utilisez le menu
   ``Repository->Checkout...``

   Lorsque la boîte de dialogue apparaît, tapez le même URL que
   précédemment et choisissez l'emplacement où vous souhaitez créer
   votre copie de travail locale.

-  Un second signet correspondant à l'emplacement de la nouvelle copie
   de travail devrait apparaître dans le panneau des signets sur la
   gauche de l'écran. Sur la droite apparaît la liste des fichiers et
   répertoires de la copie de travail assortis de leur numéro de
   révision et de leur statut. A partir de là vous pouvez utiliser votre
   éditeur de texte favori pour modifier le code source, rafraîchissez
   ensuite l'écran de rapidSVN pour voir apparaître les fichiers
   modifiés localement et faites remonter les changements (commit) vers
   le dépôt lorsque vous avez terminé vos modifications.

Références Subversion
---------------------

Comme indiqué précédemment, ce chapitre n'est pas un manuel
d'utilisation de Subversion. Si vous souhaitez en savoir plus sur
Subversion, référez-vous à l'un des documents suivants :

-  The Subversion Book. (Voir
   `http://svnbook.red-bean.com <http://svnbook.red-bean.com/>`__).

-  Le site Web officiel de Subversion. Voir
   http://subversion.tigris.org/ C'est là que vous trouverez le logiciel
   Subversion et le frontal graphique rapidSVN.

-  TortoiseSVN. Un frontal graphique pour MS Windows et Linux. Voir
   http://tortoisesvn.tigris.org/.

-  jSVN. Un frontal graphique 100% Java. Voir
   http://jsvn.alternatecomputing.com/.

Intégration de Subversion dans SYS\_PRODUCT\_NAME
=================================================

Le dépôt Subversion
-------------------

Dès qu'un nouveau projet est hébergé, un nouveau dépôt Subversion est
automatiquement créé et initialisé correctement. Chaque projet dispose
de son propre dépôt, ce qui présente un certain nombre d'avantages : le
journal des transactions, l'historique des fichiers et tous les fichiers
administratifs (par exemple les scripts utilisés sur les points
d'accrochage) sont spécifiques à chaque projet. Cela permet une
personnalisation complète des dépôts Subversion projet par projet.

    **Note**

    Toutes les interactions avec un dépôt Subversion se font normalement
    via le client Subversion de votre poste de travail. En cas de besoin
    et si cette fonction est activée sur votre serveur
    SYS\_PRODUCT\_NAME, vous pouvez utiliser votre compte Shell (voir ?)
    pour interagir directement avec votre dépôt. Une fois votre session
    Shell activée, vous trouverez votre dépôt Subversion dans le
    répertoire ``/svnroot/projectname``.Cependant nous vous recommandons
    de n'avoir recours à cette possibilité que si vous savez exactement
    ce que vous faites.

La structure du dépôt Subversion
--------------------------------

Lorsqu'un nouveau projet SYS\_PRODUCT\_NAME est créé, il est pourvu d'un
dépôt Subversion totalement vierge que l'équipe de projet doit remplir
et structurer. Étant donné que Subversion gère les branches et les
étiquettes via son système de fichiers virtuel (et non pas par des
labels attachés à chaque fichier comme dans CVS) il existe des
recommandations concernant l'organisation des répertoires dans votre
dépôt. L'organisation suggérée ci-dessous est considérée comme un
standard de fait et nous vous recommandons vivement de l'adopter.

Si vous prévoyez de ne gérer qu'un seul délivrable dans votre projet,
vous pouvez créer les répertoires suivants au niveau le plus haut de
votre dépôt :

::

    /trunk
    /branches
    /tags
          

où ``/trunk`` contient la ligne de développement principale,
``/branches`` contient les branches de développement et ``/tags`` les
copies du code source qui correspondent en général à des versions de
votre logiciel.

Si, au contraire, vous pensez devoir gérer plusieurs délivrables
indépendants les uns des autres dans un même projet, il est conseillé de
créer d'abord des répertoires de haut niveau qui correspondent à chacun
de ces délivrables et de créer la même structure que précédemment au
niveau inférieur. En supposant que vous ayez deux sous-projets appelés
``engine`` et ``client``, la structure initiale de votre dépôt devait
ressembler à ceci :

::

    /engine/trunk
    /engine/branches
    /engine/tags
    /client/trunk
    /client/branches
    /client/tags
          

Pour plus d'information sur la structure des dépôts Subversion référez
vous aux ouvrages cités dans la ?.

L'interface de navigation Web de Subversion
===========================================

SYS\_PRODUCT\_NAME vous permet d'interagir avec votre dépôt Subversion
via l'interface Web. Il ne s'agit pas de remplacer le véritable client
Subversion que vous utilisez normalement sur votre poste de travail.
L'interface Web de Subversion se concentre sur certaines fonctionnalités
que n'offrent pas les clients Subversion classiques.

L'accès à l'interface Web de Subversion se fait via l'entrée
"Subversion" de la barre de menu ou via l'entrée Subversion de la zone
publique de la page de sommaire (voir ?). L'interface Web de Subversion
propose les fonctionnalités suivantes :

-  **Accès au dépôt Subversion** : la page d'accueil du service
   Subversion vous donne toutes les informations nécessaires pour
   accéder au dépôt depuis votre client Subversion. Le chemin d'accès au
   dépôt, la façon de se connecter et de récupérer le code source
   (checkout) figure parmi les informations portées sur cette page. A
   noter que les administrateurs du projet peuvent personnaliser cette
   page d'accueil (voir ?).

-  **Naviguer dans le dépôt Subversion** : L'interface Web vous permet
   de parcourir le dépôt Subversion sans qu'il soit nécessaire
   d'installer un véritable client Subversion sur votre poste de
   travail.

-  **Interroger le dépôt Subversion** : si la fonction de suivi de
   Subversion est activée pour votre projet (c'est toujours le cas par
   défaut) tous les évènements concernant la modification du dépôt
   (commit, ajout ou suppression de fichiers) sont consignés dans la
   base de données de SYS\_PRODUCT\_NAME. Il est ensuite possible
   d'effectuer des recherches dans l'historique des changements selon
   différents critères.

-  **Administration Subversion** : ce service permet aux administrateurs
   du projet d'effectuer les tâches d'administration et de configuration
   du dépôt Subversion les plus courantes depuis l'interface Web de
   SYS\_PRODUCT\_NAME (pour plus d'information voir ?).

Voyons plus en détail quelques unes de ces fonctionnalités :

Naviguer dans le dépôt Subversion
---------------------------------

Pour interagir avec le dépôt Subversion d'un projet SYS\_PRODUCT\_NAME,
il est normalement nécessaire d'installer un client Subversion sur votre
poste de travail. Cependant SYS\_PRODUCT\_NAME vous permet de naviguer
dans le dépôt, de visualiser le code source, de le télécharger, de
consulter l'historique d'un fichier ou de comparer deux révisions du
même fichier.

|Un exemple de navigation dans le dépôt Subversion|

Interroger le dépôt Subversion
------------------------------

Si le projet a activé le fonction de suivi de Subversion (voir ?),
l'interface Web de Subversion offre des fonctionnalités particulièrement
intéressantes pour les développeurs :

-  **Commits Subversion atomiques et identifiés de façon unique** : tous
   les changements (modification, ajout ou suppression de fichiers)
   commités en une seule opération depuis votre poste client se verront
   assignés un identifiant unique de la part de SYS\_PRODUCT\_NAME qui
   correspond au numéro de révision Subversion.

-  **Références croisées entre commits** : L'identifiant unique affecté
   à chaque opération de commit peut être référencé dans de futures
   opérations de commits ou dans les commentaires associés aux artefacts
   des différents outils de suivi (tâches, anomalies, demande
   d'assistance...) simplement en utilisant le patron ``revision
         #XXXX`` ou encore ``rev #XXXX`` (où XXXX est le numéro de la
   révision généré par Subversion). Toute référence de ce type est
   automatiquement transformé en hyperlien vers la base de suivi de
   Subversion. Ce mécanisme permet de naviguer facilement depuis un
   changement dans le code jusqu'à l'artefact qui lui a donné naissance
   et vice-versa. (plus d'information sur ce mécanisme dans la ?).

-  **Recherche dans les commits** : un des autres avantages de la base
   de suivi de Subversion est de permettre une recherche selon
   différents critères. Il est possible d'effectuer des recherches parmi
   les changements apportés au code par auteur (qui a fait le
   changement), par identifiant de commit, par le chemin des fichiers ou
   par mots-clés présents dans le message associé au commit. Les
   résultats peuvent être triés en cliquant sur les entêtes des colonnes
   de la table de résultats (voir ?).

   Un clic sur l'un des identifiants de commit affiche une liste
   détaillée des changements intervenus, les fichiers impactés et la
   nature du changement accompagné d'un lien direct vers le dépôt
   Subversion montrant les modifications dans le code (voir ?).

|Interrogation de la base de suivi Subversion d'un projet|

Références croisées entre artefacts et commits Subversion
---------------------------------------------------------

Lors des phases de développement ou de maintenance d'un projet, il est
essentiel de garder la trace des changements effectués dans le code
source. C'est ce que font les systèmes de gestion de configuration comme
Subversion. En complément de ce suivi, il est tout aussi critique de
pouvoir relier ces changements de code aux artefacts (une tâche, une
anomalie ou une demande d'assistance) qui ont amené les développeurs à
modifier le code ou la documentation. Et inversement, à la lecture d'un
artefact il est très utile de voir quels changements il a engendré dans
le code source.

L'intégration de Subversion avec SYS\_PRODUCT\_NAME fournit précisément
ce mécanisme de références croisées. Ceci est rendu possible par
l'utilisation des 'références', patrons de texte prédéfinis à utiliser
dans les commentaires des artefacts ou dans les messages de commits de
Subversion et que SYS\_PRODUCT\_NAME reconnaît automatiquement.

Les patrons de référence reconnus automatiquement par SYS\_PRODUCT\_NAME
dans les messages de commit ou dans les commentaires des artefacts sont
les suivants :

-  **XXX #NNN** : ce patron se réfère à l'artefact de type XXX numéro
   NNN, où NNN est l'identifiant unique de l'artefact et XXX le nom
   court utilisé dans l'outil de suivi correspondant (exemple : "bug
   #123", "tâche #321", "DA #12", etc.). Si vous ne connaissez pas le
   nom court de l'outil de suivi ou que vous ne souhaitez pas le
   préciser vous pouvez utiliser le terme générique "art #NNN". Lorsque
   SYS\_PRODUCT\_NAME affiche un message contenant ce genre de patron,
   il le transforme automatiquement en hyperlien vers la description de
   l'artefact référencé.

-  **commit #YYY or revision #YYY or rev #YYY** : ce patron référence le
   commit YYY où YYY est l'identifiant unique du commit tel qu'il
   apparaît dans la base de suivi Subversion. Lorsque SYS\_PRODUCT\_NAME
   affiche un message contenant ce genre de patron, il le transforme
   automatiquement en hyperlien vers la description du commit référencé
   (message, fichiers impactés et leur révisions, auteur de la
   modification).(Voir ?).

-  Le mécanisme de références de SYS\_PRODUCT\_NAME permet les
   références croisées entre tous les objets de SYS\_PRODUCT\_NAME:
   artefacts, documents, messages de commit, fichiers, etc. Voir la ?
   pour plus de détails sur la gestion des Références.

|Détails concernant une opération de commit Subversion|

    **Tip**

    C'est une excellente pratique que de toujours référencer les tâches,
    anomalies, demande d'assistance appropriées dans le message de
    commit Subversion. De la même façon, lorsque l'artefact
    correspondant est fermé, assurez-vous de mentionner le commit qui
    résout le problème dans un commentaire. Vous constaterez que cette
    pratique est extrêmement efficace pour suivre l'historique des
    changements et pourquoi un changement a eu lieu.

Interface d'administration de Subversion
========================================

Les administrateurs de projets peuvent effectuer les tâches les plus
courantes d'administration et de configuration du dépôt Subversion via
l'interface Web de SYS\_PRODUCT\_NAME. Les fonctions d'administration
sont accessibles par l'entrée ``SVN
    Admin`` située dans la barre de menu du service Subversion.

Options générales
-----------------

-  **Suivi Subversion** : étant donné que Subversion est un système de
   contrôle de version il prend naturellement en charge l'historique des
   changements opérés sur vos fichiers ainsi que le nom de l'auteur et
   la date de modification. L'historique d'un fichier peut d'ailleurs
   être consulté soit depuis votre client Subversion soit depuis
   l'interface Web de navigation dans le dépôt Subversion.

   Si vous activez le suivi Subversion pour votre projet,
   SYS\_PRODUCT\_NAME conserve aussi une trace de tous les changements
   intervenus dans la base de données SYS\_PRODUCT\_NAME. Ceci vous
   donne des possibilités supplémentaires qui sont expliquées dans la ?

-  **Préambule Subversion** : dans certains cas (par ex. pour des
   projets existants), il se peut que le dépôt Subversion d'un projet ne
   soit pas hébergé sur SYS\_PRODUCT\_NAME. Dans ce cas, les
   informations affichées sur la page d'accueil du service Subversion de
   SYS\_PRODUCT\_NAME sont incorrectes. Fort heureusement,
   l'administrateur du projet peut personnaliser le message d'accueil en
   tapant le texte de son choix dans cette zone de saisie.

Contrôle des accès au dépôt Subversion
--------------------------------------

Permissions d'accès par défaut
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lorsque SYS\_PRODUCT\_NAME crée le dépôt Subversion d'un projet,
différents niveaux de permissions sont octroyés aux différentes classes
d'utilisateurs de SYS\_PRODUCT\_NAME (voir ?).

Pour les projets privés, seuls les membres du projet ont accès au dépôt
Subversion. Par défaut ils ont accès en lecture et en écriture. Ceci
peut être modifié en personnalisant les permissions d'accès comme
indiqué ci-dessous.

Pour les projets publics, les règles d'accès par défaut sont les
suivantes :

-  **Utilisateurs anonymes** : les utilisateurs non enregistrés (ou non
   connectés) n'ont *aucun accès* aux dépôts Subversion. Selon la
   configuration du serveur SYS\_PRODUCT\_NAME, il est même possible que
   les utilisateurs anonymes n'aient aucun accès au site d'une façon
   générale.

-  **Utilisateurs enregistrés** : ils ont un accès en lecture
   uniquement. Ils peuvent faire un checkout d'une copie de travail mais
   ils ne peuvent faire aucune modification (commit) dans le dépôt
   Subversion. Les contributions au code source de ces utilisateurs
   (correction de bogues, améliorations,...) peuvent être envoyées à
   l'équipe de projet via l'outil de suivi des correctifs (patch) (Voir
   ? ).

       **Note**

       **Note** : si le mode "utilisateurs restreints" (voir ?) est
       activé, les utilisateurs non membres du projet n'auront pas
       d'accès par défaut.

       **Note**

       **Note** : tous les accès au code source sur SYS\_PRODUCT\_NAME
       sont enregistrés. Les administrateurs des projets peuvent à tout
       moment consulter la liste des utilisateurs qui ont accédé au code
       source (voir ?).

-  **Membres du projet** : les membres d'un projet hébergé sur
   SYS\_PRODUCT\_NAME ont un droit d'accès en lecture et en écriture au
   dépôt après s'être authentifié à l'aide de leur nom d'utilisateur
   SYS\_PRODUCT\_NAME et leur mot de passe. Comme expliqué plus haut
   dans le paragraphe concernant les projets privés, il est là aussi
   possible de restreindre l'accès en lecture seule pour les membres du
   projets.

-  **Administrateurs du projet** : même conditions d'accès que les
   membres du projet.

Personnalisation des permissions d'accès
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Grâce à l'intégration de Subversion dans l'environnement
SYS\_PRODUCT\_NAME, les administrateurs de projet peuvent redéfinir les
permissions d'accès pour tout ou partie des utilisateurs de
SYS\_PRODUCT\_NAME.

Pour ce faire, il suffit de spécifier des règles d'accès qui complètent
ou même remplacent les règles par défaut. La syntaxe des permissions
d'accès suit le modèle suivant :

::

    [chemin]
    nom = permission
          

où :

-  ``chemin`` est le chemin vers le répertoire ou le nom de fichier
   (relativement à ``/svnroot/nom_projet``) du dépôt pour lequel vous
   souhaitez (re)définir les permissions d'accès.

-  ``nom`` est soit un nom d'utilisateur SYS\_PRODUCT\_NAME soit un nom
   de groupe. Le nom \* (astérisque) couvre tous les utilisateurs
   enregistrés.

   S'il s'agit d'un groupe d'utilisateurs, le nom doit commencer par le
   caractère @. La ligne ``nom =
           permission`` peut être répétée autant de fois que nécessaire
   pour un chemin donné. Pour définir des groupes d'utilisateurs,
   utilisez le bloc d'instructions suivant :

   ::

       [groups]
       nom_groupe = utilisateur1, utilisateur2,...
             

   Tous les groupes d'utilisateurs définis par le projet (voir ?) sont
   aussi définis dans le fichier des règles de permission par défaut et
   sont donc utilisables lorsque vous spécifiez vos propres permissions
   d'accès.

-  ``permission`` est soit ``r`` pour l'accès en lecture seule, soit
   ``rw`` pour l'accès en lecture et en écriture ou encore une valeur
   vide si l'accès est interdit.

En guise d'exemple, les permissions par défaut du dépôt Subversion
telles qu'expliquées ci-dessus, s'expriment par les règles suivantes :

::

    [groups]
    members = membre1,membre2,...,membreN

    [/]
    * = r
    @members = rw
          

où ``membre1,membre2,...,membreN`` représentent la liste des
utilisateurs du projet.

En outre, tous les groupes d'utilisateurs définis dans ce projet sont
également détaillés dans cette section.

Il est à noter que si un groupe d'utilisateurs n'est défini ni dans la
configuration par défaut ni manuellement par l'utilisateur, chaque
définition de permission reprenant ce group sera commentée.

Cette configuration par défaut est générée automatiquement, et ne peut
pas être éditée par l'utilisateur. Il faut considérer cette section
comme le début du fichier de spécification des permission du dépôt
Subversion: les administrateurs du projet peuvent définir des
permissions, qui seront ajoutées à la suite de cette section.

Notez bien qu'il n'est pas possible de restreindre des permissions déjà
accordées sur un même répertoire.

Par exemple, un projet publique aura le fichier de permission décrit
plus haut; il est inutile dans ce cas d'écrire des règles plus strictes
pour limiter l'accès au repertoire racine. Ainsi, ajouter:

::

    [/]
    * = 
          

n'empèchera pas tout utilisateur enregistré d'accéder au dépôt, puisque
la règle par défaut l'y autorise. Néanmoins, il est tout à fait possible
de restreindre l'accès à un sous-répertoire:

::

    [/secret]
    * = 
    @members = rw
          

empèchera effectivement aux utilisateurs non membres du projet d'accéder
au repertoire '/secret'.

Si vous souhaitez néanmoins interdire l'accès à la totalité du dépôt,
vous devrez contacter un administrateur SYS\_PRODUCT\_NAME.

Pour plus d'information concernant le format de ce fichier référez-vous
aux ouvrages sur Subversion (voir ?).

Notification e-mail de Subversion
---------------------------------

En complément des fonctions de suivi, SYS\_PRODUCT\_NAME peut aussi
expédier un courrier électronique proprement formaté à des individus ou
à une liste de diffusion à chaque modification de code. Le courrier
électronique contient le message expliquant la nature du changement, son
auteur, la date de modification, la liste des fichiers impactés et des
pointeurs vers le dépôt Subversion montrant les changements effectués
dans le code.

Les administrateurs d'un projet peuvent configurer les paramètres
suivants concernant la notification par e-mail :

-  **Entête du sujet** : une chaîne de caractères qui apparaîtra en tête
   de la ligne Sujet des notifications emails envoyées. Cette entête est
   supposée aider les destinataires à identifier rapidement les messages
   reçus et à pouvoir les rediriger vers des dossiers spécifiques par le
   biais de filtres de réception.

-  **Le chemin** : Le chemin dans l'arborescence subversion pour lequel
   la notification va etre employée.

-  **Les adresses e-mail** : une liste d'adresses e-mail (séparées par
   des virgules) destinataires des notifications. Si vous souhaitez
   informer un nombre important d'utilisateurs nous vous recommandons
   vivement de créer un liste de diffusion à cet effet (voir
   ci-dessous).

    **Tip**

    Si vous avez l'intention d'envoyer des emails pour notifier certains
    utilisateurs de changements intervenus dans le dépôt Subversion ou
    un chemin spécifique, nous vous recommandons de créer une liste de
    diffusion spécifique appelée ``nom_projet-cvsevents``. Ainsi, les
    utilisateurs SYS\_PRODUCT\_NAME et les membres du projet intéressés
    par les notifications pourront s'inscrire sur la liste de diffusion.
    De plus, le gestionnaire de liste de diffusion de SYS\_PRODUCT\_NAME
    se charge d'archiver tous les messages ce qui peut servir de
    référence ultérieurement. Voir ? pour la création de liste de
    diffusion.

Un cycle de vie typique de Subversion
=====================================

Comme indiqué précédemment, l'objectif de cette section n'est pas de
fournir une formation à Subversion mais plutôt d'expliquer quelles sont
les étapes successives parcourues par une équipe dans le cadre d'une
utilisation typique de Subversion et, plus généralement, quelles sont
les outils utilisés lors de la publication d'une version d'un logiciel.

Cette section indique aussi comment proposer des modifications de code
lorsque vous ne faites pas partie de l'équipe de projet. Dans les
paragraphes qui suivent tous les exemples sont donnés sous la forme de
lignes de commande mais leur transposition dans une interface graphique
ne devrait pas poser de problèmes.

|Un cycle de développement logiciel typique sur SYS\_PRODUCT\_NAME|

Se connecter
------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Contrairement à Subversion lorsqu'il est utilisé avec le protocole
pserver, il n'est pas nécessaire de se connecter explicitement pour
commencer à travailler avec un dépôt Subversion. Subversion vous
demandera votre nom d'utilisateur et votre mot de passe à la première
opération nécessitant une authentification (comme l'opération commit).

Importer du code source existant
--------------------------------

*Audience : membres du projet*

En tant qu'administrateur d'un tout nouveau projet SYS\_PRODUCT\_NAME,
la première chose à faire consiste à peupler votre tout nouveau dépôt
Subversion avec votre code source. Pour ce faire créez d'abord un
répertoire ``racine`` sur votre poste de travail et placez y votre code
source en suivant l'arborescence recommandée plus haut (voir ?).

Ensuite placez vous dans le répertoire ``racine`` et tapez les commandes
suivantes (la seconde sur une seule ligne) :

::

    svn --username nom_utilissateur import . 
    http://svn.projectname.SYS_DEFAULT_DOMAIN/svnroot/nom_projet 
    --message "Version initiale du répertoire"
            

Où :

-  ``nom_projet`` est le nom court du projet

-  ``nom_utilisateur`` est votre nom d'utilisateur SYS\_PRODUCT\_NAME
   (en minuscules). L'option --username est nécessaire uniquement si
   votre nom d'utilisateur SYS\_PRODUCT\_NAME est différent de votre
   login Unix ou Windows sous lequel vous êtes en train de travailler.

    **Note**

    Si votre dépôt Subversion est configuré en mode sécurisé, vous devez
    utiliser l'URL ``https://SYS_DEFAULT_DOMAIN/svnroot/nom_projet`` au
    lieu de l'URL
    ``http://svn.nom_projet.SYS_DEFAULT_DOMAIN/svnroot/nom_projet`` dans
    tous les exemples qui suivent.

    **Tip**

    Il n'est pas rare de faire une erreur lors de l'importation de code
    source dans un nouveau dépôt Subversion. Placer les répertoires au
    mauvais niveau ou avec un mauvais nom est une erreur typique. Ne
    vous en faites pas... Si vous souhaitez recommencer avec un dépôt
    Subversion vierge contactez simplement l'équipe SYS\_PRODUCT\_NAME
    et nous réinitialiserons votre dépôt.

    **Note**

    Notez que si vous disposez déjà d'un dépôt Subversion, l'équipe
    SYS\_PRODUCT\_NAME peut vous aider à le transférer en préservant la
    totalité de l'historique. Nous avons juste besoin d'une archive (zip
    ou tar) de votre dépôt actuel. A partir de là nous réinstallerons
    votre dépôt Subversion. Contactez-nous pour plus d'information à ce
    sujet.

Créer une copie de travail (checkout)
-------------------------------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Une fois le dépôt Subversion en place, les membres du projet (ou plus
généralement les utilisateurs SYS\_PRODUCT\_NAME si l'accès leur est
permis) peuvent créer une copie de travail sur leur propre poste. A
noter que cette opération dite "checkout" ne permet pas à l'utilisateur
de verrouiller quelque fichier que ce soit. Le paradigme Subversion est
le suivant : n'importe qui (ayant les permissions adéquates) peut créer
sa propre copie de travail et la modifier; les changements effectués par
les différents utilisateurs sont réconciliés automatiquement ou marqués
comme devant faire l'objet d'une résolution de conflit lorsque les
fichiers modifiés sont mis à jour localement. Comme son nom l'indique et
contrairement à d'autres outils (RCS, SCCS, ClearCase...) Subversion est
un système de contrôle de version concurrent.

Une copie de travail n'est PAS une image du dépôt Subversion. Il s'agit
plutôt d'un cliché à un instant donné du code source et, par défaut, il
s'agit de la version la plus récente du code au moment où la copie de
travail est créée ou mise à jour. Une des caractéristiques intéressantes
d'une copie de travail réside dans le fait qu'il s'agit d'une entité
autonome. En d'autres termes, un copie de travail contient toutes les
informations nécessaires à Subversion pour savoir de quel serveur et de
quel dépôt provient la copie et à quel moment de l'historique du code
source elle correspond. C'est pour cette raison que vous ne verrez pas
l'URL qui pointe vers le dépôt dans les commandes qui suivent la
création de la copie de travail. En effet, ces commandes opèrent toutes
dans l'environnement d'une copie de travail et Subversion sait donc
parfaitement où se trouve le dépôt d'origine.

Pour créer une copie de travail, tapez la commande suivante :

::

    svn checkout http://svn.nom_projet.SYS_DEFAULT_DOMAIN/svnroot/nom_projet

Où :

-  ``nom_projet`` est le nom court du projet

Mettre à jour le code source (update)
-------------------------------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Lancer la commande "``svn update``\ " depuis une copie de travail a pour
effet de mettre à jour la copie de travail (ou une sous-partie) avec les
dernières versions de chaque fichier en provenance du dépôt. Pour mettre
à jour une copie de travail, tapez la commande :

::

    svn update
            

Observer les modifications
--------------------------

Si vous souhaitez savoir quels fichiers ont été modifiés dans votre
copie de travail depuis votre dernière mise à jour, tapez la commande
suivante :

::

    svn status
          

Ou quels fichiers ont été mis à jour dans le dépôt Subversion depuis
votre dernière mise à jour :

::

    svn status -u
            

Cette commande vous donnera la liste des fichiers ayant subi des
changements soit parce qu'ils ont été modifiés, détruits ou créés.

Pour comparer les fichiers modifiés localement avec la version qui se
trouve dans le dépôt, vous pouvez utiliser la commande diff :

::

    svn diff nom_de_fichier
            

Si aucun ``nom_de_fichier`` n'est indiqué, l'opération diff est
appliquée de façon récursive sur tous les fichiers et sous-répertoires.

Remonter les modifications vers le dépôt (commit)
-------------------------------------------------

*Audience : membres du projet*

Les membres du projet impliqués dans les activités de développement
voudront certainement faire remonter les modifications dans leur copie
de travail vers le dépôt Subversion. Dans la terminologie Subversion
c'est ce qu'on appelle une opération de commit.

Pour faire remonter les changements de votre copie de travail vers le
dépôt, tapez la commande suivante :

::

    svn commit -m"Expliquez ici la nature de la modification..." [nom_fichiers]
            

Où :

-  L'option -m est suivie par un message expliquant la nature des
   changements effectués.

-  L'argument *nom\_fichiers* est optionnel. Il peut s'agir de nom de
   fichiers ou de répertoires. Si aucun nom n'est précisé Subversion
   prend en compte tous les fichiers qui ont subi une modification dans
   le répertoire courant et tous les sous-répertoires récursivement.

    **Tip**

    Dans un monde parfait, toutes les modifications effectuées dans le
    code source devraient se rapporter à un artefact de type tâche à
    effectuer, anomalies à corriger... Si votre équipe de projet vit
    dans ce monde idéal :-) n'oubliez pas de mentionner l'identifiant du
    ou des artefacts concernés dans votre message de commit (voir ?).
    Les scripts d'accrochage (hook scripts) de Subversion peuvent aussi
    vous aider à faire respecter cette règle en rejetant les messages
    qui ne comportent pas ce genre de références.

    **Tip**

    Si vous essayez de faire remonter vers le dépôt un fichier qui a
    lui-même fait l'objet d'une remontée par un autre développeur, le
    serveur Subversion refusera d'effectuer votre commande
    ``cvs commit``. Vous devez tout d'abord lancer une commande
    ``cvs update`` pour mettre à jour votre copie de travail avec les
    changements intervenus dans le dépôt, fusionner ces changements avec
    les vôtres (Subversion le fait automatiquement dans la plupart des
    cas) et ensuite seulement faire remonter vos propres changements
    dans le dépôt. Si vous voulez vous affranchir des changements
    effectués par les autres développeurs il faut alors créer une
    branche pour y travailler de façon isolée.

Proposer des modifications à l'équipe de projet
-----------------------------------------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Il s'agit d'une variante de la section précédente pour les utilisateurs
qui n'ont pas d'accès en écriture au dépôt Subversion d'un projet et qui
ne peuvent donc pas faire remonter leurs modifications directement dans
le dépôt.

La variante expliquée ici est une méthode utilisée de façon
quasi-universelle dans le monde de l'Open Source pour proposer des
changements à une équipe de projet. Elle consiste à générer un fichier
texte contenant la liste des différences entre votre propre version de
code et la version de référence que vous avez obtenue initialement. Ce
fichier s'appelle un *fichier diff* du nom de l'outil capable de générer
ces fichiers automatiquement.

La raison pour laquelle ces fichiers diff sont si populaires tient au
fait qu'ils respectent un format parfaitement connu et documenté. Les
fichiers diff sont envoyés à l'équipe de projet qui peut alors utiliser
un autre outil universel appelé ``patch`` pour fusionner automatiquement
vos modifications avec le code du dépôt. C'est pour cette raison qu'un
fichier diff est aussi appelé un *patch* (ou *correctif* en français).

Les fichiers peuvent être générés soit avec l'outil ``diff`` (qui fait
partie des outils GNU) disponible sur toutes les plateformes y compris
Windows, soit directement avec votre client Subversion si vous avez
effectué vos modifications dans un copie de travail Subversion.

**La façon ``diff`` :**

-  Utilisez ``diff`` lorsque vous avez obtenu le code source à partir
   d'une archive et non pas à partir du dépôt Subversion. Supposons que
   le code source original se trouve dans le répertoire ``projet-0.1/``
   et la version modifiée dans ``projet-0.1-nouveau/``

-  Vous pouvez générer un fichier diff à l'aide de la commande suivante
   (tous les fichiers de tous les sous-répertoires feront l'objet d'une
   comparaison) :

   ::

       diff -rc projet-0.1/ projet-0.1-nouveau/

**La façon Subversion :**

-  Opérez de cette façon si vous avez modifié une copie de travail
   Subversion. Nous supposons que vous vous trouvez au niveau le plus
   haut de la copie de travail.

-  Vous pouvez générer un fichier diff entre votre version et la version
   la plus récente du dépôt en tapant la commande Subversion suivante :

   ::

       svn diff

-  Si vous souhaitez générer un fichier diff entre votre version et une
   version spécifique du dépôt, il vous faut alors préciser le numéro de
   révision de cette version spécifique (révision #9398 dans l'exemple
   ci-dessous) :

   ::

       svn diff -r 9398

Dans les deux cas, stockez la sortie des commandes diff ou svn diff dans
un fichier texte. Compressez le s'il est de taille conséquente et
utilisez l'outil de suivi de correctif du projet (voir ?) pour soumettre
votre correctif à l'équipe de projet.

Et un grand merci pour votre contribution !

Exporter et empaqueter
----------------------

*Audience : membres du projet*

Il existe une façon rapide et simple de publier une version empaquetée
de votre code source et de la mettre à la disposition de vos
utilisateurs via le service de publication de fichiers (voir ?).

Assurez vous que tous les développeurs ont fait remonter vers le dépôt
tous les changements que vous souhaitez délivrer dans cette version.

Mettez à jour votre copie de travail avec l'ensemble des changements
remontés par les développeurs de votre équipe avec la commande suivante
:

::

    svn update

Mettez à jour les fichiers ChangeLog, Release Notes et README (ou
LISEZMOI) au sommet de l'arbre du code source et faites remonter les
modifications apportées à ces 3 fichiers vers le dépôt.

Créez une copie étiquetée (tag) de votre code source à partir de la
ligne principale de développement (le tronc) en lui donnant un nom
approprié. En supposant que le nom de la version à publier est
``nom_projet-1.4``, la création de la nouvelle version se fait de la
façon suivante :

::

    svn copy
    http://svn.nom_projet.SYS_DEFAULT_DOMAIN/svnroot/nom_projet/trunk
    http://svn.nom_projet.SYS_DEFAULT_DOMAIN/svnroot/nom_projet/tags/nom_projet-1.4
    -m "Etiquettage de la version 1.4"

Votre version est maintenant prête. Il ne reste plus qu'à exporter une
copie du code source propre (exempte des fichiers spécifiques à
Subversion) de la version 1.4 de votre logiciel en tapant :

::

    svn export
    http://svn.nom_projet.SYS_DEFAULT_DOMAIN/svnroot/nom_projet/tags/nom_projet-1.4

Créez une archive tar ou zip à partir du répertoire ``nom_projet-1.4/``

Livrez cette archive via le service de publications de fichiers (voir
?).

C'est fini ! Joli travail... Accordez-vous une pause. Et n'oubliez pas
d'annoncer la disponibilité de cette nouvelle version en utilisant le
service d'annonces de SYS\_PRODUCT\_NAME (voir ?).

Subversion pour les administrateurs de projet
=============================================

Les scripts d'accrochage de Subversion (hook scripts)
-----------------------------------------------------

SYS\_PRODUCT\_NAME offre une interface Web facile d'utilisation
permettant de définir les paramètres de configuration les plus
fréquemment utilisés de votre dépôt Subversion comme les droits d'accès
ou la notification par email. Les administrateurs de projet qui
souhaitent personnaliser davantage la configuration de leur dépôt
peuvent avoir accès aux scripts d'accrochage de Subversion.

Pour ce faire, vous devez avoir l'autorisation de vous connecter au
serveur SYS\_PRODUCT\_NAME via votre compte Shell (voir ?) [1]_.

.
Une fois connecté, tapez la commande suivante à l'invite du shell :

-  ``newgrp nom_projet`` (où ``nom_projet`` est le nom court du projet)

-  ``cd /svnroot/nom_projet/hooks``

-  Si le script d'accrochage que vous souhaitez personnaliser n'existe
   pas dans le répertoire ``hooks``, il vous faut d'abord le créer en
   copiant le modèle de fichier correspondant fourni par Subversion
   (extension ``.tmpl``). Ensuite vous pouvez éditer le script
   directement dans le répertoire.

-  ``exit`` (Logout)

    **Tip**

    Si vous personnalisez les scripts d'accrochage de Subversion pour
    votre dépôt, veillez à ne pas altérer les instructions mises en
    place par SYS\_PRODUCT\_NAME. Ces instructions sont clairement
    marquées à l'aide de lignes de début et de fin très reconnaissables.

.. [1]
   Il se peut que l'administrateur du site ait décidé de désactiver les
   compte Shell.

.. |Un exemple de navigation dans le dépôt Subversion| image:: ../../slides/fr_FR/SVN_Web_Session.png
.. |Interrogation de la base de suivi Subversion d'un projet| image:: ../../screenshots/fr_FR/sc_svnsearch.png
.. |Détails concernant une opération de commit Subversion| image:: ../../screenshots/fr_FR/sc_svnshowcommit.png
.. |Un cycle de développement logiciel typique sur SYS\_PRODUCT\_NAME| image:: ../../slides/fr_FR/SVN_Life_Cycle.png
