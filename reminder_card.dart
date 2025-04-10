import 'package:flutter/material.dart';
import 'package:pet_pal/models/reminder.dart';
import 'package:intl/intl.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;

  ReminderCard({required this.reminder});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(reminder.title),
        subtitle: Text(DateFormat.yMMMd().add_jm().format(reminder.dateTime)),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateReminderScreen(reminder: reminder),
              ),
            );
          },
        ),
      ),
    );
  }
}
