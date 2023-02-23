import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_conteoller.dart';


class HomeScreen extends GetView<ProfileController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data = controller.allProfileList.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.cyan,
      ),
      body: Obx(() {
        if (controller.loader.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.allProfileList.value.length,
                  // itemCount: controller.allProfileListData.value.length,
                  itemBuilder: (context, index) {

                    var data = controller.allProfileList.value[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(controller.allProfileListData.value.length.toString()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                   width: size.width*.3,
                                    child:const Text("Page No", style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  SizedBox(
                                    width: size.width*0.01,
                                    child:const Text(":", style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Text(" ${data.page}",
                                    style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                   width: size.width*.3,
                                    child:const Text("Total Data", style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  SizedBox(
                                    width: size.width*0.01,
                                    child:const Text(":", style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                  Text(" ${data.total}",
                                    style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25,),
                              const Text("Support Data:",style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                              ),),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   SizedBox(
                                    width: size.width*.11,
                                    child:const Text("Url", style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                  SizedBox(
                                    width: size.width*.02,
                                    child:const Text(":", style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                  Expanded(
                                    child: Text("${data.support!.url}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          // fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   SizedBox(
                                    width: size.width*.11,
                                    child:const Text("Text ", style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                  SizedBox(
                                    width: size.width*.02,
                                    child:const Text(":", style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                  Expanded(
                                    child: Text("${data.support!.text}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          // fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Text(data.support!.text.toString()),
                              // Text(data.data!.length.toString()),
                              // Text(controller.allProfileListData.value.length.toString()),
                              // Text(data.data.toString()),
                            ],
                          ),

                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  // itemCount:6,
                  itemCount: controller.allProfileList.value.length,
                  // controller.allProfileList.value.length,
                  itemBuilder: (context, index) {
                    var dataProfile = data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Data List:",style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w600
                          ),),
                            ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount:dataProfile.data!.length,
                            itemBuilder: (context, index) {
                              var dataProfileList = dataProfile.data![index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Container(
                                    // height:200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(dataProfileList.avatar.toString()),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                      // child: Image.network(dataProfileList.avatar.toString())),
                                ),
                                title: Text(dataProfileList.email.toString()),
                                trailing: Text(dataProfileList.id.toString()),
                              );
                              //   Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Card(
                              //     elevation: 5,
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(15.0),
                              //       child: Column(
                              //         mainAxisAlignment: MainAxisAlignment.start,
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //
                              //           Row(
                              //             mainAxisAlignment: MainAxisAlignment.start,
                              //             children: [
                              //               SizedBox(
                              //                 width: size.width*.13,
                              //                 child:const Text("Id", style: TextStyle(
                              //                     fontSize: 19,
                              //                     fontWeight: FontWeight.w600
                              //                 ),),
                              //               ),
                              //               SizedBox(
                              //                 width: size.width*.02,
                              //                 child:const Text(":", style: TextStyle(
                              //                     fontSize: 19,
                              //                     fontWeight: FontWeight.w600
                              //                 ),),
                              //               ),
                              //               Expanded(
                              //                 child: Text(dataProfileList.id.toString(),
                              //                   style: const TextStyle(
                              //                     fontSize: 17,
                              //                     // fontWeight: FontWeight.w500
                              //                   ),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //           Row(
                              //             mainAxisAlignment: MainAxisAlignment.start,
                              //             crossAxisAlignment: CrossAxisAlignment.start,
                              //             children: [
                              //               SizedBox(
                              //                 width: size.width*.13,
                              //                 child:const Text("Email ", style: TextStyle(
                              //                     fontSize: 19,
                              //                     fontWeight: FontWeight.w600
                              //                 ),),
                              //               ),
                              //               SizedBox(
                              //                 width: size.width*.02,
                              //                 child:const Text(":", style: TextStyle(
                              //                     fontSize: 19,
                              //                     fontWeight: FontWeight.w600
                              //                 ),),
                              //               ),
                              //               Expanded(
                              //                 child: Text(dataProfileList.email.toString(),
                              //                   style: const TextStyle(
                              //                     fontSize: 17,
                              //                     // fontWeight: FontWeight.w500
                              //                   ),
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //           // Image.network(dataProfileList.avatar.toString()),
                              //           Row(
                              //             mainAxisAlignment: MainAxisAlignment.start,
                              //             crossAxisAlignment: CrossAxisAlignment.start,
                              //             children: [
                              //               Image.network(dataProfileList.avatar.toString()
                              //               // SizedBox(
                              //               //   width: size.width*.14,
                              //               //   child:const Text("Image ", style: TextStyle(
                              //               //       fontSize: 19,
                              //               //       fontWeight: FontWeight.w600
                              //               //   ),),
                              //               // ),
                              //               // SizedBox(
                              //               //   width: size.width*.02,
                              //               //   child:const Text(":", style: TextStyle(
                              //               //       fontSize: 19,
                              //               //       fontWeight: FontWeight.w600
                              //               //   ),),
                              //               // ),
                              //               // Expanded(
                              //               //   child: )
                              //               ),
                              //             ],
                              //           ),
                              //           // Text(controller.allProfileListData.value.length.toString()),
                              //           // Text(dataProfileList.id.toString()),
                              //           // Text(dataProfileList.id.toString()),
                              //           // Text(dataProfileList.email.toString()),
                              //           // Text(dataProfileList.avatar.toString()),
                              //         ],
                              //       ),
                              //
                              //     ),
                              //   ),
                              // );
                            }
                            ),
                              // Text(controller.allProfileList.value.data!.length.toString()),

                            ],
                          ),

                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}