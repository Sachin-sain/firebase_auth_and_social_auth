import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  final Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('post').snapshots();
  final fireStoreDb = FirebaseFirestore.instance.collection('post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: ref,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      var doc = snapshot.data?.docs[index];

                      return ListTile(
                        onTap: () {
                          // /// Update document using document ID
                          // fireStoreDb.doc(doc?.id).update({
                          //   'name': 'Nazim',
                          // }).then((value) {
                          //   Utils.showToast("Update successful");
                          // }).onError((err, stackTrace) {
                          //   Utils.showToast("Update failed: $err");
                          // });

                          /// Delete document using document ID
                          fireStoreDb.doc(doc?.id).delete().then((value) {
                            Utils.showToast("Delete successful");
                          }).onError((err, stackTrace) {
                            Utils.showToast("Delete failed: $err");
                          }
                          );
                        },
                        title: Text(doc?['name'] ?? ''),
                        subtitle: Text(doc?['email'] ?? ''),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
