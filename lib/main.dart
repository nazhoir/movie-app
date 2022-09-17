import 'package:flutter/material.dart';

import 'package:moviez/home.dart';
import 'package:provider/provider.dart';

import 'controller/home_controller.dart';
import 'controller/search_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => SearchController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviez',
      home: HomeScreen(),
    );
  }
}
