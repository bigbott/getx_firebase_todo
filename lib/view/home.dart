import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_example/controller/auth_controller.dart';
import 'package:getx_todo_example/controller/todo_controller.dart';
import 'package:getx_todo_example/controller/user_controller.dart';
import 'package:getx_todo_example/view/widgets/todo_card.dart';

class Home extends StatelessWidget {
   Home({super.key});

   final textController = TextEditingController();

   final  authController = Get.find<AuthController>();
   final  userController = Get.find<UserController>();
   final  todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  Obx (() => Text('welcome ${userController.user.name}')),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a todo title',
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (textController.text != "") {
                        todoController.addTodo(
                            textController.text, authController.user!.uid);
                        textController.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          const Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(()  {
              return Expanded(
                child: ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (_, index) {
                    return TodoCard(
                        uid: authController.user != null ?   authController.user!.uid : '',
                        todo: todoController.todos[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
