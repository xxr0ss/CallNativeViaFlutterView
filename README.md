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

We need to use [ffigen](https://pub.flutter-io.cn/packages/ffigen) to generate 
`my_flutter_plugin_ffi/lib/my_flutter_plugin_ffi_bindings_generated.dart`, which is needed 
to communicate with `C` code.

Use the following command when functions in `my_flutter_plugin_ffi\src\my_flutter_plugin_ffi.h` is modified.
```powershell
flutter pub run ffigen --config ffigen.yaml
```

Currently on Flutter 3.0.1 & Dart SDK 2.17.1, we need to set ffigen.yaml:

```yaml
# ...
headers:
  entry-points:
    - 'src/my_flutter_plugin_ffi.c' # instead of .h
  include-directives:
    - 'src/my_flutter_plugin_ffi.h'
# ...
```
I think it is a bug that bindings are not generated when both 
`entry-points` and `include-directorives` set to the same `.h` file


# References
[https://docs.flutter.dev/development/platform-integration/c-interop](https://docs.flutter.dev/development/platform-integration/c-interop)

[https://docs.flutter.dev/development/add-to-app/android](https://docs.flutter.dev/development/add-to-app/android)