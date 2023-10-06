import 'package:cruddd_operation/create_todo.dart';
import 'package:cruddd_operation/todo_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoItem> myTodos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD APP"),
      ),
      body: Column(children: [
        if (myTodos.isEmpty)
          const Center(
            child: Text("No Todos at the moment"),
          ),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateTodos()));
          },
          child: const Icon(Icons.add),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
