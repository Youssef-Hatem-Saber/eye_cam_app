import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_cam_app/Features/support/appsView.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/video_call_page.dart';
import 'package:eye_cam_app/core/Const/texts.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:eye_cam_app/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupporterPage extends StatefulWidget {
  @override
  _SupporterPageState createState() => _SupporterPageState();
}

class _SupporterPageState extends State<SupporterPage> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('rooms') .where('callID', arrayContains: ['support'])
      .snapshots();
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
          body: SizedBox.expand(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.defultSize! * 2),
                      child: const Text("they need support",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Expanded(
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                          return Card(
                            child: ListTile(
                              title: const Text("I need support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              subtitle: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.to(
                                        VideoCallPage(
                                          callID: data['callID'],
                                          userName:"Supporter",
                                          userId: Random.secure().nextInt(9999),
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
                        text: Texts().openAppsPage!,
                        icon: Icons.logout,
                        onPressed: () {
                          Get.to(appsView());
                        },
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
