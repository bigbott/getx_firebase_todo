
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_todo_example/model/todo.dart';


class TodoService {

  static TodoService? _instance;
  TodoService._();
  factory TodoService()  => _instance ??= TodoService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   Future<void> addTodo(String content, String uid) async {
    try {
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<Todo>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Todo> retVal = [];
      for (var element in query.docs) {
        retVal.add(Todo.fromDocumentSnapshot(element));
      }
      return retVal;
    });
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}