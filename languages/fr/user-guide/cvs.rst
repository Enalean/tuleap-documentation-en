.. contents::
   :depth: 3
..

Contrôle de version avec CVS
============================

Ce chapitre n'est pas un tutoriel CVS. Il couvre l'intégration de CVS
avec SYS\_PRODUCT\_NAME et comment l'utiliser de façon optimale dans ce
contexte. Si vous n'êtes pas familier avec le système de contrôle de
version CVS, nous vous recommandons de consulter les références CVS
(voir ?).

Il est important de comprendre que le contrôle de version ne constitue
qu'une partie de l'activité de gestion de configuration. Pour cette
raison, CVS ne représente pas à lui seul une solution complète de
gestion de configuration pour votre projet. Selon la maturité de votre
projet, vous pouvez être amené à définir des recommandations concernant
la mise à jour de la ligne de base de votre dépôt CVS ou la correction
de bug dans le code, etc... Il est du ressort du chef de projet de
s'assurer que ces politiques de changement sont bien définies et
appliquées.

Un projet peut, par exemple, souhaiter committer (de l'anglais "to
commit") tous les changements intervenus dans le code en fin de journée
pour ne pas perdre de données tout en s'assurant que la ligne de base de
CVS est passée au crible des tests unitaires. Comme la fin de la journée
peut survenir sans que les tests unitaires n'aient été complètement
développés, une seule ligne de base CVS ne peut convenir aux deux usages
et le projet devra sûrement avoir recours à des branches. Ne vous
inquiétez pas si vous ne parvenez pas à définir totalement votre
politique de gestion de configuration en début de projet - elle se
précisera avec le temps - mais n'oubliez pas de communiquer sur le sujet
avec les membres de votre projet et d'améliorer régulièrement votre plan
de gestion de configuration.

CVS : Concurrent Version Control
================================

CVS signifie Concurrent Versions System. Cet outil permet à une équipe
de plusieurs développeurs de gérer concurremment leur propre version de
code et de fusionner les changements (merge) effectués par les
différents membres de l'équipe. CVS permet de garder la trace de tous
les changements intervenus dans l'historique du projet.

Aucun projet de développement logiciel digne de ce nom ne devrait
démarrer sans avoir choisi au préalable un outil de contrôle de version.
CVS et Subversion (voir ?) sont les deux choix proposés par
SYS\_PRODUCT\_NAME.  [1]_ Bien que Subversion soit un système de
contrôle de version plus moderne que CVS, ce dernier reste un choix
parfaitement valable pour les raisons suivantes :

-  Il possède une architecture client/serveur élégante et efficace qui
   le rend utilisable depuis n'importe quel point du réseau.

-  Il est disponible sur quasiment toutes les plateformes matérielles et
   tous les systèmes d'exploitation du marché (Linux, Unix, Windows,
   MacOS...).

-  C'est un système éprouvé, utilisé par des centaines de milliers de
   projets à travers le monde qu'ils soient Open Source ou commerciaux.

-  Il peut-être utilisé en mode ligne de commande ou à travers l'une des
   multiples interfaces graphiques disponibles sur le marché.

-  Il consomme peu d'espace disque côté serveur et peu de bande passante
   réseau entre le serveur et le client. Travailler avec CVS sur une
   liaison modem bas débit est parfaitement faisable.

-  Dès son installation il supporte les projets de petite taille ou de
   taille moyenne et peut être configuré et étendu pour supporter des
   projets de toute taille.

-  Et enfin, c'est un logiciel totalement Open Source distribué sous
   licence GNU GPL.

Clients CVS
-----------

CVS suit une architecture client-serveur. En d'autres termes, les
développeurs SYS\_PRODUCT\_NAME qui souhaitent interagir avec le dépôt
CVS de leur projet doivent installer CVS sur leur machine que nous
appellerons client dans la suite. Le serveur SYS\_PRODUCT\_NAME quant à
lui fait fonctionner en arrière plan un serveur CVS qui communique avec
les clients pour agir sur le dépôt. Il existe plusieurs types de clients
CVS pour toutes les plateformes (Windows, Mac et tous les Unix) : ligne
de commande, client lourd avec interface graphique et interface web.

Interface en ligne de commande
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Suivant la tradition du monde Unix dont il est issu, toutes les
fonctions de CVS sont accessibles en mode ligne de commande. Bien que
CVS offre de nombreuses options de ligne de commandes, la plupart des
commandes que vous utiliserez sont très faciles à mémoriser.
Référez-vous à la ? pour plus d'information sur les commandes CVS.

Interfaces graphiques
~~~~~~~~~~~~~~~~~~~~~

Il existe de nombreux clients CVS avec interface graphique et pour
toutes les plateformes : Windows, Linux, Unix et MacOS. WinCVS et
Tortoise sont les clients les plus populaires sous Windows (voir
ci-dessous). Sur Linux, gCVS et Cervisia sont parmi les plus utilisés.

Il existe aussi un client 100% Java appelé jCVS qui fonctionne sur
toutes les plateformes disposant d'un JDK (ou JRE). Pour ceux d'entre
vous qui utilisent l'éditeur Emacs ou XEmacs il existe un paquetage
appelé pcl-cvs qui offre une intégration complète de CVS dans ces deux
éditeurs. De nombreux éditeurs commerciaux disposent aussi de cette
fonctionnalité.

