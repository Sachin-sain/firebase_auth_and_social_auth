import 'package:firebase_practice/autscontoller/loginemailcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
         init:loginController ,
        builder: (LoginController loginController){
           return Scaffold(
         body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               TextFormField(
                 controller:loginController.emailController ,
               ),
               SizedBox(height: 20,),
               TextFormField(
                 controller: loginController.passwordController,
               ),
               SizedBox(height: 20,),
               GestureDetector(
                 onTap: (){
                loginController.login(context);
                 },
                 child: Text("Submit"),
               )
             ],
           ),
           );
        }
    );
  }
}
