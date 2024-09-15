import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'databasecontroller.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});
  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  DataBaseController dataBaseController = Get.put(DataBaseController());
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataBaseController>(
      init: dataBaseController,
      builder: (dataBaseController) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Wrap in a container with fixed height
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: dataBaseController.postController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'What is on your mind?',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Remove Expanded and replace with a normal Container
                    GestureDetector(
                      onTap: () {
                        dataBaseController.addPost(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        width: double.infinity,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Post',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
