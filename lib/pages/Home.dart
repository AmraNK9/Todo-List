import 'package:flutter/material.dart';
import '../utli/dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List task = [
    ['to read book', false],
    ['to shop with sor', false]
  ];
  final _controller = TextEditingController();

  void check(int index) {
    setState(() {
      task[index][1] = !task[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
          task.add([_controller.text,false]);
        _controller.clear();
        Navigator.of(context).pop();
    });
  }
  void remove(int index) {
    setState(() {
      task.removeAt(index);
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            IconButton(icon: Icon(Icons.add), onPressed: createNewTask),
        appBar: AppBar(
          title: const Center(child: Text("To do")),
          elevation: 8,
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(task[index][0],
                        style: TextStyle(
                            decoration: task[index][1]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none)),
                    leading: Checkbox(
                      value: task[index][1],
                      onChanged: (value) => check(index),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        remove(index);
                      },
                    ),
                  ),
                );
              }),
        ));
  }
}
