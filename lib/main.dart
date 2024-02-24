import 'package:flutter/material.dart';
import 'package:news_app/config/root/on_generate_root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoot.onGenerateRoute,
    );
  }
}
