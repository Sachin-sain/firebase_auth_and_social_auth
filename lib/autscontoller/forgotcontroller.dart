import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController{
  final _auth=FirebaseAuth.instance;

  void forgotPassword(BuildContext context)async{
    await _auth.sendPasswordResetEmail(email: 'sachinboxfy@gmail.com');
  }

}