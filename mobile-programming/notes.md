# App development
Can be divided in 4 steps:
1. Idea analysis
2. Interface design
3. Development
4. Store deployment

When developing a native app steps 2-4 has to be repeated, while cross-platform require only 4, for each platform supported

## Web development
### Pros
- Same UI for everyone (but has to be flexible enough)
- No installation
- Server-side updates

### Cons
- No store publishing (can also be a pro)
- Network connection always required
- Different testing
- Strongly connected to browser support (HTML, CSS, special extensions...)

## Hybrid approach
App framework wrapper. Web app that runs natively in a wrapper

### Pros
- Store publishing

### Cons
- Awful performance
- Non-native UI

## Native interpreted apps
Multi-platform code, that gets interpreted at runtime in native code

## Cross-compiled
Native apps, with good performances (if the compiler is good), from a "common" codebase (usually adapted for each platform)

# Cross-platform frameworks
## Cordova
Fix HTML5 problems on mobile browsers and use it to delevop mobile apps. \
Cordova is used to develop the business logic of the application, while PhoneGap is the container. Usually it's a base for other frameworks

PhoneGap is now dismissed, Cordova open-source

## Corona -> Solar2D
- Game-oriented framework. 2D engine, fast learning curve
- Uses Lua

## Flutter
- Cross-compiled approach -> native performances
- Multi platform (also for desktop)
- Can produce a web app for easier testing
- Allows lots of widget reuse
- Hot reload: build and update the app at runtime, while running
- Has two predifined styles: Material for Android and Cupertino for iOS
- It's **accessible**

### Dart
- OOP language by Google. Born as Dash (not the shell)
- Has native support for:
    - Lists
    - Sets
    - Associative arrays
- Supports generics
- Single inheritance
- Private variables with '\_' prefix
- Uses UTF-16
- Can be compiled to binary or to VM bytecode, which supports JIT and hot reload. When compiled to binary the runtime is embedded in the executable
- Can also be compiled to JS

#### Const vs final
Const has to be used at the beginning, final everywhere in the code (why?)

### Widgets
- Define UI. Are unchangeable
- Can be Stateful or Stateless if static

## React Native
- Mixes html and components. Everything is a component actually
- It's able to alter the DOM structure, to update only the modified elements -> fast

# Encodings
## Run length encoding
- Linear encoding of the literal data, only specifying repetitions instead of writing the same piece of data various times
- Used in bitmap for images
- Used in artificial images (omogeneous areas of color)

Ex: RGGGRBBBB -> R@3GR@4B

It only actually compress on $\geq$ 3 repetitions and shouldn't be used for text or real images -> it enlarges its size

## Shannon-Fano algorithm
Top down binary tree algorithm

## Huffman
Bottom up, creates a more balanced tree than Shannon-Fano -> values are encoded with similar sizes

They both require tables to encode

## LZW compression
Dynamic dictionary creation

# Color representation
- RGB is an addictive model -> you add colors
- CYMK is a subtractive model -> you start from white and add pigments that absorb all colors apart from a specific one
