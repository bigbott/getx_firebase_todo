import 'package:get/get.dart';
import 'package:getx_todo_example/controller/auth_controller.dart';
import 'package:getx_todo_example/model/todo.dart';
import 'package:getx_todo_example/service/todo_service.dart';

class TodoController extends GetxController {
  final TodoService todoService;

  TodoController({required this.todoService});

  Rx<List<Todo>> todoList = Rx<List<Todo>>([Todo.empty()]);

  List<Todo> get todos => todoList.value;

  @override
  void onInit() {
    final authController = Get.find<AuthController>();

    if (authController.user != null) {
      fillTodoList(authController.user!.uid);
    }
    super.onInit();
  }

  void fillTodoList(String uid) {
    todoList
        .bindStream(todoService.todoStream(uid)); //stream coming from firebase
  }

  void clear() {
    todoList.value = [Todo.empty()];
  }

  void addTodo(String content, String uid) async {
    await todoService.addTodo(content, uid);
  }

  void updateTodo(bool newValue, String uid, String todoId) async {
    await todoService.updateTodo(newValue, uid, todoId);
  }
}
