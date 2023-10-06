import 'package:flutter/material.dart';
import 'package:sqflite_reminder/models/note_modal.dart';
import 'package:sqflite_reminder/services/db_helper.dart';

class UpdateNote extends StatefulWidget {
  const UpdateNote({super.key, required this.title, required this.description});

  final String description;
  final String title;

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  TextEditingController newTitleController = TextEditingController();

  TextEditingController newDescriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newTitleController.dispose();
    newDescriptionController.dispose();
  }

  void submitData() {

    if (newDescriptionController.text != null && newDescriptionController.text != null) {
      final updatedNote = NoteModal(
          noteTitle: newTitleController.text,
          noteDescription: newDescriptionController.text);

      DatabaseHelper.updateNote(updatedNote);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newTitleController.text = widget.title;
    newDescriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.description);
    print(widget.title);
    return Scaffold(
      appBar: AppBar(title: Text("Update Note")),
      body: Column(
        children: [
          TextField(
            controller: newTitleController,
            decoration: InputDecoration(hintText: "Enter title"),
          ),
          TextField(
            controller: newDescriptionController,
            decoration: InputDecoration(hintText: "Enter description"),
          ),
          ElevatedButton(onPressed: submitData, child: Text("Submit Data"))
        ],
      ),
    );
  }
}
