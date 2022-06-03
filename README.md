# Call Native Via Flutter View

This project demonstrates how an Android App calls native code with the embedded
flutter view, which calls native code via Dart FFI.

# Build

```powershell
git clone https://github.com/xxr0ss/CallNativeViaFlutterView
cd CallNativeViaFlutterView/my_fluttermod
flutter build aar # to generate "my_fluttermod/.android/include_flutter.groovy"
```
Open `CallNativeViaFlutterView/UseFlutterView` in Android Studio


# References
[https://docs.flutter.dev/development/platform-integration/c-interop](https://docs.flutter.dev/development/platform-integration/c-interop)

[https://docs.flutter.dev/development/add-to-app/android](https://docs.flutter.dev/development/add-to-app/android)