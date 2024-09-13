import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'messagescreen.dart';
import 'notificationcontroller.dart';

class NotificationPermission extends StatefulWidget {
  const NotificationPermission({super.key});

  @override
  State<NotificationPermission> createState() => _NotificationPermissionState();
}

class _NotificationPermissionState extends State<NotificationPermission> {
  @override
  void initState() {
   notificationController.requestNotificationPermission(context);
   notificationController.getDeviceToken(context);
   // notificationController.firebaseInit(context);
   // notificationController.forgroundMessage();
   // notificationController.setupInteractMessage(context);
   // notificationController.isTokenRefresh();
    super.initState();
  }
  NotificationController notificationController=Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
           onTap:(){
           Get.to(MessageScreen(id: '',));
            },
              
                child: Text("Notification Permission Page")),
          ],
        ),
      ),

    );
  }
}
