import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireStoreController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final id = DateTime.now().microsecondsSinceEpoch.toString();
  final fireStoreDb = FirebaseFirestore.instance.collection('post');

  Future<void> addData(BuildContext context) async {
    try {
      // Adding data to Firestore
      await fireStoreDb.doc(id).set({
        'name': 'Sachin Saini',
        'email': emailController.text.toString(),
      });

      // Clear the text field after successful addition
      emailController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post added successfully!')),
      );
    } catch (error) {
      print(error.toString());
      // Handle error and show failure message
      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(content: Text('Failed to add post: $error')),
      );
    }
  }
}
