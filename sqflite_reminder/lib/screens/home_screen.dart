import 'package:flutter/material.dart';
import 'package:sqflite_reminder/models/note_modal.dart';
import 'package:sqflite_reminder/screens/add_note_screen.dart';
import 'package:sqflite_reminder/screens/update_note.dart';
import 'package:sqflite_reminder/services/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo's"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<NoteModal>?>(
          future: DatabaseHelper.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) =>
                          DatabaseHelper.remove(snapshot.data![index]),
                      child: GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  UpdateNote(
                                    title: snapshot.data![index].noteTitle,
                                    description: snapshot.data![index].noteDescription,
                                  )));
                        },
                        child: ListTile(
                          tileColor: Color.fromARGB(255, 3, 94, 85),
                          title: Text(
                            snapshot.data![index].noteTitle,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("No data available"));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()));
        },
        child: Icon(
          Icons.add,
          size: 64,
        ),
      ),
    );
  }
}
