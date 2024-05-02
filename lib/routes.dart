// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:getx_todo_example/view/home.dart';
import 'package:getx_todo_example/view/login.dart';
import 'package:getx_todo_example/view/signup.dart';



class Routes {
  static const LOGIN = '/';
  static const SIGNUP = '/signup';
  static const HOME = '/home';


  static final routes = [
    GetPage(
      name: LOGIN,
      page: () =>  Login(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: SIGNUP,
      page: () =>   SignUp(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: HOME,
      page: () =>   Home(),
      transition: Transition.circularReveal,
    ),
    
  ];
}
