import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final _auth=FirebaseAuth.instance;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  String email='sachinboxfy@gmail.com';
  String emailLink='https://mail.google.com/mail/u/0/#search/sachinboxfy%40gmail.com';

///Anonmys Method
//   void login(BuildContext context)async{
//     await _auth.signInAnonymously().then((value)=>(){
//       print(value.toString());
//     }).onError((err,stacktrace)=>(){
//       print(err.toString());
//     });
//   }
///sign in with email and password
void login(BuildContext context)async{
  await _auth.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
  ).then((value)=>(){
    Utils.showToast("Succes Login");
    print(_auth.currentUser?.email?.toString());
  }).onError((err,stackTrace)=>(){
    Utils.showToast(err.toString());
  });


}
  ///login with email link
// void login(BuildContext context)async{
//   await _auth.signInWithEmailLink(
//       email: email.toString(),
//       emailLink: emailLink.toString());
//   print(email.toString());
//   print(emailLink.toString());
// }
///
// void login(BuildContext context)async{
//   _auth.isSignInWithEmailLink(emailLink,);
//
// }

}