Enfin, il faut noter que la plupart des environnements de développement
intégré du marché (MS Visual Studio, Visual Age, IntelliJ IDEA,
Eclipse,…) dispose d'un plugins CVS soit de façon native soit par le
biais de tierces parties.

Configurer WinCVS pour SYS\_PRODUCT\_NAME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Comme indiqué précédemment, WinCVS est l'un des clients CVS les plus
populaires sur MS Windows. Vous trouverez ci-dessous toutes les
instructions nécessaires au bon fonctionnement de WinCVS dans le cadre
d'un projet SYS\_PRODUCT\_NAME. Dans les exemples ci-dessous,
"nom\_utilisateur" est le nom d'utilisateur SYS\_PRODUCT\_NAME (login)
et "nom\_projet", le nom court du projet.

-  Téléchargez WinCVS depuis http://www.wincvs.org et installez-le sur
   votre poste de travail.

-  Lancez WinCVS : ``Démarrer->Programmes->WinCvs``

-  Configurer la connexion vers le projet SYS\_PRODUCT\_NAME :
   ``Admin->Preferences``

   Indiquez la valeur de CVSROOT :

   ``:pserver:nom_utilisateur@cvs.nom_projet.SYS_DEFAULT_DOMAIN:/cvsroot/nom_projet``

   Assurez vous que le mode d'authentification est positionné sur :
   ``"passwd" file on the cvs server``

   Ensuite cliquez sur OK.

-  Connectez-vous au dépôt CVS : ``Admin->Login...`` et saisissez votre
   mot de passe SYS\_PRODUCT\_NAME.

-  Identifiez l'endroit où vous allez placer le code source de votre
   projet : ``View->Browse Location->Change...``

-  Récupérez (checkout) le code source de votre projet
   SYS\_PRODUCT\_NAME depuis le dépôt CVS.

   ``Create->Check out module``

   ``Enter the module name and path on the server:`` indiquez le chemin
   du code source que vous souhaitez extraire du dépôt CVS. En général
   il s'agit du nom du dossier situé à la racine du dépôt CVS.

   ``  nom_projet``

   Appuyez sur OK.

   Notez que cette opération peut prendre du temps pour les projets de
   grande taille.

-  Maintenant que vous disposez du code source sur votre machine vous
   pouvez commencer à modifier le code, récupérer les modifications
   apportées au dépôt CVS, etc... WinCVS vous indique quels sont les
   fichiers que vous avez modifié à l'aide d'une icône rouge en regard
   du nom du fichier.

Autres points à connaitre à propos de WinCVS :

-  Si quelqu'un modifie un fichier en même temps que vous, les
   modifications apportées seront fusionnées avec les vôtres lors de la
   prochaine mise à jour de votre copie de travail (update). Si CVS
   détecte un conflit, vous verrez apparaître un message d'erreur et
   vous devrez résoudre le conflit manuellement en éditant le fichier.
   Les zones en conflit sont encadrées par les séquences de caractères
   ">>>>>>" et "<<<<<<". Après modification du fichier vous pouvez à
   nouveau effectuer un commit de la nouvelle version.

-  Prenez garde à l'opération "remove selected" (le gros X noir), car
   l'opération de suppression de fichier dont il est question ici
   s'applique au répertoire et non à la copie de travail locale.

Références CVS
--------------

Comme indiqué précédemment, ce chapitre n'est pas un manuel
d'utilisation de CVS. Il se concentre sur l'intégration de CVS dans
SYS\_PRODUCT\_NAME et comment utiliser CVS dans le contexte de
SYS\_PRODUCT\_NAME. Si vous souhaitez en savoir plus sur CVS,
référez-vous aux documents suivants :

-  Open Source Development with CVS : un livre excellent (en anglais)
   aussi connu sous le nom "The CVS Black Book". Disponible en version
   imprimée chez l'éditeur Coriolis Press. Voir
   http://cvsbook.red-bean.com/.

-  Le manuel CVS officiel. Aussi connu sous l'appellation "Cederqvist"
   d'après le nom de son auteur. Voir
   http://www.cvshome.org/docs/manual/index.html. Ce document est en
   général livré avec CVS - voir plus bas.

-  Diverses documentations et FAQs. Voir
   http://www.loria.fr/~molli/cvs-index.html.

-  Le site Web officiel de CVS. Voir http://www.cvshome.org/.

Intégration de CVS dans SYS\_PRODUCT\_NAME
==========================================

Le dépôt CVS
------------

