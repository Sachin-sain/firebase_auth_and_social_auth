import 'package:firebase_practice/autscontoller/forgotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotController forgotController=Get.put(ForgotController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: forgotController,
        builder: (ForgotControllerforgotController ){
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: (){
                      forgotController.forgotPassword(context);
                    },
                    child: const Text("ForgotPassword"),
                  ),

                )

              ],
            ),
          );
        }
    );
  }
}
