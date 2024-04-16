import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/video_call_page.dart';
import 'package:eye_cam_app/core/Const/texts.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rooms extends StatefulWidget {
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('rooms').snapshots();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        }

        return Scaffold(
          body: SizedBox.expand( // Set the size of Scaffold to fill the entire screen
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/images/background.jpg"),
                  fit: BoxFit.fill, // Make the image fill the entire DecoratedBox
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
                      child: const Text("They need help",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                          return Card(
                            child: ListTile(
                              title: const Text("I need help",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              subtitle: Row(
                                children: [
                                  const Text("help me",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  IconButton(
                                    onPressed: () {
                                      Get.to(
                                        VideoCallPage(
                                          callID: data['callID'],
                                          userName:" ${user!.displayName}",
                                          userId: AuthState.data!["id"],
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.videocam_sharp),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all( SizeConfig.defultSize! *3),
                      child: CustomButtonAndIcon(
                        text: Texts().logout!,
                        icon: Icons.logout,
                        onPressed: () {
                          AuthState.logout();
                        },
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
