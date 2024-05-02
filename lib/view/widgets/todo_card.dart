import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_example/controller/todo_controller.dart';
import 'package:getx_todo_example/model/todo.dart';

class TodoCard extends StatelessWidget {
  final String uid;
  final Todo todo;

  const TodoCard({ Key? key, required this.uid, required this.todo}) : super(key: key);

  TodoController get todoController => Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                todo.content ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: todo.done ?? false,
              onChanged: (newValue) {
                todoController.updateTodo(newValue!, uid, todo.todoId!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
