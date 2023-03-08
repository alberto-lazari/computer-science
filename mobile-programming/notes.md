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
