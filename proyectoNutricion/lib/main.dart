import 'package:flutter/material.dart';
import 'package:flutterdiseno/src/basico_page.dart';
import 'package:flutterdiseno/src/scroll_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'diseños',
      initialRoute: 'scroll',
      routes: {
        'basico': (BuildContext  context) => BasicoPage(),
        'scroll': (BuildContext  context) => ScrollPage(),
      }
    );
  }
}
