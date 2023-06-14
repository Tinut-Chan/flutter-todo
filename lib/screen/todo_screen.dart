import 'package:flutter/material.dart';
import 'package:flutter_todo/controllers/todo_controller.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  static const id = '/Todo_Screen';

  final TextEditingController textEditingController = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo Item'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: const Text('Add'),
                    onPressed: () {
                      todoController.todos.add(
                        Todo(
                          text: textEditingController.text,
                        ),
                      );
                      Get.back();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
