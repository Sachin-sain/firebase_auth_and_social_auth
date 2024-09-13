import 'package:firebase_practice/autscontoller/loginmobilecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginWithMobile extends StatefulWidget {
  const LoginWithMobile({super.key});

  @override
  State<LoginWithMobile> createState() => _LoginWithMobileState();
}

class _LoginWithMobileState extends State<LoginWithMobile> {
  LoginMobileController loginMobileController=Get.put(LoginMobileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
       init: loginMobileController,
        builder: (LoginMobileController loginMobileController ){
         return Scaffold(
           body: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               TextFormField(
                 controller: loginMobileController.phoneController,
               ),
               SizedBox(height: 20,),
               GestureDetector(
                 onTap: (){
                   loginMobileController.loginWithMobile(context);
                 },
                 child: Text("Login"),
               )

             ],
           ),
         );

        }
    );
  }
}
