import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/config/root/on_generate_root.dart';
import 'package:news_app/data/local/hive_local_storg.dart';

void main() async {
  await Hive.initFlutter('./');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      lazy: false,
      create: (context) => HiveStorg()..initDataBase(),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: OnGenerateRoot.onGenerateRoute,
      ),
    );
  }
}
