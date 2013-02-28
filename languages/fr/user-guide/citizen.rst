
.. |SYSPRODUCTNAME| replace:: Tuleap

Devenir un utilisateur |SYSPRODUCTNAME|
=========================================

.. _les-groupes-d'utilisateurs:

Les groupes d'utilisateurs
--------------------------

Avant d'aborder les explications concernant le processus
d'enregistrement d'un utilisateur, il est utile de passer en revue les 4
groupes d'utilisateurs pré-définis:

-  **Les utilisateurs anonymes** : il s'agit là des utilisateurs qui
   visitent |SYSPRODUCTNAME| pour la première fois ou qui n'ont pas
   pris la peine de se connecter en arrivant sur la page d'accueil. Par
   défaut, les utilisateurs anonymes peuvent parcourir le site
   |SYSPRODUCTNAME| mais de nombreux services et ressources
   |SYSPRODUCTNAME| ne leur sont pas accessibles (par exemple l'accès
   aux logiciels eux-mêmes, les fonctions de surveillance, etc…). Nous
   vous conseillons donc vivement de vous enregistrer sur
   |SYSPRODUCTNAME| si vous voulez en tirer le meilleur parti.

-  **Les utilisateurs enregistrés** : une fois votre compte utilisateur
   enregistré (voir plus bas) vous pouvez utiliser votre nom
   d'utilisateur et votre mot de passe pour vous authentifier auprès de
   |SYSPRODUCTNAME|. Les utilisateurs enregistrés ont accès à tous les
   projets de |SYSPRODUCTNAME| sauf si l'administrateur du projet en a
   décidé autrement. Ils bénéficient aussi d'une page personnelle, de la
   capacité à surveiller des forums et des paquets logiciels et de la
   notification par email des mises à jour des artefacts (bugs,
   tâches,...) dans lesquels ils sont impliqués, etc…

