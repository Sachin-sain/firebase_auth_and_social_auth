import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController{
  final _auth=FirebaseAuth.instance;
  void logout(BuildContext context)async{
    await _auth.signOut();
  }
}