Dès qu'un nouveau projet est hébergé, un nouveau dépôt CVS est
automatiquement créé et initialisé correctement. Chaque projet dispose
de son propre dépôt, ce qui présente un certain nombre d'avantages : les
fichiers de log, le journal (fichier ``CVSROOT/history``) et tous les
fichiers d'administration sont propres à chaque projet. Cela permet une
personnalisation complète des dépôts CVS projet par projet.

    **Note**

    Les dépôts CVS sont accessibles sous le répertoire
    ``/cvsroot/nom_projet`` sur le serveur SYS\_PRODUCT\_NAME. Toutes
    les interactions avec un dépôt CVS se font normalement via le client
    CVS de votre poste de travail. En cas de besoin et si cette fonction
    est activée sur votre serveur SYS\_PRODUCT\_NAME, vous pouvez
    utiliser votre compte Shell (voir ?) pour interagir directement avec
    votre dépôt. Cependant nous vous recommandons de n'avoir recours à
    cette possibilité que si vous savez exactement ce que vous faites.

Contrôle d'accès CVS
--------------------

Les permissions d'accès au dépôt CVS dépendent du statut du projet
(privé ou public) et de la classe de l'utilisateur (voir ?).

Pour les projets privés, seuls les membres du projet ont accès au dépôt
CVS. Par défaut ils ont accès en lecture et en écriture. Ceci peut être
modifié en ajoutant dans le fichier ``CVSROOT/readers`` le nom des
membres du projet dont l'accès doit être en lecture seule. Actuellement
il n'est pas possible d'empêcher totalement l'accès du dépôt CVS aux
membres d'un projet privé. Si vous souhaitez avoir plus de contrôle sur
la politique d'accès au code source de votre application nous vous
conseillons vivement d'utiliser Subversion à la place de CVS (voir ?).

Pour les projets publics, les règles d'accès par défaut sont les
suivantes :

-  **Utilisateurs anonymes** : les utilisateurs non enregistrés (ou non
   connectés) n'ont *aucun accès* aux dépôts CVS. Selon la configuration
   du serveur SYS\_PRODUCT\_NAME, il est même possible que les
   utilisateurs anonymes n'aient aucun accès au site d'une façon
   générale.

-  **Utilisateurs enregistrés** : ils ont un accès en lecture
   uniquement. Ils peuvent faire un checkout d'une copie de travail mais
   ils ne peuvent faire aucune modification (commit) dans le dépôt CVS.
   Les contributions au code source de ces utilisateurs (correction de
   bogues, améliorations,...) peuvent être envoyées à l'équipe de projet
   via l'outil de suivi des correctifs (patch) (Voir ? ).

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

-  **Administrateurs du projet** : mêmes conditions d'accès que les
   membres du projet.

L'interface de navigation Web de CVS
====================================

SYS\_PRODUCT\_NAME vous permet d'interagir avec votre dépôt CVS via
l'interface Web. Il ne s'agit pas de remplacer le véritable client CVS
que vous utilisez normalement sur votre poste de travail. L'interface
Web de CVS se concentre sur certaines fonctionnalités que n'offrent pas
les clients CVS classiques. L'accès à l'interface Web de CVS se fait via
l'entrée "CVS" de la barre de menu ou via l'entrée CVS de la zone
publique de la page de sommaire (voir ?). L'interface Web de CVS propose
les fonctionnalités suivantes :

-  **Accès au dépôt CVS** : la page d'accueil du service CVS vous donne
   toutes les informations nécessaires pour accéder au dépôt depuis
   votre client CVS. Le chemin d'accès au dépôt, la façon de se
   connecter et de récupérer le code source (checkout) figure parmi les
   informations portées sur cette page. A noter que les administrateurs
   du projet peuvent personnaliser cette page d'accueil (voir ?).

-  **Naviguer dans le dépôt CVS** : L'interface Web vous permet de
   parcourir le dépôt CVS sans qu'il soit nécessaire d'installer un
   véritable client CVS sur votre poste de travail.

