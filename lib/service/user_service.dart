
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_todo_example/model/user.dart';



class UserService {

  static UserService? _instance;
  UserService._();
  factory UserService()  => _instance ??= UserService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(User user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<User> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();

      return User.fromDocumentSnapshot(documentSnapshot: doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}