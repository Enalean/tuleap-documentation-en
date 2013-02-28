.. contents::
   :depth: 3
..

Intégration Continue avec Hudson/Jenkins
========================================

Introduction à l'intégration continue
=====================================

L'intégration continue est un ensemble de bonnes pratiques utilisées en
génie logiciel. Ces bonnes pratiques visent à vérifier qu'une
modification de code source n'entraîne pas de régression de
l'application en cours de développement. Cette vérification est en
générale effectuée sur une autre machine que votre machine de
développement (serveur d'intégration); et cette vérification est
effectuée assez fréquement  [1]_, d'où le nom d'Intégration Continue.

L'outil qui va se charger d'effectuer cette vérification est un outil
d'intégration continue tel que CruiseControl ou Hudson. Cette étape de
vérification est appelée **Build**. Un build pourra correspondre, selon
votre projet, en une succession d'étapes, comme par exemple :

-  La compilation,

-  La génération de la documentation (javadoc par exemple),

-  L'exécution des tests unitaires,

-  Une analyse de qualimétrie sur le code source (respect des
   conventions de codage, pourcentage de commentaires, métriques sur le
   code, ...),

-  La génération d'un exécutable.

L'outil d'intégration continue n'effectue pas lui-même le build, mais le
lance à intervalle régulier, affiche le résultat du build, et est en
général capable de notifier les membres du projet si une modification a
engendré une quelconque régression.

Cette technique de développement, initiée au départ par la communauté de
l'Extreme Programming et adoptée par les méthodes Agiles apporte un
certain nombre d'avantages. Parmis ceux-ci, nous pouvons citer :

-  Les tests sont immédiatement exécutés après chaque modification
   (étape souvent négligée par les développeurs),

-  Les problèmes d'intégration sont détectés en continue, permettant de
   les réparer au plus vite,

-  Il existe toujours une version des livrables opérationnelle et
   disponible pour test, démonstration ou distribution.

Nous avons choisi d'intégrer à SYS\_PRODUCT\_NAME l'outil d'intégration
continue **Hudson/Jenkins**, qui est l'un des meilleurs outils
actuellement. Jenkins est un fork d'Hudson. Ainsi dans ce chapitre nous
employerons le nom d'Hudson pour les 2 outils. Le paramétrage d'Hudson
se réalise de manière assez simple dans une interface web et bénéficie
d'une aide contextuelle en ligne très appréciable.

L'intégration continue, ainsi que l'outil Hudson, possède un certains
nombre de termes spécifiques. En voici la définition :

+------------------+----------------------------------------------------------+
| Terme            | Définition                                               |
+==================+==========================================================+
| **Job**          | La notion de Job Hudson peut être mise en correspondance |
|                  | avec la notion de projet. C'est le Job qui va exécuter   |
|                  | le build. Mais il ne fait pas que cela. En effet, le Job |
|                  | va mettre en place l'environnement nécessaire à          |
|                  | l'exécution du Build (mise à jour du code source),       |
|                  | éxécuter le build, puis effectuer un certain nombre      |
|                  | d'opération après celui-ci (comme publier la             |
|                  | documentation générée, publier le résultats des tests,   |
|                  | notifier du résultats du build, ...)                     |
+------------------+----------------------------------------------------------+
| **Build**        | Littéralement "contruction" de votre projet logiciel.    |
|                  | Processus constitué de plusieurs étapes exécutées        |
|                  | périodiquement sur un serveur d'intégration continue.    |
+------------------+----------------------------------------------------------+
| **Artéfact**     | Item généré lors du build, et mis à disposition par      |
|                  | l'outil d'intégration continue. Attention à ne pas       |
|                  | confondre un artefact d'un build et un artefact          |
|                  | SYS\_PRODUCT\_NAME (qui est un item suivi dans l'outil   |
|                  | de suivi).                                               |
+------------------+----------------------------------------------------------+
| **Espace de      | Répertoire dans lequel le projet va être dépoyé pour     |
| travail          | pouvoir y effectuer le build, et éventuellement y        |
| (workspace)**    | construire les artéfacts.                                |
+------------------+----------------------------------------------------------+
| **Statut (du     | Etat du build. Peut prendre diverses valeurs selon       |
| build)**         | l'outil. Hudson propose 4 états :                        |
|                  |                                                          |
|                  | -  Succès : tout s'est bien passé, aucun test n'est en   |
|                  |    échec,                                                |
|                  |                                                          |
|                  | -  Instable : le build s'est achevé, mais il est         |
|                  |    instable (des tests sont en échecs par exemple),      |
|                  |                                                          |
|                  | -  Echec : le build est en échec                         |
|                  |                                                          |
|                  | -  Inactif : aucun build n'a encore été lancé ou le      |
|                  |    build est désactivé.                                  |
|                  |                                                          |
                                                                             
