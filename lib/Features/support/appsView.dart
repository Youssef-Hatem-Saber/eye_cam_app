import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_cam_app/Features/support/appview.dart';
import 'package:eye_cam_app/core/Const/texts.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:eye_cam_app/generated/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class appsView extends StatefulWidget {
  @override
  _appsViewState createState() => _appsViewState();
}

class _appsViewState extends State<appsView> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('jobApps').snapshots();
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
                      child: const Text(
                        "this all applications",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Card(
                            child: ListTile(
                                title: Text(
                                  data['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                subtitle: Text(
                                  data['position'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                onTap: () {
                                  Get.to(appView(
                                    name: data['name'],
                                    phone: data['phone'],
                                    position: data['position'],
                                    age: data['age'],
                                    email: data['email'],
                                    militaryStatus: data['militaryStatus'],
                                    goals: data['goals'],
                                    graduatedFrom: data['graduatedFrom'],
                                    motivation: data['motivation'],
                                    experience: data['experience'],
                                    whyWorkHere: data['whyWorkHere'],
                                    whyHire: data['whyHire'],
                                    salaryExpectations:
                                        data['salaryExpectations'],
                                    avability: data['avability'],
                                    date: data['date'],
                                  ));
                                }),
                          );
                        }).toList(),
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
