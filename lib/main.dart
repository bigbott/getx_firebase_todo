import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:getx_todo_example/binding/initial_binding.dart';
import 'package:getx_todo_example/routes.dart';
import 'package:getx_todo_example/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await InitialBinding().dependencies();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp (
     // initialBinding: InitialBinding(),
      initialRoute: Routes.LOGIN,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
