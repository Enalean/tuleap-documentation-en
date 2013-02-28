.. contents::
   :depth: 3
..

Administration d'un projet
==========================

Lorsque vous accédez à la page de Sommaire d'un projet ou à l'un de ses
services, une nouvelle entrée appelée Admin apparaît dans la barre de
menu du projet.

Seuls les membres du projets ont accès aux pages d'administration du
projet. Tous les autres utilisateurs s'en verront refuser l'accès.

Menu d'administration du projet
===============================

Sous le menu principal du projet que nous avons présenté lors du passage
en revue de la page de sommaire, figure le menu d'administration du
projet. A l'exception d'un ou deux éléments, ce menu d'administration et
le contenu de la page d'accueil de la section administration ne sont pas
redondants. Ils donnent accès à des fonctions d'administration
distinctes. Dans les sections qui suivent nous préciserons à côté de
chaque fonction d'administration si on y accède par le menu
d'administration ou par la page d'accueil de la section administration.

Ajout/Suppression d'utilisateurs
================================

*Emplacement : contenu de la page d'administration*

L'administration des membres d'un projet est aisée. Selon le nombre
d'utilisateurs à ajouter au projet, vous pouvez utiliser l'une des deux
méthodes ci-dessous :

Ajout d'un utilisateur
----------------------

Pour ajouter un utilisateur aux membres du groupe, un des
administrateurs du projet doit simplement taper le nom de l'utilisateur
invité dans le champ réservé à cet effet et cliquer sur le bouton
"Ajouter un utilisateur". Si vous ne connaissez pas le nom du nouveau
membre à ajouter, ouvrez une nouvelle fenêtre et utilisez la boîte de
recherche par mots-clés en tapant une partie du nom ou du prénom de
l'utilisateur et en n'oubliant pas de préciser que la recherche porte
sur les "Utilisateurs". La liste de résultat fera vraisemblablement
apparaître le nom complet et le nom d'utilisateur de la personne que
vous recherchez.

Import d'une liste d'utilisateurs
---------------------------------

Si le nombre d'utilisateurs à ajouter est important, un des
administrateurs du projet peut importer une liste d'utilisateurs à
partir d'un fichier texte. Pour cela, cliquer sur le lien "Importer une
liste d'utilisateurs". On vous proposera alors de choisir un fichier
texte comportant la liste des utilisateurs à importer. Le fichier doit
comporter un utilisateur par ligne, soit en spécifiant son adresse
email, soit en spécifiant son nom de login SYS\_PRODUCT\_NAME.

::

    johnd
    steve.robinson@examplecompany.com

    bob.johnson@examplecompany.com
    smith3
    john.smith@examplecompany.com

Le processus d'import se déroule alors en deux temps. Une première
vérification du fichier est effectuée, qui donne lieu à un compte-rendu
des utilisateurs détectés. Après validation, les utilisateurs sont
effectivement ajoutés au projet. Le système n'effectuera pas l'import en
cas d'erreur (utilisateur inconnu, non enregistré sur
SYS\_PRODUCT\_NAME, utilisateur non actif, adresse mail inconnue,
etc...). Les doublons ne produisent pas d'erreur. Un seul utilisateur
est ajouté dans ce cas.

Suppression d'utilisateurs
--------------------------

Supprimer un utilisateur des membres du projet est encore plus simple.
Il suffit de cliquer sur l'icône corbeille (|image0|) située à proximité
du nom de l'utilisateur. Supprimer un utilisateur des membres du projet
n'a absolument aucun effet sur l'historique ou l'intégrité des données
du projet. En d'autres termes tous les artefacts des outils de suivi
soumis par ou assignés à cette personne restent présents et inchangés
dans la base de données. Seule la capacité de cette personne à gérer le
projet est affectée. Notez aussi que pour supprimer un administrateur de
la liste des membres du projet, un autre administrateur doit d'abord lui
ôter son statut d'administrateur en positionnant la valeur de la
permission "Admin.Projet" à "Non" dans la table d'édition des
permissions utilisateurs. En d'autres termes, un administrateur de
projet ne peut être supprimé de la liste des membres tant qu'il a le
statut d'administrateur.

    **Note**

    Vous avez probablement remarqué que tous les noms d'utilisateurs
    figurant sur la page d'administration sont en fait des liens
    hypertextes. Sur cette page comme sur beaucoup d'autres, un clic sur
    un nom d'utilisateur vous mène sur une page d'information le
    concernant (y compris son lieu de travail, téléphone, fax, ...
    extraits de l'annuaire d'entreprise) qui vous permet aussi de lui
    envoyer un email par le biais d'un formulaire Web.

|Un exemple de page d'administration d'un projet|

Informations publiques du projet
================================

*Emplacement : Menu d'administration*

L'item "Édition Infos Publiques" du menu d'administration permet à un
administrateur de mettre à jour les éléments de description du projet;
il s'agit d'éléments fournis pendant la phase d'enregistrement du
projet.

Catégorisation du projet
========================

*Emplacement : contenu de la page d'administration*

C'est ici que vous pouvez définir la catégorisation de votre projet.
Vous pouvez définir au plus trois valeurs pour chacun des sept critères
de catégorisation utilisé dans l'arbre des projets. Si vous ne trouvez
pas de valeur correspondant à votre projet, n'hésitez pas à contacter
l'équipe SYS\_PRODUCT\_NAME.

Type de projet
==============

*Emplacement : contenu de la page d'administration*

SYS\_PRODUCT\_NAME propose trois types de projets :

-  **Projet** : C'est le type des projets standards sur
   SYS\_PRODUCT\_NAME.

