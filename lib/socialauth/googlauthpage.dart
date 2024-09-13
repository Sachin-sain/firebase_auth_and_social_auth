import 'package:firebase_practice/socialauth/googleauthcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  GoogleLoginController googleLoginController=Get.put(GoogleLoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: googleLoginController,
        builder: (GoogleLoginController googleLoginController ) {
        return  Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              GestureDetector(
                onTap: (){
                  googleLoginController.googleLogin(context);
                },
                child: const Text("Login With Google"),
              )
              ],
            ),
          ),
        );
    },

    );}
}
