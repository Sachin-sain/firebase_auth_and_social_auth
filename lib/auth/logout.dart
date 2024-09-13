import 'package:firebase_practice/autscontoller/logoutcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  LogoutController logoutController=Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: logoutController,
        builder: (LogoutController logoutController ) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: (){
                    logoutController.logout(context);
                  },
                  child: Text("Logout"),
                ),
              )
            ],
          ),
        );
    },

    ); }
}
