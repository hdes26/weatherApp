import 'package:flutter/material.dart';
import 'package:app_clima/pages/clima.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(BuildContext context) => Clima()
      },
     );
  }
}




