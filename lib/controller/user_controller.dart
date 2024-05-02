import 'package:get/get.dart';
import 'package:getx_todo_example/controller/auth_controller.dart';
import 'package:getx_todo_example/model/user.dart';
import 'package:getx_todo_example/service/user_service.dart';

class UserController extends GetxController {

  final UserService userService;

  UserController({required this.userService});

  final Rx<User> _user = User().obs;

  User get user => _user.value;

  set user(User value) => _user.value = value;

  @override
  void onInit() {
    final authController = Get.find<AuthController>();
    if (authController.user != null){
      getUser(authController.user!.uid).then((value) => user = value);
    }
    super.onInit();
  }

  void clear() {
    _user.value = User();
  }

  Future<bool> createNewUser(User user) async {
    return await userService.createNewUser(user);
  }

  Future<User> getUser(String uid) async {
    return await userService.getUser(uid);
  }
}
