import 'package:firebase_practice/firestoredatabse/firestoredatabsecontooller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireBaseAddPage extends StatefulWidget {
  const FireBaseAddPage({super.key});

  @override
  State<FireBaseAddPage> createState() => _FireBaseAddPageState();
}

class _FireBaseAddPageState extends State<FireBaseAddPage> {
  FireStoreController fireStoreController = Get.put(FireStoreController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireStoreController>(
      init: fireStoreController,
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding to the entire column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    maxLines: 4,
                    controller: fireStoreController.emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your post',
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      fireStoreController.addData(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50, // Specify a fixed height
                      width: double.infinity, // Set width to take full screen width
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                      ),
                      child: const Text(
                        "Add Post",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
