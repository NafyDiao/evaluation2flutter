import 'package:flutter/material.dart';
import 'task_list.dart';

class TaskFormPage extends StatefulWidget {
  final Function(Task) onTaskAdded;

  const TaskFormPage({Key? key, required this.onTaskAdded}) : super(key: key);

  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _dateDebut;
  DateTime? _dateFin;

  void _selectDate(BuildContext context, bool isDateDebut) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isDateDebut) {
          _dateDebut = pickedDate;
        } else {
          _dateFin = pickedDate;
        }
      });
    }
  }

  void _submitTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty && _dateDebut != null && _dateFin != null) {
      final task = Task(
        title: title,
        description: description,
        dateDebut: _dateDebut!,
        dateFin: _dateFin!,
      );
      widget.onTaskAdded(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une Tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(_dateDebut == null
                  ? 'Sélectionner la date de début'
                  : 'Date de début: ${_dateDebut!.toLocal()}'.split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, true),
            ),
            ListTile(
              title: Text(_dateFin == null
                  ? 'Sélectionner la date de fin'
                  : 'Date de fin: ${_dateFin!.toLocal()}'.split(' ')[0]),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context, false),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submitTask,
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
