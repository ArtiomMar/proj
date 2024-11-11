import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/info_page/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 21, 21, 21)),
      debugShowCheckedModeBanner: false,
      home: const InfoPage(),
    );
  }
}