-  **Interroger le dépôt CVS** : si la fonction de suivi de CVS est
   activée pour votre projet (c'est toujours le cas par défaut) tous les
   évènements concernant la modification du dépôt (commit, ajout ou
   suppression de fichiers) sont consignés dans la base de données de
   SYS\_PRODUCT\_NAME. Il est ensuite possible d'effectuer des
   recherches dans l'historique des changements selon différents
   critères.

-  **Administration CVS** : ce service permet d'activer ou de désactiver
   la fonction de suivi de CVS pour votre projet, d'activer ou non le
   mode cvs watch pour votre projet, d'activer la notification des
   commits par email et de personnaliser la page d'accueil du service
   CVS (Préambule CVS).

Voyons plus en détail certaines de ces fonctionnalités :

Naviguer dans le dépôt CVS
--------------------------

Pour interagir avec le dépôt CVS d'un projet SYS\_PRODUCT\_NAME, il est
normalement nécessaire d'installer un client CVS sur votre poste de
travail. Cependant SYS\_PRODUCT\_NAME vous permet de naviguer dans le
dépôt, de visualiser le code source, de le télécharger, de consulter
l'historique d'un fichier ou de comparer deux révisions du même fichier.

|Un exemple de navigation dans le dépôt CVS|

Interroger le dépôt CVS
-----------------------

Si le projet a activé la fonction de suivi de CVS (voir ?), l'interface
Web de CVS offre des fonctionnalités particulièrement intéressantes pour
les développeurs :

-  **Commits CVS atomiques et identifiés de façon unique** : tous les
   changements (modification, ajout ou suppression de fichiers) commités
   en une seule opération depuis votre poste client se verront assignés
   un identifiant unique de la part de SYS\_PRODUCT\_NAME. Toutes les
   révisions de fichiers associés à cette modification sont stockées de
   façon atomique dans la base de suivi de CVS sous cet identifiant
   unique.

-  **Références croisées entre commits** : L'identifiant unique affecté
   à chaque opération de commit peut être référencé dans de futures
   opérations de commits ou dans les commentaires associés aux artefacts
   des différents outils de suivi (tâches, anomalies, demande
   d'assistance...) simplement en utilisant le patron ``commit #XXXX``
   (où XXXX est l'identifiant unique généré par SYS\_PRODUCT\_NAME).
   Toute référence de ce type est automatiquement transformé en
   hyperlien vers la base de suivi de CVS. Ce mécanisme permet de
   naviguer facilement depuis un changement dans le code jusqu'à
   l'artefact qui lui a donné naissance et vice-versa (voir ci-dessous
   pour plus de détails).

-  **Recherche dans les commits** : un des autres avantages de la base
   de suivi de CVS est de permettre une recherche selon différents
   critères. Il est possible d'effectuer des recherches parmi les
   changements apportés au code par auteur (qui a fait le changement),
   par identifiant de commit, par tag ou par mots-clés présents dans le
   message associé au commit. Les résultats peuvent être triés en
   cliquant sur les entêtes des colonnes de la table de résultats (voir
   ?).

|Interrogation de la base de suivi CVS d'un projet|

|Détails concernant une opération de commit CVS|

Références croisées entre artefacts et commits CVS
--------------------------------------------------

Lors des phases de développement ou de maintenance d'un projet, il est
essentiel de garder la trace des changements effectués dans le code
source. C'est ce que font les systèmes de gestion de configuration comme
CVS. En complément de ce suivi, il est tout aussi critique de pouvoir
relier ces changements de code aux artefacts (une tâche, une anomalie ou
une demande d'assistance) qui ont amené les développeurs à modifier le
code ou la documentation. Et inversement, à la lecture d'un artefact il
est très utile de voir quels changements il a engendré dans le code
source.

L'intégration de CVS avec SYS\_PRODUCT\_NAME fournit précisément ce
mécanisme de références croisées. Ceci est rendu possible par
l'utilisation de 'références', patrons de texte prédéfinis à utiliser
dans les commentaires des artefacts ou dans les messages de commits de
CVS et que SYS\_PRODUCT\_NAME reconnaît automatiquement.

Les patrons de texte reconnus automatiquement par SYS\_PRODUCT\_NAME
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

-  **commit #YYY** : ce patron référence le commit YYY où YYY est
   l'identifiant unique du commit tel qu'il apparaît dans la base de
   suivi CVS. Lorsque SYS\_PRODUCT\_NAME affiche un message contenant ce
   genre de patron, il le transforme automatiquement en hyperlien vers
   la description du commit référencé (message, fichiers impactés et
   leur révisions, auteur de la modification).

-  Le mécanisme de références de SYS\_PRODUCT\_NAME permet les
   références croisées entre tous les objets de SYS\_PRODUCT\_NAME:
   artefacts, documents, messages de commit, fichiers, etc. Voir la ?
   pour plus de détails sur la gestion des Références.

    **Tip**

    C'est une excellente pratique que de toujours référencer les tâches,
    anomalies, demande d'assistance appropriées dans le message de
    commit CVS. De la même façon, lorsque l'artefact correspondant est
    fermé, assurez-vous de mentionner le commit qui résout le problème
    dans un commentaire. Vous constaterez que cette pratique est
    extrêmement efficace pour suivre l'historique des changements et
    pourquoi un changement a eu lieu.

Administration CVS
------------------

SYS\_PRODUCT\_NAME vous permet de configurer les paramètres suivants de
CVS depuis l'interface Web :

-  **Suivi CVS** : étant donné que CVS est un système de contrôle de
   version il prend naturellement en charge l'historique des changements
   opérés sur vos fichiers ainsi que le nom de l'auteur et la date de
   modification. L'historique d'un fichier peut d'ailleurs être consulté
   soit depuis votre client CVS soit depuis l'interface Web de
   navigation dans le dépôt CVS.

   Si vous activez le suivi CVS pour votre projet SYS\_PRODUCT\_NAME
   conserve aussi une trace de tous les changements intervenus dans la
   base de données SYS\_PRODUCT\_NAME. Ceci vous donne des possibilités
   supplémentaires qui sont expliquées dans la ?

-  **Mode CVS Watch**: Dans CVS les "watches" fonctionnent comme un
   outil de communication. CVS peut être utilisé pour tenir informés les
   utilisateurs sur les modifications du projet en utilisant les
   commandes "``cvs watch add``\ ", "``cvs watch remove``\ ",
   "``cvs edit``\ " et "``cvs unedit``\ ". Les fonctionnalités des
   "watches" dépendent de la coopération des développeurs. Si un
   utilisateur édite un fichier sans avoir au préalable exécuté la
   commande "``cvs edit``\ ", personne n'en sera informé avant que les
   changements ne soient commités. Parce que "``cvs edit``\ " est une
   étape supplémentaire, les utilisateurs peuvent facilement oublier de
   l'utiliser. CVS ne peut pas forcer les utilisateurs à utiliser
   "``cvs edit``\ ", en revanche un mécanisme peut rappeler aux
   utilisateurs de le faire avec la commande "``cvs watch on``\ ".

   Si vous activez le mode CVS Watch pour votre projet, les prochains
   checkouts de ce dernier seront en mode lecture seule, ainsi cela
   rappelera aux développeurs d'utiliser "``cvs edit``\ " avant d'éditer
   un fichier, et les autres développeurs pourront être informés que des
   changements sont en cours sur ce fichier.

   Le mode watch (actif ou inactif) prendra effet dans un délais maximum
   de deux heures après sa modification. Attention : si vous activez ou
   désactivez le mode watch en ligne de commande (et non via
   l'interface), ce dernier ne sera pas mis à jour dans l'interface
   d'administration CVS.

-  **Notification e-mail de CVS** : En complément des fonctions de
   suivi, SYS\_PRODUCT\_NAME peut aussi expédier un courrier
   électronique proprement formaté à des individus ou à une liste de
   diffusion à chaque modification de code. Le courrier électronique
   contient le message expliquant la nature du changement, son auteur,
   la date de modification, la liste des fichiers impactés et des
   pointeurs vers le dépôt CVS montrant les changements effectués dans
   le code.

-  **Préambule CVS** : dans certains cas (par ex. pour des projets
   existants), il se peut que le dépôt CVS d'un projet ne soit pas
   hébergé sur SYS\_PRODUCT\_NAME. Dans ce cas, les informations
   affichées sur la page d'accueil du service CVS de SYS\_PRODUCT\_NAME
   sont incorrectes. Fort heureusement, l'administrateur du projet peut
   personnaliser le message d'accueil en tapant le texte de son choix
   dans cette zone de saisie.

    **Tip**

    Si vous avez l'intention d'envoyer des emails pour notifier certains
    utilisateurs de changements intervenus dans le dépôt CVS, nous vous
    recommandons de créer une liste de diffusion spécifique appelée
    ``nom_projet-cvsevents``. Ainsi, les utilisateurs SYS\_PRODUCT\_NAME
    et les membres du projet intéressés par les notifications pourront
    s'inscrire sur la liste de diffusion. De plus, le gestionnaire de
    liste de diffusion de SYS\_PRODUCT\_NAME se charge d'archiver tous
    les messages ce qui peut servir de référence ultérieurement. Voir ?
    pour la création de liste de diffusion.

Un cycle de vie typique de CVS
==============================

Comme indiqué précédemment, l'objectif de cette section n'est pas de
fournir une formation à CVS mais plutôt d'expliquer quelles sont les
étapes successives parcourues par une équipe dans le cadre d'une
utilisation typique de CVS et, plus généralement, quelles sont les
outils utilisés lors de la publication d'une version d'un logiciel.

Cette section indique aussi comment proposer des modifications de code
lorsque vous ne faites pas partie de l'équipe de projet. Dans les
paragraphes qui suivent tous les exemples sont donnés sous la forme de
lignes de commande mais leur transposition dans une interface graphique
ne devrait pas poser de problèmes.

|Un cycle de développement logiciel typique sur SYS\_PRODUCT\_NAME|

Se connecter
------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

La première étape à franchir lorsque vous travaillez avec un dépôt CVS
consiste à vous connecter au serveur CVS. Sur SYS\_PRODUCT\_NAME, les
utilisateurs anonymes ne peuvent accéder au code source d'aucun projet
que ce soit par CVS ou par le service de publication de fichiers et ceci
même si le projet est public. Il faut donc vous assurer que vous
disposez d'un compte utilisateur avant d'interagir avec un dépôt CVS.

En supposant que vous disposez de votre nom d'utilisateur et de votre
mot de passe, vous pouvez vous authentifier auprès du dépôt CVS. Pour se
faire, tapez la commande suivante (sur une seule ligne) :

::

    cvs -d:pserver:nom_utilisateur@cvs.nom_projet.SYS_DEFAULT_DOMAIN:/cvsroot/nom_projet
    login
            

Où :

-  L'argument -d argument indique le chemin du dépôt (CVS root path).
   C'est une sorte d'URL qui donne l'emplacement du dépôt sur le réseau.
   Les clients CVS graphiques vous demanderont aussi d'indiquer ce
   chemin d'accès.

-  ``nom_projet`` est le nom court du projet

-  ``nom_utilisateur`` est votre nom d'utilisateur SYS\_PRODUCT\_NAME

CVS conserve le mot de passe associé à un chemin d'accès donné. Tant que
vous ne vous déconnectez pas explicitement du dépôt, vous n'aurez pas à
vous authentifier lors des futures sessions de travail. Si vous ne
souhaitez pas laisser votre connexion ouverte, utilisez simplement la
commande "``cvs logout``\ ".

Importer du code source existant
--------------------------------

*Audience : membres du projet*

En tant qu'administrateur d'un tout nouveau projet SYS\_PRODUCT\_NAME,
la première chose à faire consiste à peupler votre tout nouveau dépôt
CVS avec votre code source. Pour ce faire créez d'abord un répertoire
``racine`` sur votre poste de travail et placez y votre code source en
gardant la structure de répertoires à laquelle vous êtes habitué.
Ensuite tapez les commandes suivantes (la seconde sur une seule ligne) :

::

    $ cd racine
    $ cvs -d:pserver:nom_utilisateur@cvs.nom_projet.SYS_DEFAULT_DOMAIN:/cvsroot/nom_projet
    import racine tag_vendeur start
            

Où :

-  L'argument -d argument indique le chemin du dépôt (CVS root path).
   Les clients CVS graphiques vous demanderont aussi d'indiquer ce
   chemin d'accès.

-  ``nom_projet`` est le nom court du projet

-  ``nom_utilisateur`` est votre nom d'utilisateur SYS\_PRODUCT\_NAME

-  ``racine`` est le nom du répertoire de plus haut niveau à importer

-  ``tag_vendeur`` est un tag particulier. Pour le moment utilisez soit
   votre propre nom soit le nom de votre société (sans espace).

    **Tip**

    Il n'est pas rare de faire une erreur lors de l'importation de code
    source dans un nouveau dépôt CVS. Placer les répertoires au mauvais
    niveau ou avec un mauvais nom est une erreur typique. Ne vous en
    faites pas... Si vous souhaitez recommencer avec un dépôt CVS vierge
    contactez simplement l'équipe SYS\_PRODUCT\_NAME et nous
    réinitialiserons votre dépôt.

    **Note**

    Notez que si vous disposez déjà d'un dépôt CVS, l'équipe
    SYS\_PRODUCT\_NAME peut vous aider à le transférer en préservant la
    totalité de l'historique. Nous avons juste besoin d'une archive (zip
    ou tar) de votre dépôt actuel y compris le répertoire CVSROOT. A
    partir de là nous réinstallerons votre dépôt CVS pour vous.
    Contactez-nous pour plus d'information à ce sujet.

Créer une copie de travail (checkout)
-------------------------------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Une fois le dépôt CVS en place, les membres du projet (ou plus
généralement les utilisateurs SYS\_PRODUCT\_NAME si l'accès leur est
permis) peuvent créer une copie de travail sur leur propre poste. A
noter que cette opération dite "checkout" ne permet pas à l'utilisateur
de verrouiller quelque fichier que ce soit. Le paradigme CVS est le
suivant : n'importe qui (ayant les permissions adéquates) peut créer sa
propre copie de travail et la modifier; les changements effectués par
les différents utilisateurs sont réconciliés automatiquement ou marqués
comme devant faire l'objet d'une résolution de conflit lorsque les
fichiers modifiés sont mis à jour localement. Comme son nom l'indique et
contrairement à d'autres outils (RCS, SCCS, ClearCase...) CVS est un
système de contrôle de version concurrent.

Une copie de travail n'est PAS une image du dépôt CVS. Il s'agit plutôt
d'un cliché à un instant donné du code source et, par défaut, il s'agit
de la version la plus récente du code au moment où la copie de travail
est créée ou mise à jour. Une des caractéristiques intéressantes d'une
copie de travail réside dans le fait qu'il s'agit d'une entité autonome.
En d'autres termes, une copie de travail contient toutes les
informations nécessaires à CVS pour savoir de quel serveur et de quel
dépôt provient la copie et à quel moment de l'historique du code source
elle correspond. C'est pour cette raison que vous ne verrez plus
l'argument -d dans les commandes qui suivent la création de la copie de
travail. En effet, ces commandes opèrent toutes dans l'environnement
d'une copie de travail et CVS sait donc parfaitement où se trouve le
dépôt d'origine.

Pour créer une copie de travail, tapez la commande suivante :

::

    cvs -d:pserver:nom_utilisateur@cvs.nom_projet.SYS_DEFAULT_DOMAIN:/cvsroot/nom_projet
    checkout répertoire

Où :

-  L'argument -d indique le chemin du dépôt (CVS root path). Les clients
   CVS graphiques vous demanderont aussi d'indiquer ce chemin d'accès.

-  ``nom_projet`` est le nom court du projet

-  ``nom_utilisateur`` est votre nom d'utilisateur SYS\_PRODUCT\_NAME

-  ``répertoire`` est le chemin du répertoire que vous souhaitez
   extraire du dépôt. Pour en savoir plus sur la structure arborescente
   de votre dépôt CVS, utilisez tout d'abord l'interface Web de
   navigation dans le dépôt CVS (voir ?)

Mettre à jour le code source (update)
-------------------------------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Lancer la commande "``cvs update``\ " depuis une copie de travail a pour
effet de mettre à jour la copie de travail (ou une sous-partie) avec les
dernières versions de chaque fichier en provenance du dépôt. Pour mettre
à jour une copie de travail avec un mode d'affichage concis des
informations, tapez la commande :

::

    cvs -q update
            

Si vous souhaitez uniquement savoir quels sont les fichiers qui ont été
modifiés dans le dépôt depuis la dernière mise à jour de votre copie de
travail sans pour autant la mettre à jour, il suffit d'ajouter
l'argument -n à la commande précédente :

::

    cvs -n -q update
            

Remarque : la commande update de CVS est l'une des plus riches. Outre
l'utilisation que nous venons d'en faire, elle permet aussi de fusionner
les changements de votre code avec d'autres versions du même logiciel,
de changer la branche sur laquelle pointe votre copie de travail.
Référez-vous à la documentation CVS pour plus d'information.

Remonter les modifications vers le dépôt (commit)
-------------------------------------------------

*Audience : membres du projet*

Les membres du projet impliqués dans les activités de développement
voudront certainement faire remonter les modifications dans leur copie
de travail vers le dépôt CVS. Dans la terminologie CVS c'est ce qu'on
appelle une opération de commit.

Pour faire remonter les changements de votre copie de travail vers le
dépôt, tapez la commande suivante :

::

    cvs commit -m"Expliquez ici la nature de la modification..." [nom_fichiers]
            

Où :

-  L'option -m est suivi par un message expliquant la nature des
   changements effectués.

-  L'argument *nom\_fichiers* est optionnel. Il peut s'agir de nom de
   fichiers ou de répertoires. Si aucun nom n'est précisé cvs prend en
   compte tous les fichiers qui ont subi une modification dans le
   répertoire courant et tous les sous-répertoires récursivement.

    **Tip**

    Dans un monde parfait, toutes les modifications effectuées dans le
    code source devraient se rapporter à un artefact de type tâche à
    effectuer, anomalies à corriger... Si votre équipe de projet vit
    dans ce monde idéal :-) n'oubliez pas de mentionner l'identifiant de
    le ou les artefacts concernés dans votre message de commit (voir ?).
    Les fichiers d'administration de CVS peuvent aussi vous aider à
    faire respecter cette règle en rejetant les messages qui ne comporte
    pas ce genre de références.

En tant que membre d'un projet, assurez-vous de bien comprendre et de
respecter la politique mise en place par votre projet avant de faire
remonter des modifications dans le dépôt. Certains projets exigent que
seul du code parfaitement fonctionnel, compilable et testé de façon
unitaire soit remonté dans la branche de développement principale du
dépôt. De cette façon la ligne de base du dépôt peut par exemple faire
l'objet d'un build et d'un test automatique après chaque journée de
travail..

    **Tip**

    Si vous essayez de faire remonter vers le dépôt un fichier qui a
    lui-même fait l'objet d'une remontée par un autre développeur, le
    serveur CVS refusera d'effectuer votre commande ``cvs commit``. Vous
    devez tout d'abord lancer une commande ``cvs update`` pour mettre à
    jour votre copie de travail avec les changements intervenus dans le
    dépôt, fusionner ces changements avec les vôtres (CVS le fait
    automatiquement dans la plupart des cas) et ensuite seulement faire
    remonter vos propres changements dans le dépôt. Si vous voulez vous
    affranchir des changements effectués par les autres développeurs il
    faut alors créer une branche pour y travailler de façon isolée.

Proposer des modifications à l'équipe de projet
-----------------------------------------------

*Audience : tous les utilisateurs SYS\_PRODUCT\_NAME*

Il s'agit d'une variante de la section précédente pour les utilisateurs
qui n'ont pas d'accès en écriture au dépôt CVS d'un projet et qui ne
peuvent donc pas faire remonter leurs modifications directement dans le
dépôt.

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
Windows, soit directement avec votre client CVS si vous avez effectué
vos modifications dans une copie de travail CVS.

**La façon ``diff`` :**

-  Utilisez ``diff`` lorsque vous avez obtenu le code source à partir
   d'une archive et non pas à partir du dépôt CVS. Supposons que le code
   source original se trouve dans le répertoire ``projet-0.1/`` et la
   version modifiée dans ``projet-0.1-nouveau/``

-  Vous pouvez générer un fichier diff à l'aide de la commande suivante
   (tous les fichiers de tous les sous-répertoires feront l'objet d'une
   comparaison) :

   ::

       diff -rc projet-0.1/ projet-0.1-nouveau/

**La façon CVS :**

-  Opérez de cette façon si vous avez modifié une copie de travail CVS.
   Nous supposons que vous vous trouvez au niveau le plus haut de la
   copie de travail.

-  Vous pouvez générer un fichier diff entre votre version et la version
   la plus récente du dépôt en tapant la commande CVS suivante :

   ::

       cvs diff -c

-  Si vous souhaitez générer un fichier diff entre votre version et une
   version spécifique du dépôt, il vous faut alors préciser le tag de
   cette version spécifique (version V1 dans l'exemple ci-dessous) :

   ::

       cvs diff -c -r V1

Dans les deux cas, stockez la sortie des commandes diff ou cvs diff dans
un fichier texte. Compressez le s'il est de taille conséquente et
utilisez l'outil de suivi de correctif du projet (voir ?) pour soumettre
votre correctif à l'équipe de projet.

Et un grand merci pour votre contribution !

Exporter et empaqueter
----------------------

*Audience : membres du projet*

Il existe une façon rapide et simple de publier une version empaquetée
de votre code source et de les mettre à la disposition de vos
utilisateurs via le service de publication de fichiers (voir ?).

Assurez vous que tous les développeurs ont fait remonter vers le dépôt
tous les changements que vous souhaitez délivrer dans cette version.

Mettez à jour votre copie de travail avec l'ensemble des changements
remontés par les développeurs de votre équipe avec la commande suivante
:

::

    cvs -q update

Mettez à jour les fichiers ChangeLog, Release Notes et README (ou
LISEZMOI) au sommet de l'arbre du code source et faites remonter les
modifications apportées à ces 3 fichiers vers le dépôt.

Taggez le dépôt CVS avec un numéro (ou un nom) de version de votre
choix. Ce numéro de version sera attaché à la version la plus récente de
tous les fichiers commités. Depuis votre copie de travail, tapez la
commande suivante (V\_1\_2 est ici un nom de tag qui représente la
version 1.2 du projet) :

::

    cvs -q tag V_1_2

Votre version est maintenant prête. Il ne reste plus qu'à exporter une
copie du code source propre (exempte des fichiers spécifiques à CVS)
dans un nouveau répertoire. En supposant que vous vouliez extraire une
copie propre de la version 1.2 dans le répertoire ``nom_projet-1.2``, la
commande à taper serait la suivante :

::

    cvs -d:pserver:nom_utilisateur@cvs.nom_projet.SYS_DEFAULT_DOMAIN:/cvsroot/nom_projet
    export nom_projet-1.2

Créez une archive tar ou zip à partir du répertoire ``nom_projet-1.2/``

Livrez cette archive via la service de publication de fichiers (voir ?.

C'est fini ! Joli travail... Accordez-vous une pause. Et n'oubliez pas
d'annoncer la disponibilité de cette nouvelle version en utilisant le
service d'annonces de SYS\_PRODUCT\_NAME (voir ?).

CVS pour les administrateurs de projet
======================================

Pour gérer au mieux leur dépôt CVS, les administrateurs doivent
impérativement être informés sur les points qui suivent.

Plus d'information sur le contrôle d'accès à CVS
------------------------------------------------

Comme expliqué dans la ?, CVS est configuré de telle façon que l'accès
en écriture est accordé à tous les membres du projet et à eux seuls.

Un administrateur de projet peut cependant interdire l'accès en écriture
à certains membres du projet. Ce n'est actuellement pas faisable depuis
l'interface Web de SYS\_PRODUCT\_NAME. Vous devez utiliser votre compte
Shell pour vous connecter au serveur (voir ?) et suivre les étapes
suivantes :

-  ``newgrp nom_projet`` (Où ``nom_projet`` est le nom court du projet)

-  ``cd /cvsroot/nom_projet/CVSROOT``

-  Éditer le fichier ``readers`` et ajouter les noms des membres du
   projet qui ne doivent avoir accès au dépôt CVS qu'en lecture (un nom
   par ligne).

-  ``exit`` (Déconnexion)

Les fichiers d'administration de CVS
------------------------------------

Chaque dépôt CVS possède ses propres fichiers d'administration situés
dans le répertoire CVSROOT. Ces fichiers offrent toutes sortes de
possibilités aux administrateurs d'un projet comme la possibilité de
créer des modules virtuels à partir d'une collection de répertoires et
de fichiers dispersés, de provoquer l'envoi d'email sur certaines
opérations comme commit ou add (note : SYS\_PRODUCT\_NAME le fait déjà
pour vous - voir ci-dessous), vérifier le format d'un tag CVS avant de
l'accepter, etc... (Voir la documentation CVS mentionnée dans la ? pour
plus d'information sur les fichiers d'administration de CVS).

    **Tip**

    Il est très important de ne jamais modifier les fichiers
    d'administration de CVS directement dans le dépôt par le biais de
    votre compte Shell (sauf pour les fichiers ``readers`` et
    ``writers``). Utilisez toujours votre client CVS pour effectuer ces
    modifications. Procéder de façon habituelle en extrayant le
    répertoire CVSROOT du dépôt (cvs checkout), modifiez les fichiers
    localement puis remontez les modifications vers le dépôt (commit).

    **Note**

    Si vous modifiez les fichiers d'administration de CVS, assurez-vous
    de garder intact les instructions spécifiques déjà mises en place
    par SYS\_PRODUCT\_NAME dans les fichiers ``config``, ``writers`` et
    ``loginfo``. Veillez aussi à ne pas modifier les permissions du
    possesseur de ces fichiers à moins que vous ne sachiez exactement ce
    que vous faites.

.. [1]
   Il existe beaucoup d'autres systèmes de contrôle de version sur le
   marché soient libres (SCCS, RCS, PKS, Arch, Monotone...) soient
   commerciaux (SourceSafe, ClearCase, TeamWare...)

.. |Un exemple de navigation dans le dépôt CVS| image:: ../../slides/fr_FR/CVS_Web_Session.png
.. |Interrogation de la base de suivi CVS d'un projet| image:: ../../screenshots/fr_FR/sc_cvssearch.png
.. |Détails concernant une opération de commit CVS| image:: ../../screenshots/fr_FR/sc_cvsshowcommit.png
.. |Un cycle de développement logiciel typique sur SYS\_PRODUCT\_NAME| image:: ../../slides/fr_FR/CVS_Life_Cycle.png
