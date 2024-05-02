import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_example/controller/auth_controller.dart';
import 'package:getx_todo_example/view/home.dart';
import 'package:getx_todo_example/view/signup.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_authController.user != null) {
        return Home();
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'email',
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password',
                    ),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: const Text("Log In"),
                    onPressed: () async {
                      _authController.login(
                          _emailController.text, _passwordController.text);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    child: const Text("Sign Up"),
                    onPressed: () {
                      Get.to(SignUp());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
