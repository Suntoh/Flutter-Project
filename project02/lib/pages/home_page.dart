import 'package:project02/utils/todo_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ['Learn Flutter', false],
    ['Build a Flutter App', false],
    ['Publish the App', false],
  ];
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void addNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(BuildContext context, int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task deleted'), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoList(
            taskName: toDoList[index][0],
            isDone: toDoList[index][1],
            onChanged: (bool? value) {
              setState(() {
                toDoList[index][1] = value ?? false;
              });
            },
            onDelete: (BuildContext context) {
              deleteTask(context, index);
            },
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new task',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              addNewTask();
            },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