+------------------+----------------------------------------------------------+
| **Tendance (des  | Tendance du résultat des builds basé sur les 5 derniers  |
| builds)**        | builds. Cette tendance est représentée par une image     |
|                  | empruntée à la météo (soleil, orage, etc) pour signifier |
|                  | que la tendance est au beau fixe ou pas.                 |
+------------------+----------------------------------------------------------+

Table: Glossaire des termes spécifiques à l'I.C. et à Hudson

Installation de Hudson
======================

Pour installer Hudson, vous devez disposer d'une JVM sur le serveur
d'intégration continue (version 1.5 ou supérieure nécessaire). Nous
privilégierons l'installation d'Hudson dans un serveur d'application
comme Tomcat. Installez Tomcat Télécharger le fichier war Hudson
(hudson.war) à l'adresse https://hudson.dev.java.net/ Définir la
variable d'environnement HOME\_HUDSON si vous souhaitez spécifier le
répertoire d'installation d'Hudson Déployer la war Hudson dans le
manager de Tomcat. Ca y est ! Hudson est installé. Par défaut, vous
pouvez y accèder à l'adresse : http://localhost:8080/hudson

Configuration de Hudson
=======================

Avant de créer vos propres Jobs (voir ?), il faut configurer Hudson.
Toutes les étapes sont facultatives. Ne configurez que ce dont vous avez
besoin.

Configuration système
---------------------

Pour configurer Hudson, cliquez sur le lien "Administrer Hudson" dans le
menu en haut à gauche de l'interface principale d'Hudson, puis sur le
lien "Configurer le système".

Toutes les étapes de configuration disposent d'une aide contextuelle.
Pour avoir des détails concernant une option, cliquez sur le point
d'interrogation correspondant.

Outils externes
~~~~~~~~~~~~~~~

Pour pouvoir exécuter les builds de vos projets, Hudson doit connaître
les chemins des outils nécessaires à l'exécution des builds.

Vous pouvez spécifier ici les chemins vers les outils externes dont vous
pouvez avoir besoin. Par défaut, les outils proposés sont JDK, Shell,
Ant, Maven et CVS. Si vous installez des plugins (voir ?) qui font appel
à des outils externes, vous aurez la possiblité de les configurer dans
cette section. Notons que vous pouvez définir plusieurs instances du
même outil (plusieurs version de JDK par exemple).

Authentification
~~~~~~~~~~~~~~~~

Par défaut, Hudson est accessible par tout le monde. Tout le monde peut
voir les jobs, parcourir le résultats des builds, et lancer de nouveaux
builds via l'interface web.

