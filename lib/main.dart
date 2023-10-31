import 'package:bloc_study/app/pages/tarefa_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TarefasPage(),
    );
  }
}
