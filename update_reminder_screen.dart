import 'package:flutter/material.dart';
import 'package:pet_pal/models/reminder.dart';
import 'package:pet_pal/services/firestore_service.dart';

class UpdateReminderScreen extends StatefulWidget {
  final Reminder reminder;

  UpdateReminderScreen({required this.reminder});

  @override
  _UpdateReminderScreenState createState() => _UpdateReminderScreenState();
}

class _UpdateReminderScreenState extends State<UpdateReminderScreen> {
  final FirestoreService _service = FirestoreService();
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.reminder.title;
    _selectedDate = widget.reminder.dateTime;
  }

  void _updateReminder() {
    final updatedReminder = Reminder(
      id: widget.reminder.id,
      petId: widget.reminder.petId,
      title: _titleController.text,
      dateTime: _selectedDate,
    );

    _service.addReminder(updatedReminder); // This will replace the old reminder
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Reminder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Reminder Title')),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                }
              },
              child: Text('Select Date'),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _updateReminder, child: Text('Update Reminder')),
          ],
        ),
      ),
    );
  }
}