Vous pouvez néanmoins restreindre ces droits. Pour cela, il faut cocher
la case "activer la sécurité" (toujours dans le menu "Administrer
Hudson" -> "Configurer le système"). Vous avez alors plusieurs options :

-  **Déléguer au conteneur de servlets :** dans notre cas, il s'agit de
   Tomcat. Le fichier de définition des droits utilisateurs est le
   fichier *<tomcat>/conf/tomcat-users.xml*. Reportez-vous à la
   documentation de votre conteneur pour plus de précisions.

-  **LDAP :** si vous disposez d'un annuaire LDAP, il vous suffit de
   spécifier l'adresse du serveur, et les utilisateurs seront
   automatiquement reconnus.

-  **Base de données des utilisateurs de Hudson :** Hudson peut gérer
   lui-même la base de données des utilisateurs. Dans ce cas, vous
   devrez soit les créer vous-même, soit autoriser les utilisateurs à
   s'enregistrer.

Le choix d'activer ou non la sécurité dépendra de la politique interne
de votre entreprise, de la spécificité de vos projets, et de la taille
de vos équipes.

Notification par Email
~~~~~~~~~~~~~~~~~~~~~~

Hudson peut envoyer des notifications pour vous avertir du résultat du
build. Ceci est bien entendu paramétrable pour chaque job. Pour
permettre la notification, vous devez indiquer un serveur de messagerie
(serveur SMTP). Laissez le champ vide si vous souhaitez utiliser le
serveur de messagerie par défault (localhost).

Vous pouvez également spécifier le suffixe par défaut des emails des
utilisateurs. Par défaut, tous les utilisateurs SYS\_PRODUCT\_NAME ont
une adresse email du type **login@SYS\_DEFAULT\_DOMAIN** qui sera
redirigée vers l'adresse réelle de l'utilisateur. Vous pouvez donc
renseigner dans ce champ la valeur **@SYS\_DEFAULT\_DOMAIN** et les
emails seront alors automatiquement envoyées aux bons utilisateurs.

Vous pouvez spécifier l'adresse email de l'administrateur système. Il
s'agit de l'utilisateur qui va envoyer les emails aux responsables du
projet et/ou aux personnes qui ont cassé un build.

Vous devrez finalement préciser l'URL de votre serveur Hudson, afin que
les URL dans les mails envoyés par Hudsons soient corrects.

Notification Jabber
~~~~~~~~~~~~~~~~~~~

Si vous avez installé le plugin Jabber pour hudson (voir ?), vous
trouverez également dans la section "Administrer Hudson" -> "Configurer
le système" une partie dédiée aux notifications Jabber. Si le plugin
Jabber pour SYS\_PRODUCT\_NAME est installé et activé, chaque
utilisateur dispose d'un compte Jabber (Voir ?) et chaque projet dispose
d'un salon de discussion. Le plugin Jabber pour Hudson vous permet alors
de notifier les utilisateurs (ou les salons) des résultats des builds.
Il est également possible de lancer certaines action par message Jabber.

Pour utiliser la notification Jabber, veuillez renseigner le champ
serveur (par défaut SYS\_DEFAULT\_DOMAIN) ainsi que le JabberID de
l'auteur des notifications.

Plugins Hudson
--------------

Il existe de nombreux plugins pour étendre Hudson. Parmis ceux-ci, nous
pouvons citer : checkstyle, CI game, Crap4J, LDAP Email, MSBuild, NAnt,
NUnit, Selenium, etc. Vous trouverez une liste détaillée des plugins à
l'adresse http://hudson.gotdns.com/wiki/display/HUDSON/Plugins

La liste des plugins disponibles se trouve dans le menu "Administrer
Hudson" -> "Gestion des plugins". La liste des plugins est mise à jour
dynamiquement. Si votre serveur d'intégration continue est situé
derrière un proxy, il vous faudra alors spécifier l'adresse de celui-ci
dans l'onglet "Avancé".

Pour installer un plugin, cochez la case en face du plugin souhaité dans
la liste des plugins disponibles, puis cliquez sur Installer, et suivez
les instructions.

Création et configuration de Jobs Hudson
========================================

Une fois le système configuré, vous pouvez définir vos Jobs. Pour ceci,
cliquez sur le lien "Nouveau job" dans le menu en haut à gauche. Il vous
suffit ensuite d'entrer le nom du job (le nom de votre projet logiciel
par exemple), et de choisir son type. Différents types de job sont
proposés. Le type le plus courant est le projet "free-style", que nous
allons prendre comme exemple. Il existe aussi un type de projet Maven2,
si vous utilisez déjà cet outil de build.

