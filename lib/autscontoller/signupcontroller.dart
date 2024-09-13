import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

 final  _auth=FirebaseAuth.instance;

 void signUp(BuildContext context)async{
  await _auth.createUserWithEmailAndPassword(
       email: emailController.text,
       password: passwordController.text,
   ).then((value)=>(){
   Utils.showToast('SignUp Account Sccuessfully');
   }).onError((err,stackTrace)=>(){
 Utils.showToast(err.toString());
   });
  print(_auth.currentUser?.email.toString());

 }

}