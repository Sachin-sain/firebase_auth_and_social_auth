import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';
import '../verification.dart';

class LoginMobileController extends GetxController{
  TextEditingController phoneController=TextEditingController();
  final _auth=FirebaseAuth.instance;
  void loginWithMobile(BuildContext context)async{
    _auth.verifyPhoneNumber(
        phoneNumber:"+91 ${phoneController.text.toString()}",
        verificationCompleted: (_){
        },
        verificationFailed: (e){
          Utils.showToast(e.toString());
        },
        codeSent:(String verificationId, int? token) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationCode(verificationId: verificationId,)));

        },
        codeAutoRetrievalTimeout: (e){
          Utils.showToast(e.toString());
        }
    );


  }

}