# Candidates
- Ionic
- NativeScript
- Appcelerator
- Capacitor
- Qt
- Codename One
- Unity
- Sencha Touch
- LiveCode
- Node.js??

## (Ionic) Capacitor
- The equivalent of Electron on Desktop for mobile apps. Turns an existing web app into a mobile app
- You can use any frontend framework. It's just a node module/js library you install into your project
- Successor of Cordova? Basically the same, but born in 2018 vs 2009
- From Ionic, but does not require to use it. Ionic provides the UI elements (buttons, input, ...) Capacitor is the tool to compile and bundle the web app into a native mobile app and provides access from the web app to mobile specific features (camera, storage, location, ...)

## NativeScript
[Introduction](https://code.tutsplus.com/articles/an-introduction-to-nativescript--cms-26771)
[Stack](https://v7.docs.nativescript.org/core-concepts/technical-overview)

NativeScript is cool because it lets you use anything for the application code (Angular, React, Vue, ...) but still uses native APIs for UI render. It doesn't need compilation, because it uses runtimes, called by the js library

Native look and feel, because uses native components. This means accessibility support

### Cons
- No old devices support. Recommended SDKs:
    - iOS 11 SDK
    - Android 6.0 SDK (4.2 minimum)
- Low community support