-  **Patron de projet** : Si vous utilisez ce type de projet, de
   nouveaux projets peuvent réutiliser la configuration des services de
   ce projet. En enrégistrant un nouveau projet (voir ?), votre patron
   de projet est listé comme patron disponible. Quand vous choisissez
   votre projet comme patron le nouveau projet utilisera exactement la
   même configuration. Cela inclut que :

   -  le nouveau projet est classé selon les mêmes critères que le
      projet de patron (voir ?).

   -  Les mêmes services sont activés (voir ?). Les services non
      disponibles ne seront pas présents. Les services désactivés seront
      également désactivés par défaut.

   -  les mêmes références sont définies (voir ?).

   -  les mêmes groupes d'utilisateurs existent (voir ?).

   -  tous les outils de suivi ayant l'option "instancier dans les
      nouveaux projets" sont copiés avec les champs associés, leurs
      valeurs, leurs dépendances ainsi que les rapports de recherche et
      les permissions (voir ?).

   -  les mêmes forums seront créés. Par contre, les messages ne sont
      pas copiés.

   -  les documents, ainsi que l'architecture du gestionnaire de
      document seront présents.

   -  les paramètres d'administration CVS seront copiés (préambule,
      suivi CVS, Mode CVS Watch), mais les adresses emails et les
      permissions CVS ne sont pas copiés.

   -  les paramètres d'administration SVN seront copiés (préambule,
      suivi SVN), mais les adresses emails et les permissions SVN ne
      sont pas copiées.

   -  les paquets et leurs permissions seront copiés.

   Remarquez que les membres du projet de patron ne seront pas
   automatiquement membres du nouveau projet. Un projet de patron
   n'apparaît plus dans l'arbre des projets et est exclu des
   statistiques de projets du tableau de bord de SYS\_PRODUCT\_NAME (see
   ?) comme les projets récents, les projets les plus actifs, etc...

-  **Projet de test** : Si vous voulez juste essayer tout ce qui est
   faisable avec un projet SYS\_PRODUCT\_NAME vous pouvez utiliser le
   type projet de test. En utilisant ce type de projet votre projet
   n'apparaît plus dans l'arbre des projets ni dans les statistiques de
   projets du tableau de bord de SYS\_PRODUCT\_NAME.

Configuration des services
==========================

*Emplacement : Menu d'administration*

L'entrée "Configuration des services" dans le menu d'administration
donne accès à la liste de tous les services activés pour le projet
courant. Les services sont les items qui apparaissent dans la "Barre de
Services", à savoir le menu qui apparaît en haut de chaque page du
projet : outils de suivi, documentation, CVS, Page d'accueil, etc... La
page de configuration des services permet à l'administrateur du projet
de modifier, activer, désactiver ou même créer des services dans la
barre de services.

Il existe deux sortes de services :

-  **Les services système** : ces services sont définis par
   l'administrateur du site et sont communs à tous les projets. Seuls
   leur état (actif/inactif) et leur position à l'écran peuvent être
   modifiés (voir ci-dessous).

-  **Les services projet** : ces services peuvent être modifiés à
   loisir, voire même supprimés par l'administrateur du projet.

La seule exception concerne le service **Site Web**; il s'agit d'un
service système mais il peut être personnalisé pour pointer sur l'URL de
votre choix. Chaque projet hébergé sur SYS\_PRODUCT\_NAME possède son
propre serveur Web virtuel sur le site SYS\_PRODUCT\_NAME. Par défaut le
service "Site Web" de la barre de services pointe sur ce site (voir le ?
pour plus de détails). Vous pouvez remplacer l'URL par défaut avec un
pointeur vers votre propre site Web. Attention à ne pas confondre le
site web de votre projet avec la page de sommaire. Le site web de votre
projet pointe sur un ensemble de pages HTML dont vous êtes l'auteur
alors que la page de sommaire du projet est uniquement un point d'entrée
vers les différents services et délivrables de votre projet.

Créer ou modifier un service
----------------------------

Lors de la création ou de la modification d'un service, vous devez
fournir les informations suivantes :

**Label du service** : Il s'agit du nom du service tel qu'il apparaîtra
dans la barre de services. Il doit être aussi concis que possible.

**Lien vers le service** : il s'agit de l'URL qui mène au service en
question, c'est à dire l'URL vers lequel l'utilisateur est redirigé
lorsqu'il sélectionne ce service dans la barre de service. La page $
sera chargée dans la fenêtre courante.

Quelques mots-clés particuliers peuvent être utilisés dans l'URL; ils
seront automatiquement remplacés par leur valeur avant d'être insérés
dans la barre de service :

-  **$projectname** : le nom court du projet

-  **$sys\_default\_domain** : le nom de domaine du serveur
   SYS\_PRODUCT\_NAME (ici "SYS\_DEFAULT\_DOMAIN")

-  **$group\_id** : l'identifiant du projet

-  **$sys\_default\_protocol** : 'https' si le serveur
   SYS\_PRODUCT\_NAME fonctionne en mode sécurisé, 'http' dans le cas
   contraire.

**Description du service** : Description courte du service. Elle est
affichée dans une bulle de texte lorsque le curseur de la souris se
trouve sur le label du service dans la barre de services.

**Actif** : En cochant cette case, le service est activé c'est à dire
qu'il est utilisable et qu'il apparaît dans la barre de services.
Décocher la case revient à désactiver le service et à le faire
disparaître de la barre de services. Il est à noter que la désactivation
d'un service n'affecte en rien les données de ce dernier. En d'autres
termes, la réactivation d'un service donne accès à l'ensemble des
données telles qu'elles étaient au moment de la désactivation. Voir
aussi la "Suppression d'un service" ci-dessous.

**Rang à l'écran** : ce nombre entier arbitraire permet de définir la
position de ce service relativement aux autres dans la barre de service.
Les services ayant la valeur de rang la plus faible apparaîtra en
premier dans la barre de services (en partant de la gauche). Il est
recommandé d'utiliser des nombres comme 10, 20, 30, ... pour pouvoir
insérer de futurs services sans avoir à renuméroter tous les services
existants.

Suppression d'un service
------------------------

Les services peuvent aussi être détruits si l'icône corbeille figure à
proximité du nom du service. Un clic sur cette icône supprime
définitivement le service de la liste. Les données du service
correspondant sont cependant préservées.

