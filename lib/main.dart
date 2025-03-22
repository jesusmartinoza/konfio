import 'package:flutter/material.dart';
import 'package:konfio_challenge/pages/dogs/dogs.page.dart';
import 'package:konfio_challenge/theme/material_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konfío',
      theme: MaterialTheme.light(),
      home: const DogsPage(),
    );
  }
}
