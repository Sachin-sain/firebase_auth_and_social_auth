import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
class FaceBookAuthController extends GetxController{
  final _auth=FirebaseAuth.instance;
  void loginWithFaceBook(BuildContext context)async{

    final LoginResult loginResult = await  FacebookAuth.instance.login();

    AuthCredential credential=FacebookAuthProvider.credential(loginResult.accessToken?.tokenString.toString()?? '');

    _auth.signInWithCredential(credential).then((value)=>(){
      Get.snackbar("Com[leted", 'Sucesss');

    }).onError((err, stackTrace)=>(){

      Get.snackbar(err.toString(), 'Errro aagye h',
      backgroundColor: Colors.red);
    });


  }

}