Cliquez sur le bouton Ok pour valider la création de votre job. Vous
verez alors apparaître un autre écran de définition du job. Vous pouvez
par exemple rajouter une description. Vous pourrez ensuite définir le
dépôt de code source, et la manière dont Hudson va gérer les mises à
jour de code source, définir les différentes étapes du build, et
finalement préciser à Hudson ce que vous souhaitez faire après le build.

CVS et Subversion
-----------------

Par défaut, Hudson propose les deux même gestionnaire de code source que
SYS\_PRODUCT\_NAME : CVS et Subversion. Sélectionnez le gestionnaire que
vous utilisez pour votre projet, puis entrez les informations concernant
les chemins vers le dépôt de votre projet.

CVS
~~~

Pour CVS, vous devez renseigner le CVSROOT de votre projet. Le format
attendu est **:protocol:user@host:path**

Vous pouvez trouver le détail de cette chaîne en cliquant sur l'onglet
CVS de votre projet. Typiquement, il s'agit de
**:pserver:[username]@[projectname].SYS\_DEFAULT\_DOMAIN:/cvsroot/[projectname]**

Vous pouvez également préciser un ou plusieurs modules, une branche.

Subversion
~~~~~~~~~~

Pour Subversion, vous devez aussi renseigner l'URL du dépôt SVN. Cette
information est disponible sur l'interface web de SYS\_PRODUCT\_NAME en
cliquant sur l'onglet SVN de votre projet. Il s'agit d'une chaîne de
type **http://SYS\_DEFAULT\_DOMAIN/svnroot/[projectname]**

Hudson vous demandera d'entrer une authentification Subversion afin de
pouvoir accéder au dépôt de code. Vous avez plusieurs options pour gérer
cette authentification (entrer directement vos login/mot de passe,
utiliser l'authentification par clé publique SSH ou utiliser un
certificat HTTPS client). Nous vous laissons le soin de choisir celle
qui vous correspond le mieux.

Vous pouvez ajouter plusieurs dépôts subversion en cliquant sur le
bouton "Ajoutez d'autres emplacements".

Enfin, si vous souhaitez permettre à vos utilisateurs de naviguer dans
la base de code source via l'interface d'Hudson, vous devez sélectionner
"ViewSVN" dans le champ Navigateur de la base de code, puis entrer la
chaîne suivante :
**http://SYS\_DEFAULT\_DOMAIN/svn/viewvc.php?roottype=svn&root=[le\_nom\_court\_de\_votre\_projet]**

Déclenchement des builds
------------------------

Comme nous l'expliquions en introduction, l'intérêt de l'intégration
continue réside dans le fait que, une fois paramétré correctement, le
build est réalisé en continu, sans plus vous en soucier. Il reste
cependant à définir la manière dont les builds vont être lancés. Deux
options principales s'offrent à vous :

-  **Scruter l'outil de gestion de version** : demande à Hudson de
   scruter les changements dans l'outil de gestion de version. Vous
   pouvez définir la fréquence suivant la syntaxe cron (voir aide Hudson
   en ligne). Notez toutefois que cette opération est consommatrice de
   ressources pour le serveur SYS\_PRODUCT\_NAME. Envisagez d'utiliser
   la méthode de type 'push' pour éviter cette surcharge (voir
   ci-dessous).

-  **Déclencher les builds à distance** : cette méthode de type 'push'
   évite la surcharge du serveur. Le build est déclenché par une URL.
   Pour éviter que n'importe qui déclenche le build, vous pouvez
   spécifier un jeton (token) qui servira de protection. Pour que le
   build soit effectivement déclenché après chaque modification de code
   source, il faudra le paramétrer dans SYS\_PRODUCT\_NAME dans l'onglet
   'Build' de votre projet (Voir ?). Vous pourrez également spécifier le
   jeton si vous en avez défini un.

Définition du build (Etapes)
----------------------------

Il vous faut maintenant définir ce que va réellement faire le build
(compiler votre projet, générer la documentation, exécuter les tests
unitaires, etc.). Pour cela, vous pouvez ajouter autant d'étapes que
nécessaire. Par défaut (sans autre plugin), Hudson propose 4 types
d'étapes possibles :

