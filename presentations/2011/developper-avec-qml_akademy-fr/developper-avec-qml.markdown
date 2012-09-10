# Développer avec QML

## Aurélien Gâteau

26 novembre 2011

----

# QML : Qt Markup Language

- Une nouvelle façon de concevoir des applications
- Utilisable de manière indépendante ou embarqué dans des applications existantes
- Deux langages :
    - Un langage déclaratif simple, ressemblant à du CSS
    - JavaScript pour les interactions

----

# Hello World

<img src="helloworld/helloworld.png" style="float:right"/>

    ${helloworld/helloworld.qml}

----

# Éléments de base

Les éléments fournient avec QML sont très simples. Les plus communs sont :

- Item
- Rectangle
- MouseArea
- Text
- TextInput
- TextEdit
- Image
- BorderImage

----

# Pas de "clipping"

La taille d'un élément n'est pas limitée par la taille de son parent !

<img src="helloworld/helloworld2.png" style="float:right"/>

    ${helloworld/helloworld2.qml}

----

# Les ancres

----

# Introduction

- QML n'a pas de notion de "layout"
- Les éléments peuvent être positionnés par rapport aux autres

----

# Exemple

<img src="ancres/ancres2.png" style="float:right"/>

    ${ancres/ancres2.qml#main}

----

# Exemple (suite)

<img src="ancres/ancres3.png" style="float:right"/>

    ${ancres/ancres3.qml#ancres3}

----

# MouseArea

----

# Introduction

- Elément invisible permettant de répondre aux événements de la souris
- Utilisable de manière impérative ou déclarative

----

# Utilisation impérative

- MouseArea définit de nombreux signaux sur lesquels on peut connecter du code JavaScript :
    - `onClicked`
    - `onEntered`
    - `onExited`
    - ...

----

# Utilisation déclarative

- MouseArea définit également de nombreuses propriétés :
    - `pressed`
    - `pressedButtons`
    - `containsMouse`
- On peut définir les propriétés d'autres éléments en fonction de propriétés de la MouseArea


----

# Effet de proximité

- La MouseArea peut être plus grande que son parent, ce qui permet d'implémenter des effets de proximité

----

# Les composants

----

# Introduction

- Permet de réutiliser des blocs de QML
- Il suffit de créer un fichier dont le nom respecte le format CamelCase.qml

----

# Exemple simple

<img src="composants/composants.png" style="float:right"/>
Square.qml

    ${composants/Square.qml#main}

Code utilisant le composant Square :

    ${composants/composants.qml#main}

----

# Signaux

Permettent de signaler au monde extérieur que quelque chose c'est produit.

## Définition

MyComponent.qml

    Item {
        signal activated // Définition

        MouseArea {
            onClicked: myItem.activated() // Emission
            ...
        }
    }

## Utilisation

    Item {
        MyComponent {
            onActivated: { /* Code JS à exécuter */ }
        }
    }

----

# Propriétés

Syntaxe : `property <type> <nom>[: <valeur>]`

## Définition

MyComponent.qml

    Item {
        property int length: 20 // Définition
        Rectangle {
            width: myItem.length + 4 // Utilisation
            ...
        }
    }

## Utilisation

    Item {
        MyComponent {
            length: 30
        }
    }

----

# Les alias

Permettent d'exposer une propriété d'un élément enfant

Syntaxe : `property alias <nom>: <enfant.propriété>`

## Définition

    Item {
        property alias color: rect.color
        Rectangle {
            id: rect
            ...
        }
    }

## Utilisation

    Item {
        MyComponent {
            color: "red"
        }
    }

----

# Exemple concret de composants

Calculatrice minimaliste

<img src="composants/calc.png"/>

----

# Animations

----

# Introduction

Plusieurs façons d'appliquer des animations

- Utilisation d'objets Animation
- Behavior
- Via les transitions (non abordées ici)

---

# Objets Animation

- Animation = changement progressive de la valeur d'une propriété
- QML peut animer la majorité des types de propriétés

---

# ParallelAnimation et SequentialAnimation

- Permettent de grouper et d'enchaîner des animations

---

# Behavior

- Solution simple pour associer une animation à une propriété

----

# Qt Components

----

# Intégration C++

- Widget pour afficher du QML : QDeclarativeView
- Toute classe dérivant de QObject peut être exposée en QML

----

# Qt Components

- Eléments QML ayant l'apparence de widgets natifs
- En cours de développement
- Méthode privilégiée pour la création d'applications dans Qt5

----

# Conclusion

- Plus souple que le système de widgets
- Permet un meilleur découplage entre le développeur et le designer
- Langage déclaratif ⇒ s'adapter à un nouveau mode de pensée

----

# Questions ?
