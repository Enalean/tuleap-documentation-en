.. contents::
   :depth: 3
..

Wiki
====

SYS\_PRODUCT\_NAME offre un service Wiki à chaque projet. Le wiki
utilisé dans SYS\_PRODUCT\_NAME s'appuie sur l'outil
`phpWiki <http://phpwiki.sourceforge.net>`__.

Présentation d'un Wiki
======================

Définition d'un Wiki
--------------------

Un Wiki est un site Web qui permet à ses utilisateurs d'ajouter très
facilement du contenu ou de modifier le contenu déjà en place.

Un Wiki permet de rédiger un document de façon collaborative à l'aide
d'un langage de balises simple et en utilisant uniquement un navigateur
Web. Une page d'un wiki est appelée "page wiki" alors que l'ensemble des
pages interconnectées par le biais d'hyperliens sont collectivement
baptisées "le wiki". SYS\_PRODUCT\_NAME offre en complément la notion de
"Document Wiki" : il s'agit d'une page wiki directement accessible
depuis la page d'accueil du service Wiki du projet.

Une propriété caractéristique de la technologie Wiki est la facilité
avec laquelle des pages peuvent être créées ou modifiées. Il n'y pas de
mécanisme de revue ou d'approbation des modifications effectuées et les
Wikis SYS\_PRODUCT\_NAME sont ouverts à tous les utilisateurs
enregistrés.

Wiki Page Formatting
--------------------

Dans les Wikis de SYS\_PRODUCT\_NAME, une page possède trois
représentations : le code HTML, la page résultant du rendu par le
navigateur et le code source de la page éditable par l'utilisateur à
partir duquel la version HTML est générée. Le format du code source,
connu sous le nom de "wikitext", est un langage de marquage simplifié.

Le langage de marquage "wikitext" est né de la constatation que HTML,
avec sa longue liste de balises imbriquées, est trop complexe pour
permettre l'édition simple et rapide de documents et empêche
l'utilisateur de se concentrer sur le contenu de la page. Le fait que
l'utilisateur ne puisse pas utiliser toutes les fonctionnalités de HTML,
telles que JavaScript et les feuilles de styles est aussi bénéfique car
cela permet d'assurer une cohérence dans le style des pages et d'éviter
les failles de sécurité.

Lier et créer des pages
-----------------------

Les Wikis sont de vrais documents hypertextes avec une structure de
navigation non linéaire. Chaque page contient des liens vers d'autres
pages. Les liens sont automatiquement créés en utilisant une syntaxe
particulière appelée "patron de lien".

Les wikis SYS\_PRODUCT\_NAME utilisent le "patron de lien" appelé
CasseChameau (CamelCase en anglais), qui consiste à considérer comme
hyperlien une série de mots collés ensemble dont la première lettre est
une majuscule (les mots "CamelCase", "RéférencesBibliographiques" en
sont des exemples). Le terme CasseChameau vient de l'allure des mots
composés dont les majuscules ressemblent à des bosses de chameau.

A noter qu'il existe aussi une autre façon de créer des liens wikis en
incluant une portion de texte entre crochets. Cela permet par exemple de
créer des pages dont le titre doit comporter des espaces.

Dans un Wiki, une nouvelle page est créée simplement en tapant un lien
dans une page existante. Si la page cible n'existe pas le lien est
marqué comme étant nouveau. En cliquant sur ce lien, une nouvelle
fenêtre d'édition apparaît et permet à l'utilisateur de taper son texte.
Ce mécanisme permet d'éviter les pages orphelines qui ne seraient
référencées nulle part dans le Wiki.

    **Important**

    Si vous souhaitez créer une référence à une page wiki d'un autre
    projet et si le nom de celle-ci est écrit en CasseChameau, contient
    des espaces ou des caractères spéciaux, vous devrez utiliser un lien
    à la place de la syntaxe habituelle.

    Exemple : Utiliser
    "[http://yourserver/wiki/index.php?group\_id=N&pagename=WiKiPageName]"
    à la place de "wiki #N:WikiPageName"

Rechercher
----------

Les Wikis SYS\_PRODUCT\_NAME permettent d'effectuer des recherches par
mots-clés aussi bien dans le titre que dans le contenu des pages.

Les Wikis de SYS\_PRODUCT\_NAME
===============================

Les Wikis de SYS\_PRODUCT\_NAME sont spécifiques à chaque projet. Ainsi
deux projets distincts peuvent utiliser les mêmes noms de pages sans
risque de conflit.

Création d'un Wiki
------------------

Pour être utilisable, le Wiki doit d'abord être initialisé par
l'administrateur du projet. Pour ce faire, cliquez sur le lien "wiki"
dans la barre des services, sélectionnez la langue d'utilisation de
votre Wiki, cliquez sur 'Créer' et attendez la fin du processus de
création.

Veuillez noter que la langue d'utilisation du Wiki est définie une fois
pour toute à la création du Wiki. Le Wiki s'affichera dans la langue
choisie quelles que soient les préférences de langues exprimées par
chaque utilisateur.

La création du Wiki donne naissance à un certain nombre de pages très
utiles : une page d'accueil, une "sandbox" où faire des tests, la
documentation PhpWiki, etc…

Permissions du Wiki
-------------------

Par défaut, les Wikis de SYS\_PRODUCT\_NAME sont lisibles et modifiables
par n'importe quel utilisateur enregistré.

Bien que cette politique d'accès soit en général la meilleure, certains
Wikis ne doivent pas être publics. Pour répondre à ce besoin,
SYS\_PRODUCT\_NAME offre un mécanisme de gestion des permissions basés
sur les groupes d'utilisateurs comme pour le gestionnaire de fichiers
(voir ? et ?). Les droits d'accès peuvent être définis au niveau du Wiki
et s'appliquer à toutes les pages, ou bien au niveau de la page
permettant ainsi de protéger uniquement certaines pages bien choisies.

Exemples de pages Wiki
----------------------

Les Wikis de projets hébergés sur SYS\_PRODUCT\_NAME peuvent être
utilisés de maintes façons. Les exemples qui suivent sont juste des
suggestions :

-  **Rapport de réunion** : les Wikis sont très pratiques pour rédiger
   des rapports de réunion. Il suffit de taper le nom du meeting sous
   forme d'un lien wiki, de cliquer sur le nouveau lien et de taper le
   rapport de réunion. De plus, n'importe quel utilisateur peut modifier
   ou corriger le contenu par la suite.

-  **Calendrier de projet** : les pages Wikis de SYS\_PRODUCT\_NAME
   peuvent inclure un calendrier partagé accessible et modifiable par
   tous les membres du projet (voir la page CalendarPlugin).

-  **Documentation** : un Wiki est une façon très pratique de fournir la
   documentation relative à un projet (guide utilisateur, guide
   d'administration, FAQ, etc…). Cette documentation peut être mise à
   jour par les membres de l'équipes, vos partenaires, voire même vos
   clients s'ils ont les droits d'accès.

En savoir plus
--------------

Tous les Wikis de SYS\_PRODUCT\_NAME sont initialisés avec un jeu de
pages par défaut dont la documentation PhpWiki. Consultez la page
PhpWikiDocumentation pour une description de toutes les fonctionnalités
de PhpWiki : syntaxe du langage de marquage, plugins, etc…