-  **Exécuter un script shell** : vous permet d'entrer directement un
   script shell dans le champ texte. Vous avez à disposition un certain
   nombre de variable d'environnement (voir l'aide en ligne).

-  **Exécuter une ligne de commande batch Windows** : vous permet
   d'entrer directement un script batch Windows dans le champ texte.
   Vous avez à disposition un certain nombre de variable d'environnement
   (voir l'aide en ligne).

-  **Appeler Ant** : vous permet d'appeler un script Ant. Vous pouvez
   choisir la version de Ant à utiliser si vous en avez défini plusieurs
   (voir ?), et éventuellement définir une cible précise. En cliquant
   sur le bouton "Avancé", vous pouvez également spécifier des
   propriétes et des options Java.

-  **Invoquer les cibles Maven de haut niveau** : vous permet d'appeler
   les cibles Maven. Précisez les cibles en question. Le bouton "Avancé"
   vous permet de définir le fichier POM, des propriétés et des options
   Java.

Cette partie de définition des étapes du build étant propre à chaque
projet, nous vous laisserons le soin de la remplir selon vos besoins.
Actions à la suite du build
---------------------------

Après le build, Hudson vous propose un certain nombre d'actions. On peut
citer parmis elle :

-  **Archiver des artefacts** : si votre build produit un exécutable (ou
   un zip, un tar), ou génère de la documentation utilisateur par
   exemple, vous pouvez publier ces artefacts sur la page du build
   Hudson. Vous devez donc spécifier le chemin vers ses artefacts à
   publier (le répertoire de référence est l'espace de travail -
   workspace - de votre projet). Vous pouvez utiliser les wildcard (\*)
   pour définir les artefacts à publier. Vous pouvez choisir de
   conserver ou non l'ensemble des artefatcs, ou seulement les derniers
   générés avec succès pour gagner de la place.

-  **Publier les javadocs** : si votre build produit de la javadoc, vous
   pouvez la publier sur la page du build. Pour ce faire, entrez le
   chemin vers le répertoire racine de la javadoc. Vous pouvez là aussi
   utiliser le wildcard et choisir ou non d'archiver les anciennes
   versions.

-  **Publier le rapport de résultat des tests JUnit** : si votre build
   exécute des tests unitaires JUnit, vous pouvez publier un rapport de
   résultat des tests sur la page du build. Pour cela, spécifiez le
   chemin des fichiers XML de rapport des tests générés par JUnit. Si
   vous utilisez un autre plugin de tests, vous trouverez certainement
   l'équivalent.

-  **Construire d'autres projets** : Votre Job peut être dépendant d'un
   autre Job. Dans ce cas, vous pouvez souhaitez construire un autre
   projet (job) après ce build. Le cas échéant, indiquez le nom du job à
   construire après ce build. Vous avez la possibilité aussi définir si
   le job doit être construit même si le build courant est en échec.

-  **Notifier par email** : Hudson a la capacité d'envoyer des emails
   aux destinaires spécifiés lorsque certains évènements importants ont
   eu lieu. Vous pouvez entrez une liste d'adresses email destinataires
   de ces notifications. Une bonne pratique peut être de mettre dans ce
   champ une liste de distribution (spéciale pour Hudson ou non) qui
   avertira l'ensemble de l'équipe (voir ? pour créer des listes de
   distribution). Les évènements déclenchant des notifications sont
   gérés de la façon suivante :

   -  Chaque build en échec provoque l'envoi d'un mail.

   -  Un build qui passe avec succès après un build en échec provoque
      l'envoi d'un mail, ce qui permet de savoir qu'une situation de
      crise est résolue.

   -  Un build instable après un build avec succès provoque l'envoi d'un
      mail, indiquant ainsi qu'il y a eu une régression.

   -  Sauf configuration contraire, chaque build instable provoque
      l'envoi d'un mail, indiquant ainsi qu'une régression est toujours
      d'actualité.

   Pour les projets qui ne suivent pas les bonnes pratiques et où les
   builds instables sont la norme, décochez la case "Envoyer un email à
   chaque build instable".

   Vous pouvez également envoyer un email aux personnes qui ont cassé le
   build. Pour que cela fonctionne correctement et que les utilisateurs
   soient automatiquement reconnus par Hudson, il faut vérifier que le
   serveur soit correctement configuré (voir ?).

Intégration dans SYS\_PRODUCT\_NAME
===================================

Parce que l'intégration continue fait partie des bonnes pratiques de
développement logiciel, et pas seulement dans des projets mettant en
oeuvre les méthodologies Agiles, SYS\_PRODUCT\_NAME intègre l'outil
Hudson. Nous avons vu plus haut comment installer (voir ?) et configurer
(voir ?) Hudson. Nous avons également vu comment créer et configurer ses
jobs Hudson (voir ?). Voyons maintenant comment Hudson est intégré à
SYS\_PRODUCT\_NAME.

Service Hudson
--------------

Si le plugin Hudson est installé et activé sur votre serveur
SYS\_PRODUCT\_NAME, chaque projet peut activer le service Hudson (voir ?
pour activer des services dans votre projet).

Une fois le service activé, vous verrez apparaître un nouvel onglet
"Build" dans la barre des services. Il s'agit de l'onglet correspondant
à l'intégration continue avec Hudson.

Lier un job Hudson à votre projet SYS\_PRODUCT\_NAME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pour lier un job Hudson à votre projet, sélectionnez l'onglet Build de
votre projet, puis cliquez sur le lien 'Ajouter un job'. Vous devez
alors entrer l'URL du job Hudson que vous souhaitez associer à votre
projet (par exemple :
http://[mon\_serveur\_ic]:8080/hudson/job/[mon\_job]).

Vous pouvez ensuite décider d'activer le déclenchement automatique du
build pour ce job après chaque commit effectué sur le dépôt de code
source de votre projet (CVS ou Subversion). Si vous avez protégé votre
build avec un jeton (token), vous pouvez également le spécifier (voir ?
pour plus d'explication). En cochant cette option, chaque commit
déclenchera un build du job lié, via un hook de pré-commit (vous n'avez
rien d'autre à faire).

Il est possible de lier plusieurs Jobs Hudson à un même projet
SYS\_PRODUCT\_NAME.

Parcourir les jobs et les builds Hudson
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lorsque vous cliquez sur l'onglet Build de votre projet, vous voyez un
tableau qui vous présente l'ensemble des jobs associés à votre projet.
Pour chaque job, vous voyez son état actuel (icône de couleur à gauche
du nom du job), son nom, le dernier build en succès, le dernier build en
échec, si vous avez activé ou non le déclenchement automatique du build
(voir ?). Si vous êtes administrateur du projet, vous verrez également
apparaître pour chaque job des icones vous permettant de modifier le job
ou de le supprimer.

Le nom du job est automatiquement détecté lors de la création, mais vous
pouvez le changer en éditant le job. Ceci est assez pratique si vous
souhaitez référencer des objets Hudson (voir ?). Les espaces pour les
noms de jobs seront automatiquement remplacés par des tirets bas (\_),
afin de permettre les références.

Le nom du job et les derniers builds sont des liens hypertextes qui
ouvriront la section Hudson correspondante dans une fenêtre juste en
dessous. Ceci est très pratique pour naviguer dans l'interface de Hudson
tout en restant dans l'interface de SYS\_PRODUCT\_NAME. Si vous
souhaitez visualiser la page Hudson en grand, vous pouvez cliquer sur le
lien 'voir seulement cette fenêtre' en haut à droite.

Le tableau vous propose également un lien vers le flux RSS de chaque
job.

Widgets Hudson
--------------

Le service Hudson vous permet d'agrémenter votre tableau de bord projet
ou personnel de nombreux widgets. Pour savoir comment ajouter des
widgets à votre tableau de bord personnel (votre page personnel), voir
?. La procédure est similaire pour ajouter des widgets au tableau de
bord projet (page sommaire du projet, voir ?).

-  **Mes jobs Hudson** : ce widget est utilisable sur la page
   personnelle seulement. Il représente par défaut un aperçu de
   l'ensemble des jobs des projets dont vous êtes membre. Vous pouvez
   bien entendu choisir les jobs que vous souhaitez voir affichés en
   cliquant sur le lien "préférences" du widget.

-  **Aperçu des jobs** : ce widget est utilisable sur la page projet
   uniquement. Il permet d'afficher un aperçu des jobs de votre projet.
   Si vous avez plusieurs jobs associés à votre projet, vous pouvez
   choisir ceux que vous souhaitez voir dans le widget (lien
   préférences).

-  **Derniers builds** : ce widget est utilisable sur le tableau projet
   et personnel. Il est lié à un seul job, et vous présente les derniers
   builds du job (dernier en date, dernier succès, dernier échec). Il
   affiche également la tendance du projet (icône météo, voir ?).

-  **Résultat des tests** : ce widget est utilisable sur le tableau
   projet et personnel. Il est lié à un seul job, et vous présente les
   résultats des tests du dernier build du job concerné. Il faut que
   votre job dispose de tests et qu'il les publie pour que ce widget
   affiche quelque chose. Les résultats sont présentés sous forme de
   camembert.

-  **Tendance des tests** : ce widget est utilisable sur le tableau
   projet et personnel. Il est lié à un seul job, et vous présente la
   tendance des résultats des tests du job concerné. Il faut que votre
   job dispose de tests pour que ce widget affiche quelque chose. Ce
   graphique représente le nombre de tests (en échec et en succès) dans
   le temps. Cela permet par exemple au chef de projet de vérifier que
   le nombre de tests est en constante augmentation avec le nombre de
   builds/commits.

-  **Historique des builds** : ce widget est utilisable sur le tableau
   projet et personnel. Il est lié à un seul job, et vous présente
   l'historique des builds sous forme de flux RSS. Pour chaque build de
   la liste, vous avez son numéro, son état et sa date.

-  **Derniers artéfacts du build** : ce widget est utilisable sur le
   tableau projet et personnel. Il est lié à un seul job, et vous
   présente les derniers artéfacts publiés. Il faut que votre job
   dispose d'artéfacts et qu'il les publie pour que ce widget affiche
   quelque chose.

Références Hudson
-----------------

Il est possible de créer des références vers certains objets Hudson dans
SYS\_PRODUCT\_NAME. Certaines références sont prédéfinies (job, build),
mais vous pouvez tout à fait définir vos propres références si besoin
(voir ? pour plus de détails sur les références)

Référencer un Job Hudson
~~~~~~~~~~~~~~~~~~~~~~~~

Le mot clé pour référencer un job est : **job**. Pour référencer un job,
vous pouvez utiliser les syntaxes suivantes :

-  job #LeNomDuJobAReferencer (le job en question doit se trouver alors
   dans le projet courant)

-  job #projet:LeNomDuJobAReferencer (le job en question doit se trouver
   alors dans le projet de nom 'projet')

-  job #num\_projet:LeNomDuJobAReferencer (le job en question doit se
   trouver alors dans le projet numéro 'num\_projet')

Référencer un Build Hudson
~~~~~~~~~~~~~~~~~~~~~~~~~~

Le mot clé pour référencer un build est : **build**. Pour référencer un
build, vous pouvez utiliser les syntaxes suivantes :

-  build #XXX (il ne doit y avoir alors qu'un seul job associé au projet
   courant, et le build référencé est alors le build numéro 'XXX' de ce
   job)

-  build #UnJob/XXX (référence le build numéro 'XXX' du job 'UnJob' du
   projet courant)

-  build #projet:UnJob/XXX (référence le build numéro 'XXX' du job
   'UnJob' du projet 'projet')

-  build #num\_projet:UnJob/XXX (référence le build numéro 'XXX' du job
   'UnJob' du projet numéro 'num\_projet')

.. [1]
   Plusieurs stratégies sont possibles : après chaque commit, à
   intervalle régulier (toutes les heures, toutes les nuits). Tout
   dépend de la taille du projet, du nombre de développeurs, de la
   fréquence des modifications.
