import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String? content;
  String? todoId;
  Timestamp? dateCreated;
  bool? done;

  Todo.empty();

  Todo(
    this.content,
    this.todoId,
    this.dateCreated,
    this.done,
  );

  Todo.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    todoId = documentSnapshot.id;
    content = documentSnapshot["content"];
    dateCreated = documentSnapshot["dateCreated"];
    done = documentSnapshot["done"];
  }
}
