import 'package:flutter/material.dart';
import 'package:sqf_lite_yt/database_handler.dart';
import 'package:sqf_lite_yt/notes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHandler dbHandler = DatabaseHandler();

  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    notesList = dbHandler.getNotesList();
  }

  Future<void> addNote() async {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    final result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return buildNoteDialog(
              title: "Add Note",
              nameController: nameController,
              descriptionController: descriptionController,
              onPressed: () async {
                await dbHandler.insert(NotesModel(
                    title: nameController.text,
                    description: descriptionController.text));

                loadNotes();
                Navigator.pop(context, true);
              });
        });

    if (result == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added Succesfully")));
    }
    setState(() {});
  }

  Widget buildNoteDialog(
      {required String title,
      required TextEditingController nameController,
      required TextEditingController descriptionController,
      required Function() onPressed}) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: "Description"),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, minimumSize: Size(100, 40)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "cancel",
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
            onPressed: onPressed,
            child: Text("Add"))
      ],
    );
  }

  Widget showNotes() {
    return FutureBuilder<List<NotesModel>>(
      future: notesList,
      builder:
          (BuildContext context, AsyncSnapshot<List<NotesModel>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final note = snapshot.data![index];
              return buildNoteItem(note);
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget buildNoteItem(NotesModel note) {
    return InkWell(
      onTap: () {
        editNote(note);
      },
      child: Dismissible(
          key: ValueKey<int>(note.id!),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) async {
            await dbHandler.delete(note.id!);
            loadNotes();
          },
          background: Container(
            color: Colors.redAccent,
            child: const Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
          child: Card(
            child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.description),
              trailing: Icon(Icons.edit_note),
            ),
          )),
    );
  }

  Future<void> editNote(NotesModel note) async {
    final nameController = TextEditingController(text: note.title);
    final descriptionController = TextEditingController(text: note.description);

    final result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return buildNoteDialog(
              title: "Update Note",
              nameController: nameController,
              descriptionController: descriptionController,
              onPressed: () async {
                await dbHandler.update(NotesModel(
                    title: nameController.text,
                    description: descriptionController.text,
                    id: note.id));

                loadNotes();
                Navigator.pop(context, true);
              });
        });

    if (result == true) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Note updated Succesfully")));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Notes")),
      body: showNotes(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNote();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
