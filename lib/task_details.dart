import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'task_list.dart';

class TaskDetailsPage extends StatelessWidget {
  final Task task;

  const TaskDetailsPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format de date
    final dateFormatter = DateFormat('dd MMM yyyy'); // Ex : 04 Déc 2024

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Détails de la Tâche',
          style: const TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.description, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  task.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.date_range, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      'Dates',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Date de début : ${dateFormatter.format(task.dateDebut)}',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Text(
                  'Date de fin : ${dateFormatter.format(task.dateFin)}',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Retour à la liste'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
