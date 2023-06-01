import 'package:coupino_api_call_usingget/controllers/coupino_controller.dart';
import 'package:coupino_api_call_usingget/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class CoupinoHomeScreen extends StatelessWidget {
  CoupinoHomeScreen({Key? key}) : super(key: key);

  final CoupinoController coupinoController = Get.put(CoupinoController());
  String baseUrl = 'https://coupinos-app.azurewebsites.net';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 25,
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu-JxuDBGV26p7Q2Tq-3L9By2CGBrixYvtKg&usqp=CAU'),
          ),
          title: const Text("Coupinos-Post-Get Using Getx", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 13),),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 20, color: Colors.black,)),
            const SizedBox(width: 1,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications, size: 20, color: Colors.black,)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Aboard !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, ),),
              Expanded(
                child: Obx(() => ListView.builder(
                        itemCount: coupinoController.postDet.length,
                        itemBuilder: (context, index) {
                          // return Text(
                          //     coupinoController.postDet[index].postedBy.firstName);
                          return Column(
                            children: [
                              SizedBox(height: 10,),
                                //Image.network(baseUrl+'${coupinoController.postDet[index].postedBy.profilePicUrl}', width: 100, height: 100,),
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 50,
                                backgroundImage: NetworkImage(baseUrl+'${coupinoController.postDet[index].postedBy.profilePicUrl}'),
                              ),
                              SizedBox(height: 8,),
                              Text('Name: '+coupinoController.postDet[index].postedBy.firstName+"  "+coupinoController.postDet[index].postedBy.lastName,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.teal),
                              ),
                              SizedBox(height: 8,),
                              Text("Post Id: "+coupinoController.postDet[index].id, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                              SizedBox(height: 8,),
                              Text('User Id: '+coupinoController.postDet[index].postedBy.userId,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(height: 8,),
                              Text("Address: "+coupinoController.postDet[index].address, style: TextStyle(fontSize: 15),),
                              SizedBox(height: 8,),
                              Text('Created At: '+'${coupinoController.postDet[index].createdAt.day}'+'/'+'${coupinoController.postDet[index].createdAt.month}'+'/'+'${coupinoController.postDet[index].createdAt.year}',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 10,),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Status: " +coupinoController.postDet[index].status),
                                    SizedBox(width: 5,),
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 5,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text('Type: '+ coupinoController.postDet[index].type),
                              SizedBox(height: 8,),
                              Text('PostAuthor: '+coupinoController.postDet[index].postAuthor)
                            ],
                          );
                        }
                    ),
                ),

              )
            ],
          ),
        )
    );
  }

  }
