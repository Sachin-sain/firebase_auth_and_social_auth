import 'package:firebase_practice/autscontoller/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpController signUpController=Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:signUpController,
        builder: (SignUpController signUpController ) {
        return  Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             TextFormField(
               controller:signUpController.emailController ,
             ),
              SizedBox(height: 20,),
              TextFormField(
                controller: signUpController.passwordController,
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  signUpController.signUp(context);
                },
                child: Text("Submit"),
              )
            ],
          ),
        );
    } ,

    );
  }
}
