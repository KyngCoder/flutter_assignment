import 'package:cruddd_operation/todo_item.dart';
import 'package:flutter/material.dart';

class CreateTodos extends StatefulWidget {
  const CreateTodos({super.key});

  @override
  State<CreateTodos> createState() => _CreateTodosState();
}

class _CreateTodosState extends State<CreateTodos> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void addNewItem() {
    final id = DateTime(2000).millisecondsSinceEpoch;
    final newTodo = TodoItem(
        title: titleController.text,
        description: descriptionController.text,
        id: id.toString());

    print(newTodo);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Title"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "description"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(300, 50)),
              onPressed: addNewItem,
              child: const Text("Add new Todo"))
        ],
      ),
    );
  }
}