-  **Les membres d'un projet** : ce sont les utilisateurs participant
   aux activités d'un projet hébergé sur |SYSPRODUCTNAME|. Pour
   devenir membre d'un projet vous devez d'abord devenir utilisateur
   enregistré et, ensuite, demander à l'administrateur du projet de vous
   admettre parmi les membres. Les membres d'un projet sont la plupart
   du temps membres de l'équipe de projet mais ne sont pas
   nécessairement des développeurs. Ils peuvent être en charge de
   l'activité de support ou de contrôle qualité, de la gestion de la
   documentation ou de la gestion du projet lui-même. Les membres d'un
   projet se voient souvent assignés des droits différents par
   l'administrateur du projet selon leur rôle (voir :ref:`Administration d'un projet` pour plus de
   détails).

-  **Les administrateurs d'un projet** : les utilisateurs enregistrés
   qui créent un nouveau projet sur |SYSPRODUCTNAME| héritent du rôle
   d'administrateur de ce projet. Les administrateurs d'un projet
   disposent des pleins pouvoirs sur ce projet sauf en ce qui concerne
   la suppression complète d'un projet - une chose très rare - que seuls
   les administrateurs du site peuvent faire. A n'importe quel moment
   dans le cycle de vie du projet, l'administrateur historique du projet
   peut assigner (ou révoquer) ce même rôle à d'autres membres du
   projet.

-  **Les utilisateurs restreints** : il s'agit là de membres ou
   d'administrateurs de projet dont les droits d'accès sont restreints :
   ils n'ont accès qu'aux projets dont ils sont membres et ne voient pas
   les autres projets, quels qu'ils soient. Ce rôle particulier est en
   général activé sur les sites |SYSPRODUCTNAME| mêlant utilisateurs
   internes et externes sur le même serveur dans le but de cantonner les
   utilisateurs uniquement aux projets dans lesquels ils ont une
   responsabilité.

Enregistrement des utilisateurs
-------------------------------

Comme suggéré plus haut, la première chose à faire pour un nouveau venu
sur |SYSPRODUCTNAME| consiste à créer son propre compte. Créer son
propre compte ne vous engage aucunement à héberger vos projets sur
|SYSPRODUCTNAME| mais vous donne plus de possibilités lorsque vous
parcourez le site et permet à |SYSPRODUCTNAME| de personnaliser les
informations qui vous sont présentées.

S'enregistrer sur |SYSPRODUCTNAME| est simple et rapide :

Sélectionnez le lien "Nouveau compte".

Remplissez les champs suivants (ceux marqués d'un astérisque sont
obligatoires) :

**Nom de login** : votre nom d'utilisateur. A noter que sur certains
systèmes |SYSPRODUCTNAME| connectés à un annuaire d'entreprise le nom
d'utilisateur peut être imposé (voir plus loin).

**Mot de passe** : 6 caractères minimum à répéter deux fois pour éviter
toute erreur de frappe.

**Nom complet** : rappelez-moi votre nom HYPHEN s'il vous plaît.

**Adresse email** : suivant la configuration du site, les adresses
emails considérées comme valides peuvent se limiter au domaine
SYS\_ORG\_NAME ou à l'un de ses sous-domaines. Vérifiez bien que votre
adresse email est correcte faute de quoi vous ne recevriez pas la
demande de confirmation de votre enregistrement.

**Fuseau horaire** : choisissez le fuseau horaire dans lequel vous
vivez. C'est une information importante car |SYSPRODUCTNAME| stocke
tous ses marqueurs de temps en temps universel (GMT) et s'appuie sur le
fuseau horaire fourni par l'utilisateur pour présenter les dates et
heures en temps local sur les différentes pages Web.

**Annonces site** : cochez cette case si vous souhaitez recevoir les
informations concernant les mises à jour du site |SYSPRODUCTNAME|. Le
trafic est très faible et nous vous recommandons vivement de cocher
cette case. Les notifications reçues traitent des nouvelles
fonctionnalités disponibles, des plages d'indisponibilité pour raison de
maintenance, des événements importants dans la vie du site, etc…

**Annonces site supplémentaires** : cochez cette case pour recevoir des
messages moins importants concernant la vie du site. Vous pouvez cocher
cette case sans crainte d'être submergé de messages car le trafic est
extrêmement réduit.

Peu après avoir validé l'enregistrement de votre compte utilisateur, un
email doit vous parvenir vous demandant confirmation. En cliquant sur
l'URL contenu dans ce message, vous ferez apparaître un formulaire vous
demandant à nouveau votre nom d'utilisateur et votre mot de passe. S'ils
correspondent bien à ceux que vous avez initialement choisis, votre
compte utilisateur est définitivement validé et vous êtes désormais
connecté à |SYSPRODUCTNAME|.

    **Tip**

    Si votre serveur |SYSPRODUCTNAME| est connecté à un annuaire
    d'entreprise le processus d'enregistrement est encore plus simple :
    il vous suffit de taper votre nom d'utilisateur LDAP et votre mot de
    passe et |SYSPRODUCTNAME| extraira automatiquement le reste des
    informations vous concernant dans l'annuaire : adresse email, nom
    complet, etc…

Ce processus d'enregistrement en deux étapes a été mis en place pour des
raisons de sécurité. En supposant qu'un utilisateur crée un compte avec
une fausse adresse email, le message ne lui parviendra pas et la
validation du compte ne pourra se faire. Pour les sites situés derrière
un pare-feu cela implique aussi qu'un compte ne peut-être validé depuis
l'extérieur.

    **Tip**

    Tout d'abord ne paniquez pas et, surtout, ne créez pas un nouveau
    compte dans la foulée. Si vous avez oublié votre mot de passe, allez
    sur la page de connexion au site |SYSPRODUCTNAME| et suivez le
    lien [Mot de passe perdu ?]. Un formulaire apparaît qui vous demande
    votre nom d'utilisateur. Après l'avoir soumis vous recevrez un email
    contenant un URL. Après avoir suivi cet URL et avoir choisi un
    nouveau mot de passe, vous pourrez à nouveau accéder au site.

    Et que se passe-t-il si j'ai aussi oublié mon nom d'utilisateur ? Là
    ça devient sérieux ! Dans ce cas utilisez la boîte de recherche par
    mots-clés, sélectionnez l'option "Utilisateurs", tapez tout ou
    partie de votre nom de famille et voyez si les résultats retournés
    vous permettent de retrouver votre nom d'utilisateur. Si oui
    appliquez alors la procédure en cas de perte de mot de passe, si non
    contactez l'administrateur du site.

.. _connexion-et-page-personnelle:

Connexion et page personnelle
------------------------------

Pour vous connecter au site |SYSPRODUCTNAME|, rendez vous sur l'URL
`http://SYS\_DEFAULT\_DOMAIN <http://&SYS_DEFAULT_DOMAIN;/>`__ et
cliquez sur le lien "Se connecter". Après vous être authentifié,
|SYSPRODUCTNAME| vous présente votre Tableau de bord ou Page
Personnelle (`La page personnelle d'un utilisateur Tuleap`_). Vous pouvez à tout moment retourner sur cette Page
Personnelle en sélectionnant le lien "Ma Page Personnelle" dans le menu
|SYSPRODUCTNAME|.

Votre page personnelle est une plaque tournante à partir de laquelle
vous pouvez rayonner vers d'autres espaces de travail et d'information
de |SYSPRODUCTNAME|. Vous y trouverez les artefacts (bugs, tâches,
etc...) qui vous sont assignés ou que vous avez soumis. Vous pouvez
ainsi très facilement suivre l'évolution des artefacts dont vous êtes en
charge dans vos projets ou ceux que vous avez soumis à d'autres projets
et que vous êtes impatient de voir traités.

.. figure:: ../images/screenshots/sc_mypersonalpage.png
   :align: center
   :alt: La page personnelle d'un utilisateur Tuleap
   :name: La page personnelle d'un utilisateur Tuleap

   La page personnelle d'un utilisateur |SYSPRODUCTNAME|

|SYSPRODUCTNAME| vous permet de personnaliser votre page à votre
convenance. Le contenu de la page est constitué de *widgets*. Tous les
widgets peuvent être déplacés, fermés ou supprimés. Certains d'entre eux
peuvent fournir un flux rss ou des préférences peuvent être choisies.

