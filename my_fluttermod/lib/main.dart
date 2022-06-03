import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ffi/ffi.dart';
import 'package:my_flutter_plugin_ffi/my_flutter_plugin_ffi.dart'
    as my_flutter_plugin_ffi;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int sumResult;
  late Future<int> sumAsyncResult;
  late String title;

  @override
  void initState() {
    super.initState();
    sumResult = my_flutter_plugin_ffi.sum(1, 2);
    sumAsyncResult = my_flutter_plugin_ffi.sumAsync(3, 4);
    String s = 'Native Package';
    int len = s.length;
    title = my_flutter_plugin_ffi
        .reverse(s.toNativeUtf8().cast(), len)
        .cast<Utf8>()
        .toDartString();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reversed: $title"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'This calls a native function through FFI that is shipped as source in the package. ',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'sum(1, 2) = $sumResult',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                FutureBuilder<int>(
                  future: sumAsyncResult,
                  builder: (BuildContext context, AsyncSnapshot<int> value) {
                    final displayValue =
                        (value.hasData) ? value.data : 'loading';
                    return Text(
                      'await sumAsync(3, 4) = $displayValue',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
