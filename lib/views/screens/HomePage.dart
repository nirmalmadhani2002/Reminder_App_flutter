import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/provider/theme_provider.dart';

class ReminderApp extends StatefulWidget {
  @override
  _ReminderAppState createState() => _ReminderAppState();
}

class _ReminderAppState extends State<ReminderApp> {
  List<String> reminders = [];

  void addReminder(String reminder) {
    setState(() {
      reminders.add(reminder);
    });
  }

  void removeReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.light_mode),
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme();
              },
            ),
          ],
          title: Text('Reminder App'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(reminders[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        removeReminder(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0XFF6A62B7).withAlpha(50),
                  ),
                  child:Column(
                    children: [
                      TextField(
                        onSubmitted: (value) {
                          addReminder(value);

                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.textsms_outlined),
                          labelText: 'Add a reminder',
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  )
              ),
              ),
          ],
        ),
    );
  }
}

