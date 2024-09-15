import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_practice/reatimedatabase/databasecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';

class GetPost extends StatefulWidget {
  const GetPost({super.key});
  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  DataBaseController dataBaseController=Get.put(DataBaseController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: dataBaseController,
        builder:(DataBaseController dataBaseController ){
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 60,),
              ///Serachfilter
              TextFormField(
                controller: dataBaseController.searchController,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder()
                ),
                onChanged: (String value){
                  setState(() {

                  });
                },

              ),
              const SizedBox(height: 30,),
              ///using firebaseanimatedlist
              Expanded(
                child: FirebaseAnimatedList(
                  query: dataBaseController.databaseRef,
                  defaultChild: const Text('Loading....'),
                  itemBuilder: ( context,  snapshot,  animation, int index) {
                    final title=snapshot.child('name').value.toString();
                    final id= Text(snapshot.child('id').value.toString());
                    if(dataBaseController.searchController.text.isEmpty){
                      return ListTile(
                        title: Text(snapshot.child('id').value.toString()),
                        subtitle: Text(snapshot.child('name').value.toString()),
                        ///for update and delete
                        trailing: PopupMenuButton(
                            icon: const Icon(Icons.more_vert,),
                            itemBuilder: ( context) => [
                              PopupMenuItem(
                                  value:1,
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.pop(context);
                                      showMyDialog(context, title, id.toString());
                                    },
                                    title: const Text('Edit'),
                                    leading: const Icon(Icons.edit),
                                  )),
                              PopupMenuItem(
                                  value:1,
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.pop(context);
                                      dataBaseController.databaseRef.child(snapshot.child('id').value.toString()).remove();

                                    },
                                    title: const Text('Delete'),
                                    leading: const Icon(Icons.delete),
                                  )
                              ),

                            ]
                        ),
                      );
                    }else if(title.toLowerCase().contains(dataBaseController.searchController.text.toLowerCase().toString())){
                      return ListTile(
                        title: Text(snapshot.child('id').value.toString()),
                        subtitle: Text(snapshot.child('name').value.toString()),
                      );
                    }else{
                      return const SizedBox();
                    }
                  },

                ),
              ),
            ],
          ),
          ///using Streambuilder
          // body: StreamBuilder(
          //   stream: dataBaseController.databaseRef.onValue,
          //   builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
          //     if(!snapshot.hasData){
          //       return const Center(child: CircularProgressIndicator(),);
          //     }else{
          //       Map <dynamic, dynamic> map=snapshot.data?.snapshot.value as dynamic ;
          //       List <dynamic> lst=[];
          //       lst.clear();
          //       lst=map.values.toList();
          //       return ListView.builder(
          //           itemCount: snapshot.data?.snapshot.children.length,
          //           itemBuilder: (BuildContext context, int index){
          //             return ListTile(
          //               title: Text(lst[index]['id'].toString()),
          //               subtitle: Text(lst[index]['name'].toString()),
          //             );
          //           });
          //
          //     }
          // },)
        );

        }

        );

  }

  ///delete and update
  showMyDialog(BuildContext context, String title, String id) async {
    dataBaseController.editingController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update"),
          content: TextFormField(
            controller: dataBaseController.editingController,
            decoration: const InputDecoration(hintText: "Edit Here"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                dataBaseController.databaseRef.child(id).update({
                  // Change 'title' to 'name'
                  'name': dataBaseController.editingController.text.toString(),
                }).then((value) {
                  Utils.showToast("Post updated successfully");
                }).onError((error, stackTrace) {
                  Utils.showToast(error.toString());
                });
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

}

