import 'package:get/get.dart';
import 'package:getx_todo_example/controller/auth_controller.dart';
import 'package:getx_todo_example/controller/todo_controller.dart';
import 'package:getx_todo_example/controller/user_controller.dart';
import 'package:getx_todo_example/service/auth_service.dart';
import 'package:getx_todo_example/service/todo_service.dart';
import 'package:getx_todo_example/service/user_service.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<AuthController>(()async =>  AuthController(authService: AuthService()),
        permanent: true);
    Get.put<UserController>(UserController(userService: UserService()),
        permanent: true);
    Get.put<TodoController>(TodoController(todoService: TodoService()),
        permanent: true);
  }
}