Les widgets peuvent être ajoutés grâce au lien "Ajouter des widgets".
Voici une liste non-exhaustive de widgets disponible pour votre page
personnelle :

-  **Fichiers sous surveillance** liste les fichiers que vous
   surveillez, par projet. Pour interrompre la surveillance, il vous
   suffit de cliquer sur la corbeille (|image1|) à côté de l'item
   concerné.

-  **Forums sous surveillance** liste les forums que vous surveillez,
   par projet. Pour interrompre la surveillance, il vous suffit de
   cliquer sur la corbeille (|image2|) à côté de l'item concerné.

-  **Mes artefacts** liste les artéfacts soumis par vous ou qui vous ont
   été assignés, par projet.

-  **Mes favoris** liste vos pointeurs favoris (pointeurs sur vos pages
   préférées de |SYSPRODUCTNAME| ou externes). A noter que ces
   pointeurs peuvent être très sophistiqués. Ils permettent par exemple
   de mémoriser une requête multi-critères effectuée sur un outil de
   suivi.

-  **Mes projets** liste les projets auxquels vous appartenez. La
   sélection d'un de ces projets vous amène sur sa page sommaire.

-  **Sondages**: Sondage site en cours auxquels vous n'avez pas encore
   participé.

-  **RSS Reader** vous permet d'inclure dans votre page personnelle des
   fils rss (ou atom) publiques.

Gestion de compte
-----------------

Lors de la phase d'enregistrement vous avez fourni un certain nombre
d'informations vous concernant. Ces informations peuvent être modifiées
à tout moment en sélectionnant le lien "Mon compte" dans le menu de
|SYSPRODUCTNAME|.

La plupart des informations modifiables sur la page "Mon compte" vous
paraîtront évidentes. Nous voulons cependant attirer votre attention sur
certaines d'entre elles :

-  **Voir mon profil de compétences** : un utilisateur peut publier son
   CV sur |SYSPRODUCTNAME|. Le but est de permettre aux autres
   utilisateurs de mieux vous connaître vous et votre expertise
   technique.

-  **Clés SSH partagées** : ce champ se rapporte au service Compte
   Shell. Lorsque vous êtes utilisateur enregistré, le serveur
   |SYSPRODUCTNAME| vous offre un compte shell personnel qui utilise
   le même nom d'utilisateur et le même mot de passe que le compte Web.
   Pour automatiser la procédure de connexion à ce compte vous pouvez
   partager votre clé publique SSH avec |SYSPRODUCTNAME|. Ainsi
   vous vous éviterez la saisie systématique d'un nom d'utilisateur et
   d'un mot de passe. Plus de détails sur :ref:`compte-shell`.

.. _preferences:

Préférences
-----------

Vos préférences utilisateurs sont disponibles dans Ma page personnelle
-> Préférences. Voici les préférences que vous pouvez définir :

-  **"Souviens-toi de moi"** : par défaut, votre session de travail
   courante sur |SYSPRODUCTNAME| s'achève dès que vous stoppez votre
   navigateur Web. Au prochain démarrage, vous devrez à nouveau vous
   identifier. En cochant cette case vous demandez à |SYSPRODUCTNAME|
   de se souvenir de votre identité entre deux sessions de travail à
   moins, bien sûr, que vous ne vous déconnectiez explicitement en
   utilisant le lien "Se déconnecter". Pour des raisons de sécurité nous
   vous recommandons de n'utiliser cette fonctionnalité que si vous
   disposez d'une machine personnelle.

-  **Séparateur CSV**: |SYSPRODUCTNAME| vous permet d'importer et
   d'exporter des données de vos projets (Voir :ref:`exportation-des-données-du-projet` pour plus de détails).
   Le format d'import et d'export utilisé est le format CSV. Comme la
   norme CSV n'est pas implémentée de la même manière dans tous les
   logiciels, vous avez la possibilité de définir votre séparateur CSV.
   Les différents séparateurs disponibles sont :

   -  la virgule (,) : le séparateur par défaut.

   -  Le point-virgule (;) : utilisé par défaut par la version française
      d'Excel.

   -  Tab (tabulation).

-  **Format de date CSV**: |SYSPRODUCTNAME| vous permet d'importer et
   d'exporter des données de vos projets (Voir :ref:`exportation-des-données-du-projet` pour plus de détails).
   Le format d'import et d'export utilisé est le format CSV. Comme la
   norme CSV n'est pas implémentée de la même manière dans tous les
   logiciels, vous avez la possibilité de définir votre format de date
   CSV. Les différents formats disponibles sont :

   -  mois/jour/année : le format par défaut (généralement utilisé aux
      Etats-Unis).

   -  jour/mois/année : utilisé par défaut dans la version française
      d'Excel.

   Ce format sera utilisé lors de l'export des artéfacts. Il sera
   également utilisé lors de l'import. N'oubliez donc pas de vérifier
   vos données dates avant d'importer. Le système attend des dates au
   format défini dans vos préférences.

.. |image1| image:: ../images/icons/trash.png
.. |image2| image:: ../images/icons/trash.png
