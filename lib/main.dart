import 'package:flutter/material.dart';
import 'task_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Tâches',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListPage(),
    );
  }
}
