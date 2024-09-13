import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginController extends GetxController{
  final _auth=FirebaseAuth.instance;

  void googleLogin(BuildContext context)async{

    GoogleSignInAccount? googleUSer=await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth=await googleUSer?.authentication;

    AuthCredential credential=GoogleAuthProvider.credential(
      accessToken:googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

  await _auth.signInWithCredential(credential).then((value)=>(){
     print(value.credential?.token.toString());
     print(value.credential?.accessToken.toString());
  }).onError((err,stackTrace)=>(){
    Utils.showToast(err.toString());

  });

  }
}