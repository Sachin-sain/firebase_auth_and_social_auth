import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DataBaseController extends GetxController{
  TextEditingController postController=TextEditingController();
  TextEditingController searchController=TextEditingController();
  TextEditingController editingController=TextEditingController();
  final databaseRef=FirebaseDatabase.instance.ref('post');
  String id=DateTime.now().microsecondsSinceEpoch.toString();



  Future<void> addPost(BuildContext context) async {
    try {
      await databaseRef.child(id).set({
        'id': id,
        'name': postController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post added successfully!')),
      );
      postController.clear();
    } catch (error) {
      print(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add post: $error')),
      );
    }
  }





}