Les services système ne peuvent être détruits. Vous pouvez cependant les
désactiver pour qu'ils n'apparaissent pas dans la barre de services.

Administration des services
===========================

*Emplacement : contenu de la page d'administration*

La page d'administration du projet donne aussi un accès direct à
l'ensemble des modules d'administration de chaque service activés par le
projet. Cet accès est fourni sous la forme d'une liste de liens
hypertextes situés en bas à gauche de la page d'administration. Seuls
les membres du projet ayant les droits d'administration sur les
différents services ont accès à ces modules (voir ?).

Configuration des patrons de référence
======================================

*Emplacement: Menu d'administration*

La page de configuration des patrons de référence liste l'ensemble des
patrons de référence disponibles dans le projet. Elle permet aussi aux
administrateurs du projet de modifier, activer, désactiver, ou créer des
patrons de référence.

Présentation des références
---------------------------

Les patrons de référence sont un outils puissant permettant de créer des
références croisées entre objets de SYS\_PRODUCT\_NAME. En fonction d'un
patron de texte, SYS\_PRODUCT\_NAME peut créer automatiquement un
hyperlien vers l'objet souhaité.

Lorsque vous tapez un commentaire, ou un message de commit, tout morceau
de texte qui suit le patron "XXX #NNN" est interprété comme une
référence à l'objet XXX numéro NNN. Ainsi, 'art #123' sera détecté comme
une référence à l'artefact numéro 123, et SYS\_PRODUCT\_NAME créera
automatiquement un hyperlien qui pointe sur la page décrivant
précisément cet artefact.

Vous pouvez également référencer un objet appartenant à un autre projet.
A cette fin, utilisez soit 'XXX #num\_projet:NNN', soit 'XXX
#nom\_projet:NNN' pour référencer l'objet XXX numéro NNN appartenant au
projet numéro 'num\_projet', ou dont le nom est 'nom\_projet'. Par
exemple, 'wiki #monproj:Accueil' est une référence à la page wiki
'Accueil' du projet 'monproj'.

Certains patrons de référence peuvent nécessiter plusieurs paramètres.
Dans ce cas, utilisez le caractère '/' comme séparateur entre les
paramètres. Par exemple, 'wiki #Accueil/2' crée une référence vers la
page wiki 'Accueil' à la version 2.

Il existe deux types de patrons de référence :

-  **Les patrons de référence système** : ces patrons de référence sont
   définis par l'administrateur du site et sont communs à l'ensemble des
   projets. Ils ne peuvent pas être modifiés, excepté leur statut
   (activé/désactivé).

   La plupart des patrons de référence système sont liés à un service
   spécifique. Ainsi 'art', 'doc', 'file' ou 'wiki' sont liés
   respectivement aux services outils de suivi, gestionnaire de
   documents, gestionnaire de fichiers et Wiki. Afin de faciliter
   l'utilisation de ces patrons de référence, ils sont automatiquement
   activés ou désactivés lorsque le service correspondant est
   activé/désactivé. Cependant, il est toujours possible de les activer
   ou de les désactiver manuellement.

-  **Les patrons de référence projet** : ces patrons de référence
   peuvent être entièrement personnalisés par les administrateurs du
   projet.

Patrons de référence prédéfinis
-------------------------------

Voici la liste des patrons de référence prédéfinis :

-  **art #num ou artifact #num** : référence à l'artefact numéro 'num'.
   C'est un numéro global au système (l'artefact 'num' est unique, et
   n'existe que dans un projet). Cette référence crée un lien vers la
   page de description et de mise à jour de l'artefact. En sus des mots
   clés 'art' et 'artifact', les artefacts peuvent être référencés à
   l'aide du nom court de l'outil de suivi. Ainsi, un artefact issu d'un
   outil de suivi de bugs (anomalies) pourra être référencé par **bug
   #NNN**, une demande de support (support request) par **sr #NNN**, une
   tâche par **task #NNN** et un patch avec **patch #NNN**. Ainsi,
   lorque vous créez un outil de suivi personnalisé, il est important de
   bien choisir son nom court.

-  **commit #num ou cvs #num** : référence au commit CVS numéro 'num'.
   C'est un numéro global au système. Cette référence crée un lien vers
   la page de description du commit, qui contient le message du commit,
   la liste des fichiers modifiés, les liens vers les modifications, ...

