import 'package:flutter/material.dart';

import 'package:sqflite_reminder/models/note_modal.dart';
import 'package:sqflite_reminder/services/db_helper.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  void submitData() {
    print(descriptionController.text);
    print(titleController.text);
    if (descriptionController.text != null && titleController.text != null) {
      final newNote = NoteModal(

          noteTitle: titleController.text,
          noteDescription: descriptionController.text);
      print("added $newNote");
      DatabaseHelper.addNote(newNote);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Enter title"),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Enter description"),
          ),
          ElevatedButton(onPressed: submitData, child: Text("Submit Data"))
        ],
      ),
    );
  }
}
