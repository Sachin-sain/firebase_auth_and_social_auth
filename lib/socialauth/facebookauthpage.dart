import 'package:firebase_practice/socialauth/facebookauthcontrlller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceBookLogin extends StatefulWidget {
  const FaceBookLogin({super.key});

  @override
  State<FaceBookLogin> createState() => _FaceBookLoginState();
}

class _FaceBookLoginState extends State<FaceBookLogin> {
  FaceBookAuthController faceBookAuthController=Get.put(FaceBookAuthController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: faceBookAuthController,
        builder: (FaceBookAuthController faceBookAuthController) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    faceBookAuthController.loginWithFaceBook(context);
                  },
                  child: const Text("Login with facebook"),
                )
              ],
            ),
          ),

        );
        },

    );
  }
}