-  **rev #num ou revision #num ou svn #num** : référence à la révision
   Subversion numéro 'num'. C'est un numéro propre au projet : si vous
   souhaitez référencer une révision Subversion d'un autre projet, il
   vous faudra spécifier le projet dans la référence (par exemple: 'rev
   #monproj#123'). Cette référence crée un lien vers la page de
   description de la révision, qui contient le message du commit, la
   liste des fichiers modifiés, les liens vers les modifications, ...

-  **wiki #pagewiki et wiki #pagewiki/num** : référence à la page Wiki
   nommée 'pagewiki'. Le second format permet de spécifier la version de
   la page Wiki. Les pages Wiki sont propres à un projet, donc si vous
   devez référencer une page appartenant à un autre projet, il faut
   spécifier le projet dans la référence.

-  **doc #num ou document #num** : référence au document numéro 'num'.
   C'est un numéro global au système. Les numéros de documents sont
   visibles dans la page principale du service 'Documentation' :
   l'identifiant est visible lorsqu'on place la souris sur le titre. La
   référence pointe sur le document lui-même.

-  **news #num** : référence vers l'annonce numéro 'num'. C'est un
   numéro global au système. Cette référence crée un lien vers la page
   d'annonce, où il est possible d'ajouter des commentaires.

-  **forum #num et msg #num** : référence vers le forum numéro 'num' ou
   vers le message de forum numéro 'num'. Ce sont des numéros globaux au
   système. La première référence crée un lien vers la page d'accueil du
   forum, tandis que la deuxième crée un lien vers un message précis.

-  **file #num** : référence vers le fichier numéro 'num'. C'est un
   numéro global au système. Ce type de référence permet de télécharger
   directement un fichier faisant partie d'une version. Les numéros de
   fichiers sont visibles dans la page principale du service 'Fichiers'
   : l'identifiant est visible lorsqu'on place la souris sur le nom du
   fichier. La référence pointe sur le fichier lui-même, et le
   navigateur peut alors vous demander à quel endroit vous voulez le
   sauvegarder. Il se peut aussi que vous deviez accepter la licence du
   projet avant de pouvoir télécharger le fichier.

-  **release #num** : référence vers la version (release) numéro 'num'.
   C'est un numéro global au système. Les numéros de version sont
   visibles dans la page principale du service 'Fichiers' :
   l'identifiant est visible lorsqu'on place la souris sur le nom de la
   version. La référence pointe sur la page d'accueil du gestionnaire de
   fichier, où la version référencée est mise en valeur dans la liste.

Utilisation des références
--------------------------

Lors des phases de développement ou de maintenance d'un projet, il est
essentiel de garder la trace des changements effectués dans le code
source. C'est ce que font les systèmes de gestion de configuration comme
CVS ou Subversion. En complément de ce suivi, il est tout aussi critique
de pouvoir relier ces changements de code aux artefacts (une tâche, une
anomalie ou une demande d'assistance) qui ont amené les développeurs à
modifier le code ou la documentation. Et inversement, à la lecture d'un
artefact il est très utile de voir quels changements il a engendré dans
le code source.

L'intégration de CVS et de Subversion avec SYS\_PRODUCT\_NAME fournit
précisément ce mécanisme de références croisées. Ceci est rendu possible
par l'utilisation des références à utiliser dans les commentaires des
artefacts ou dans les messages de commits que SYS\_PRODUCT\_NAME
reconnaît automatiquement.

Le système n'est pas limité aux références à des commits ou a des
artefact, puisqu'il est également possible de référencer un message
posté dans un forum, une documentation, ou un fichier. Le système est
suffisament flexible pour permettre le référencement d'objets qui ne
sont pas dans SYS\_PRODUCT\_NAME. Il vous suffit de créer vos propres
patrons de référence pour relier vos messages à un gestionnaire de
document externe comme Docushare, ou à un outil de gestion de code
source comme ClearCase.

    **Tip**

    C'est une excellente pratique que de toujours référencer les tâches,
    anomalies, demande d'assistance appropriées dans le message de
    commit CVS ou Subversion. De la même façon, lorsque l'artefact
    correspondant est fermé, assurez-vous de mentionner le commit qui
    résout le problème dans un commentaire. Vous constaterez que cette
    pratique est extrêmement efficace pour suivre l'historique des
    changements et pourquoi un changement a eu lieu.

Création ou modification d'un patron de référence
-------------------------------------------------

Pour créer ou modifier un patron de référence, il faut remplir les
champs suivants :

**Mot-clé** : C'est le mot-clé qui va déclencher la création d'une
référence lorsqu'il est détecté. Il est préférable de le choisir court
et explicite pour favoriser la lecture des références.

**Description** : Courte description du patron de référence. Elle est
affichée lorsqu'on place la souris sur une référence extraite.

**Lien** : C'est l'URL vers lequel pointe la référence. L'utilisateur
sera automatiquement redirigé vers cette adresse s'il clique sur la
référence. L'URL ne pointe pas nécessairement vers le serveur
SYS\_PRODUCT\_NAME : on peut créer des patrons de référence qui pointent
vers des pages externes. La nouvelle page sera chargée dans le fenêtre
courante.

Certaines chaînes de caractères seront interprétées lors de la création
de la référence :

-  **$projname** : nom court du projet.

-  **$group\_id** : numéro du projet.

-  **$0** : le mot-clé extrait par ce patron de référence.

-  **$1** : le premier paramètre de la référence.

-  **$2** : le deuxième paramètre de la référence.

-  **$3...$9** : du troisième au neuvième paramètre de la référence.

Exemples:

-  **artifact #25** : '$0' vaut 'artifact', '$1' vaut '25'

-  **wiki #tuleap:Accueil/1** : '$0' vaut 'wiki', '$1' vaut 'Accueil',
   '$2' vaut '1', '$projname' vaut 'tuleap'

-  **myref #123:1/23/456** : '$0' vaut 'myref', '$1' vaut '1', '$2' vaut
   '23', '$3' vaut '456' et '$group\_id' vaut '123'

-  **google #tuleap/enalean** : '$0' vaut 'google', '$1' vaut 'tuleap',
   '$2' vaut 'enalean'. Si vous avez défini le patron de référence
   'google', avec un lien pointant vers
   **http://www.google.com/search?hl=en&q=$1+$2**, cliquer sur la
   référence 'google #tuleap/enalean' lancera une recherche Google de
   'tuleap enalean'.

-  **ds #123** : '$0' vaut 'ds', '$1' vaut '123'. Si vous avez défini le
   patron de référence 'ds', avec un lien pointant vers
   **http://docushare/dsweb/Get/Document-$1**, cliquer sur la référence
   'ds #123' lancera le téléchargement du document '123' de votre
   serveur Docushare local.

Il faut noter que le nombre de paramètres est important : si le nombre
de paramètres dans le texte ne correspond pas au nombre de paramètres
définis dans le patron de référence, la référence ne sera pas extraite.
Ceci permet de créer plusieurs patrons de référence avec le même
mot-clé, mais un nombre de paramètres différent. Voyez par exemple les
références suivantes : 'wiki #Accueil' est une référence à un seul
paramètre pointant vers la page Wiki 'Accueil', alors que la référence
'wiki #Accueil/2' est une autre référence à deux paramètres pointant
vers la page Wiki 'Accueil' à la version '2'.

**Actif** : En cochant cette case, le patron de référence est activé,
c'est à dire qu'il est utilisable et sera extrait automatiquement.
Décocher la case revient à désactiver le patron de référence. Voir aussi
la "Suppression d'un patron de référence" ci-dessous.

Suppression d'un patron de référence
------------------------------------

Les patrons de référence projet peuvent aussi être détruits. Un clic sur
l'icône corbeille figurant à proximité du nom du patron de référence
supprime définitivement ce dernier. Un patron de référence détruit devra
être recréé pour être à nouveau utilisable.

Les patrons de référence système ne peuvent être détruits. Vous pouvez
cependant les désactiver pour que les références ne soient plus
extraites.

Permissions utilisateurs
========================

*Emplacement : contenu de la page d'administration*

Les administrateurs du projet ont la capacité à définir les permissions
des membres du projets. Un membre de l'équipe de projet peut par exemple
avoir tous les droits d'administration sur l'outil de suivi des
anomalies et aucun droit concernant le gestionnaire de document du
projet.

|Un exemple de table de permissions des membres d'un projet|

La ? montre un exemple de table de permissions des membres d'un projet.
Chaque colonne représente un service ou une capacité de l'utilisateur et
chaque ligne représente les droits d'un des membres du projet. Passons
en revue chacune des colonnes :

-  **Admin Projet** : Un choix Oui/Non permet de définir si un
   utilisateur est un administrateur du projet ou pas. Un administrateur
   a absolument tous les droits sur tous les services, les délivrables
   et les membres du projet. Seuls les administrateurs ont accès à la
   page de définition des permissions des utilisateurs.

-  **Écriture CVS** : actuellement toujours positionné à Oui. Tous les
   membres du projet ont les droits d'accès en écriture sur le dépôt CVS
    [1]_ du projet et cela ne peut être modifié depuis l'interface
   utilisateur de SYS\_PRODUCT\_NAME. Nous verrons cependant comment
   désactiver l'accès en écriture au dépôt CVS dans le chapitre qui lui
   est consacré (?).

-  **Outils de suivi** :

   -  *None* : l'utilisateur a les mêmes droits sur cet outil qu'un
      utilisateur externe au projet.

   -  *Administrateur* : Les administrateurs des outils de suivi (et des
      autres services) ont tous les droits d'administration concernant
      ce service. Par exemple, il leur est possible de définir de
      nouveaux champs ou de nouvelles valeurs pour les champs de cet
      outil de suivi.

-  **Forums, Gestionnaire de documents, Gestionnaires de fichiers** :

   -  *None* : l'utilisateur a les mêmes droits sur cet outil qu'un
      utilisateur externe au projet.

   -  *Modérateur* : (Forums uniquement) : un modérateur a la capacité à
      gérer la section forum du projet, à savoir créer/détruire des
      forums, supprimer des messages indésirables dans un forum et
      changer la configuration d'un forum comme modifier le statut
      (public/privé) ou changer la description.

   -  *Éditeur* : (Gestionnaire de documents uniquement) : Un éditeur
      peut passer en revue et valider un document avant sa publication.
      Il peut aussi mettre à jour ou détruire un document.

   -  *Administrateur* : (Gestionnaire de fichiers uniquement) : un
      administrateur du gestionnaire de fichiers peut gérer les paquets
      et les versions de fichiers. Il peut aussi définir les permissions
      d'accès à ces fichiers pour les différents groupes d'utilisateurs
      existants. Il ne peut cependant pas définir les groupes
      d'utilisateurs. Seuls les administrateurs du projet ont cette
      possibilité.

-  **Membres des groupes d'utilisateurs** : Pour chaque utilisateur
   figure dans cette colonne la liste des groupes d'utilisateurs
   auxquels il appartient. Voir ? pour plus d'information sur les
   groupes d'utilisateurs.

    **Important**

    N'oubliez pas de cliquer sur le bouton "Mettre à jour les
    permissions" en bas de page après avoir effectué des modifications
    dans la table des permissions.

Groupes d'utilisateurs
======================

*Emplacement : Menu d'administration*

Un groupe d'utilisateurs, aussi appelé "ugroup", est tout simplement un
regroupement d'utilisateurs SYS\_PRODUCT\_NAME. Les groupes
d'utilisateurs sont utilisés dans le but de définir des permissions
spécifiques sur certaines données du projet (certains paquets ou
versions de fichiers par exemple - voir ?). Un groupe d'utilisateurs est
toujours attaché à un projet en particulier, mais les utilisateurs d'un
groupe ne doivent pas nécessairement être membres de ce projet.

Gestion des groupes d'utilisateurs
----------------------------------

La fonction d'"Administration des groupes d'utilisateurs" donne accès à
la liste de tous les groupes d'utilisateurs définis pour ce projet et
permet d'en créer de nouveaux.

|Page de gestion des groupes d'utilisateurs|

Dans la liste figure deux types de groupes (voir par exemple ?) :

**Les groupes d'utilisateurs prédéfinis** : Ces groupes sont
automatiquement définis pour chaque projet. Il s'agit par exemple de :
**membres\_projet, admins\_projet, utilisateurs\_enregistres, personne,
admins\_gestionnaire\_fichier**, etc... Ces groupes sont dynamiques
c'est à dire que SYS\_PRODUCT\_NAME maintient la liste des membres de ce
groupe pour vous. Ainsi si un nouveau membre du projet se voit accorder
les droits d'administrateur, il sera automatiquement ajouté au groupe
'admins\_projet' et disposera des mêmes permissions que celles déjà
accordées à ce groupe.

**Les groupes d'utilisateurs personnalisés** sont définis par les
administrateurs du projet. Ils sont composés d'une liste statique
d'utilisateurs qui doivent tous être des utilisateurs enregistrés de
SYS\_PRODUCT\_NAME. Cette liste peut être modifiée à tout moment par
l'administrateur. Elle n'est pas modifiée automatiquement sauf si un
utilisateur est supprimé de la liste des membres du projet ou si son
compte SYS\_PRODUCT\_NAME est supprimé.

Créer un groupe d'utilisateurs
------------------------------

Lors de la création d'un groupe d'utilisateurs, les informations
suivantes doivent être fournies :

**Nom** : Il s'agit du nom du groupe tel qu'il apparaîtra dans les
écrans de définition des permissions. Le nom ne peut contenir ni espace,
ni ponctuation.

**Description** : une description courte du groupe d'utilisateurs. Elle
est uniquement utilisée dans les écrans d'administration des groupes
d'utilisateurs.

**Créer à partir de** : c'est un moyen de présélection rapide des
membres du groupe : vous pouvez créer un groupe à partir de rien (Groupe
vide) ou bien en partant de la liste des membres du projet ou des
administrateurs du projet. Les membres de ces groupes seront alors
automatiquement insérés dans le nouveau groupe. Dans l'étape suivante
vous pourrez ajouter ou supprimer des utilisateurs à ce groupe.

|Édition d'un groupe d'utilisateur|

Sur l'écran suivant (voir ?), l'administrateur du projet peut
sélectionner les membres du groupe nouvellement créé.

Deux colonnes sont visibles : celle de gauche contient la liste de tous
les utilisateurs enregistrés sur le site et celle de droite présente la
liste des utilisateurs déjà admis dans le groupe. Vous devez utiliser
les flèches situées entre les deux colonnes pour supprimer ou intégrer
de nouveaux utilisateurs dans ce groupe.

L'interface utilisateur offre aussi plusieurs façons très pratiques de
sélectionner certains utilisateurs lorsque la liste des utilisateurs
enregistrés est très longue. Vous pouvez, par exemple, choisir
d'afficher uniquement les utilisateurs dont le nom commence par une
certaine lettre de l'alphabet ou vous pouvez aussi filtrer en tapant une
partie du nom de l'utilisateur dans la boîte de texte 'Filtre'. Par
exemple, si vous tapez 'jean', seuls les utilisateurs dont le nom
complet ou le nom d'utilisateur comporte cette chaîne de caractères
seront affichés.

Une fois la sélection des utilisateurs terminée, il ne vous reste plus
qu'à cliquer sur le bouton Valider pour créer le groupe d'utilisateurs.

    **Tip**

    Il se peut que vous souhaitiez accorder certaines permissions à tous
    les membres du projet plus quelques utilisateurs externes. Dans ce
    cas, il peut vous paraître tentant de créer un nouveau groupe à
    partir du groupe membres\_projet et d'y ajouter les quelques
    utilisateurs externes manquants. Cette solution est tout à fait
    acceptable mais elle présente l'inconvénient de ne pas mettre à jour
    automatiquement le groupe lorsque de nouveaux utilisateurs quittent
    ou rejoignent les membres du projet. Dans ce cas vous devrez
    effectuer les mêmes opérations manuellement pour le groupe défini.
    Il est donc préférable de créer un groupe qui ne contient que les
    utilisateurs externes et de lui accorder les mêmes permissions qu'au
    groupe dynamique 'membres\_projet'.

Modifier un groupe d'utilisateurs
---------------------------------

Pour mettre à jour un groupe d'utilisateurs existant, il suffit de le
sélectionner dans la liste des groupes d'utilisateurs. Un écran
semblable à l'écran de création apparaît alors qui vous permet de
modifier la composition de ce groupe d'utilisateurs.

Supprimer un groupe d'utilisateurs
----------------------------------

Les groupes d'utilisateurs peuvent aisément être supprimés en cliquant
sur l'icône corbeille situé en regard du nom du groupe sur la page
d'administration des groupes (voir ?). Seuls les groupes d'utilisateurs
personnalisés peuvent être supprimés.

    **Important**

    Veuillez noter que la suppression d'un groupe d'utilisateurs
    impliqué dans la définition de certaines permissions est une action
    dangereuse. Par exemple, si ce groupe sert à limiter l'accès à un
    paquet logiciel, la suppression du groupe entraînera la suppression
    du contrôle d'accès et son retour au comportement par défaut, c'est
    à dire un accès à tous les utilisateurs.

Informations complémentaires sur les groupes d'utilisateurs
-----------------------------------------------------------

Il est possible de connaître l'ensemble des groupes auquel appartient un
membre du projet en accédant à la page de définition des permissions des
membres (?). Veuillez noter cependant que seuls sont affichés les
groupes définis pour le projet courant. L'utilisateur peut effectivement
appartenir à d'autres groupes d'utilisateurs dans d'autre projets.

En bas de la page de modification d'un groupe d'utilisateurs (?) figure
aussi la liste de toutes les permissions dans lesquelles ce groupe est
impliqué au niveau des différents services (par exemple l'accès aux
paquets et versions des logiciels).

Lorsqu'un utilisateur quitte les membres du projet, il est
automatiquement supprimé de tous les groupes d'utilisateurs pour des
raisons de sécurité.

De la même façon lorsqu'un compte utilisateur est supprimé par les
administrateurs du site, il est automatiquement supprimé de tous les
groupes dont il est membre quel que soit le projet.

Exportation des données du projet
=================================

*Emplacement : Menu d'administration*

SYS\_PRODUCT\_NAME est particulièrement attractif pour de nombreuses
équipes de projet car il offre une série d'outils complets pour le
développement et la gestion de projet. Un projet peut-être géré
quasiment intégralement depuis SYS\_PRODUCT\_NAME. Cependant il se peut
que l'équipe ressente le besoin d'effectuer certaines opérations sur les
données du projet en dehors de SYS\_PRODUCT\_NAME comme par exemple
rédiger un rapport sur l'état d'avancement du projet, ce qui se passe
bien ou moins bien, actualiser la date de livraison prévue, dériver des
données statistiques, etc...

Il n'est pas du ressort de SYS\_PRODUCT\_NAME de fournir ces outils de
reporting sophistiqués. Il existe de nombreux outils spécialisés sur le
marché capable de générer des rapports d'activité et chaque équipe
possède son outil préféré. Dans le but de satisfaire la grande diversité
de ces besoins, SYS\_PRODUCT\_NAME offre un mécanisme très efficace qui
permet d'exporter les données hors du projet pour les utiliser dans des
outils comme MS Access, MS Excel, Crystal Report, Open Office ou tout
autre outil adapté.

SYS\_PRODUCT\_NAME offre 2 mécanismes d'exportation des données :

-  **Exportation au format texte** : ce mécanisme permet d'exporter les
   données au format CSV (Comma Separated Value), un format reconnu par
   quasiment tous les outils de bureautique ou les bases de données du
   marché. Si vous souhaitez développer votre propre application de
   reporting, la plupart des langages de programmation propose une
   librairie standard capable de manipuler le format CSV.

-  **Accès direct à la base de données** : à proprement parlé il ne
   s'agit pas d'exportation de données. Ce mécanisme permet en fait de
   se connecter directement à la base de données de vote projet via un
   pilote ODBC ou JDBC. Si vous souhaitez manipuler les données de votre
   projet avec un outil de base de données (comme MS Access ou une
   application ODBC/JDBC) c'est sans aucun doute le mécanisme
   d'exportation à utiliser.

Données exportées
-----------------

SYS\_PRODUCT\_NAME exporte les données suivantes (le détail des champs
exportés et de leur format est disponible sur la page
SYS\_PRODUCT\_NAME) :

-  **Outil de suivi** : toutes les données des artefacts, l'historique
   de leurs modifications et leurs dépendances peuvent être exportés
   pour chaque outil de suivi.

-  **Réponses aux enquêtes** : toutes les réponses à toutes les enquêtes
   menées par votre projet sont exportables.

Exportation au format texte
---------------------------

L'exportation au format texte suit le format CSV bien connu de toutes
les suites bureautiques du marché. Il peut être très facilement importé
dans MS Access, MS Excel, Open Calc,…

Chargement d'un fichier CSV dans Excel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Un clic sur un des liens d'exportation des données de la page
d'exportation génère et télécharge à la volée un fichier CSV que vous
pouvez sauvegarder sur votre ordinateur ou ouvrir directement dans Excel
ou tout autre tableur de votre choix. Aucune configuration particulière
n'est nécessaire dans la plupart des cas. Néanmoins, vous avez la
possibilité de changer le séparateur CSV ainsi que le format de date
(voir ?) si le séparateur par défaut ne correspond pas au séparateur par
défaut de votre version d'Excel  [2]_.

Chargement de fichiers CSV dans MS-Access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Avant de pouvoir importer les données dans MS Access, vous devez d'abord
créer une nouvelle base de données. Exécutez ensuite les étapes
suivantes :

-  Sélectionnez
   ``Menu Fichier -> Accès aux données externes -> Importer``

-  Choisissez le fichier CSV que vous venez juste de sauvegarder puis
   cliquez sur le bouton ``Importer...``. Une prévisualisation de la
   table importée vous est présentée pour validation.

-  Cliquez sur le bouton ``Avancé...``

-  Positionnez le délimiteur de texte à " (un guillemet)

-  Positionnez le format de date à ``AMJ``

-  Positionnez le délimiteur de date à - (tiret)

-  Ensuite saisissez le nom et le type de chaque champ dans la partie
   inférieure de la boîte de dialogue. Souvenez-vous que ces
   informations sont disponibles sur la page d'exportation des données
   de SYS\_PRODUCT\_NAME.

       **Note**

       **Remarque importante** : vous pouvez conserver les noms des
       champs par défaut (Champ1,....ChampN) ainsi que les types par
       défaut proposés par MS Access. La seule exception concerne les
       champs texte longs comme les champs commentaires ou la
       description originale d'un artefact dont le type doit être Memo.
       Si vous ne spécifiez pas ce type spécifique, MS Access va
       corrompre les données importées.

       Si vous rencontrez des difficultés à l'importation du fichier
       CSV, veuillez consulter la ?.

Après avoir spécifié les paramètres de l'importation, vous pouvez les
enregistrer en cliquant sur le bouton ``Sauvegarder sous...``. Pour de
futures importations sur la même table, cliquez simplement sur le bouton
Specs... et rechargez vos paramètres d'importation.

Accès direct à la base de données
---------------------------------

Dans le but d'offrir une flexibilité maximale SYS\_PRODUCT\_NAME offre
aussi un accès direct aux données du projet via un connexion ODBC ou
JDBC. Une fois installé sur votre PC, le pilote ODBC (ou JDBC) de MySQL
permet un accès transparent aux tables de votre base de données
spécifiques.

Si vous utilisez MS Access pour générer vos rapports d'activité, l'accès
direct à la base de données est le moyen le plus simple et le plus
rapide d'exploiter vos données.

Générer la base de données du projet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Avant toute tentative d'accès aux données de votre projet via ODBC ou
JDBC vous devez d'abord générer la base de données du projet. Pour ce
faire, rendez vous sur la page d'exportation des données et cliquez sur
le lien 'Générer la base de données du projet' au bas de la page. Vous
devrez aussi cliquer sur ce lien à chaque fois que vous voulez
actualiser les données de votre projet.

Si tout se passe comme prévu, la base de données de votre projet sera
alors générée en temps réel et un message vous informera de la fin du
processus en vous rappelant la valeur des paramètres à utiliser pour
vous connecter depuis votre ordinateur. Conservez-les soigneusement.

    **Note**

    **Remarque** : si la base de données de votre projet contient
    plusieurs milliers d'enregistrements (tâches, bugs…), le processus
    de génération de la base de données peut prendre plusieurs minutes.

Installer et configurer le pilote ODBC de MySQL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Chargez tout d'abord le `pilote ODBC de
MySQL <http://www.mysql.com/downloads/api-myodbc.html>`__ et
décompressez l'archive dans un répertoire temporaire de votre choix.

Lancez l'exécution du programme setup et parcourez les étapes du
processus d'installation.\ **Remarque importante** : sur Windows vous
devez être administrateur pour pouvoir installer le pilote.

Ajouter votre base de données dans les Source de Données Windows. Pour
les utilisateurs de Windows :

-  Utilisez votre login Windows habituel.

-  Cliquez sur ``menu Démarrer ->
           Configuration -> Panneau de Configuration -> Outils
           d'administration -> Sources de données
           (ODBC).``

-  Sélectionnez l'onglet "DSN Utilisateur" et cliquez sur le bouton
   "Ajouter".

-  Sélectionnez l'item "MySQL" dans la liste puis cliquez sur le bouton
   "Terminer".

-  Une boîte de dialogue apparaît vous demandant les paramètres de
   connexion suivants :

   -  *Windows DSN Name* : c'est le nom de votre choix pour cette
      connexion. Vous pouvez indiquer quelque chose comme "Base de
      données du projet X" par exemple.

   -  *MySQL Host(IP ou nom)* : SYS\_DEFAULT\_DOMAIN.

   -  *MySQL Database Name* : le nom de la bases de données correspond
      au nom court de votre projet préfixé par 'cx\_'. Il vous a été
      donné à la fin du processus de génération de votre base (voir plus
      haut).

   -  *User* : le nom d'utilisateur est 'cxuser'.

   -  *Password* : pas de mot passe (laissez le champ vide).

   -  *Port (if not 3306)* : utilisez le port par défaut (ou laissez le
      champ vide).

   -  *SQL command on connect* : aucune (laissez le champ vide).

Installer et configurer le pilote JDBC de MySQL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour ceux d'entre vous qui utilisent une application Java basée sur un
driver JDBC, les instructions d'installation du pilote JDBC de MySQL
sont disponibles sur la page `MySQL Java
Connectivity <http://www.mysql.com/doc/en/Java.html>`__ page.

Utiliser les données du projet depuis MS-Access
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Avant d'utiliser MS-Access pour vous connecter à la base de données de
votre projet, assurez-vous que le pilote ODBC de MySQL est correctement
installé sur votre ordinateur (voir ?) et que vous avez généré la base
de données elle-même (voir ?). Ensuite exécutez les étapes suivantes :

-  Lancez MS Access et ouvrez une nouvelle base de données.

-  Dans le menu ``Fichier`` sélectionnez
   ``Données externes -> Importer``.

-  Dans la boîte de sélection ``Types de
           fichier`` sélectionnez l'entrée ``Bases de
           données ODBC``.

-  Sélectionnez l'onglet ``Source de données machine`` et cliquez sur la
   base de données de votre projet.

-  Sélectionnez les tables qui vous intéressent ou bien l'ensemble des
   tables en cliquant sur ``Tout
           sélectionner``.

MS-Access importe instantanément (à la vitesse de MS-Access :-)) les
données de votre projet et vous pouvez désormais exploiter vos données
comme vous le feriez pour une base de données native MS Access.

Importation d'artefacts dans les outils de suivi
================================================

*Emplacement : contenu de la page d'administration*

Reportez vous à la ?.

Historique du projet
====================

*Emplacement : Menu d'administration*

L'historique du projet fournit une fonction d'audit aux membres du
projet. Un clic sur cet item montre une liste de l'ensemble des
changements opérés dans le module d'administration du projet depuis sa
création. La liste décrit la nature du changement intervenu
(modification des infos publiques, modification des permissions, ...),
la valeur de l'information avant le changement, l'auteur et la date de
la modification.

Journal des accès
=================

*Emplacement : Menu d'administration*

Selon la configuration du site SYS\_PRODUCT\_NAME et la configuration de
chaque projet, différentes populations d'utilisateurs sont susceptibles
d'avoir accès au téléchargement de document, de code source et de
fichiers.

Le journal d'accès fournit aux membres du projet un audit complet des
accès à ces ressources. La page du journal d'accès comprend les
informations suivantes :

-  Les fichiers ont été téléchargés par qui et à quelle date. L'heure de
   téléchargement est indiquée en temps local pour l'utilisateur qui les
   a téléchargés.

-  La liste des opérations de checkout ou d'update sur le dépôt CVS
   ainsi que la liste des personnes ayant navigué dans l'arbre CVS via
   l'interface Web de SYS\_PRODUCT\_NAME.

-  Quels utilisateurs ont accédé au dépôt Subversion soit via un client
   Subversion soit via l'interface Web de SYS\_PRODUCT\_NAME.

-  Quels utilisateurs ont téléchargé des documents du gestionnaire de
   documentation du projet hormis ceux qui sont accessibles aux
   utilisateurs anonymes.

L'affichage du journal d'accès peut être filtré pour présenter soit
l'accès de tous les utilisateurs, soit ceux des membres du projet ou
encore ceux des non-membres (défaut). La fenêtre de temps peut aussi
être ajustée pour montrer une portion plus ou moins grande de
l'historique.

|Exemple de journal d'accès|

.. [1]
   CVS signifie Concurrent Version System. C'est l'un des systèmes de
   contrôle de version offert par SYS\_PRODUCT\_NAME. CVS est utilisé
   par des centaines de milliers de projets à travers le monde. Voir
   http://www.cvshome.org pour plus d'information.

.. [2]
   Par exemple, le séparateur par défaut de la version française d'Excel
   est le point-virgule au lieu de la virgule.

.. |image0| image:: ../../icons/trash.png
.. |Un exemple de page d'administration d'un projet| image:: ../../screenshots/fr_FR/sc_projectadminpage.png
.. |Un exemple de table de permissions des membres d'un projet| image:: ../../screenshots/fr_FR/sc_userpermissions.png
.. |Page de gestion des groupes d'utilisateurs| image:: ../../screenshots/fr_FR/sc_usergrouplist.png
.. |Édition d'un groupe d'utilisateur| image:: ../../screenshots/fr_FR/sc_usergroupedit.png
.. |Exemple de journal d'accès| image:: ../../screenshots/fr_FR/sc_sourcecodeaccesslogs.png
