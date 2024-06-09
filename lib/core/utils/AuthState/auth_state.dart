import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_cam_app/Features/Auth/presentation/AuthView.dart';
import 'package:eye_cam_app/Features/HomePage/presentation/HomePageView.dart';
import 'package:eye_cam_app/Features/support/supports.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/Rooms_Page.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/video_call_page.dart';
import 'package:eye_cam_app/core/Const/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthState {
  static bool isLogin = false;
  static int id = 0;
  static Map<String, dynamic>? data;
  static User? user;
  static bool isHelper = true;
  static String accountType() {
    return isLogin
        ? data!["accountType"]
        : isHelper
            ? "Helper"
            : "Blind";
  }

  static login(String email, String password, context) async {
    try {
      if (email == "admin@eyecam.com" && password == "admin") {
        Get.to(SupporterPage());
      }
      isLogin = true;

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password).then((value) {
        user = FirebaseAuth.instance.currentUser!;
        getData(user!).then((value) =>  {openPage()});
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CherryToast.error(
                title: Text(Texts().noUser!,
                    style: TextStyle(color: Colors.black)))
            .show(context);
      } else if (e.code == 'The supplied auth credential is incorrect') {
        CherryToast.error(
                title: Text(Texts().noUser!,
                    style: TextStyle(color: Colors.black)))
            .show(context);
      }
    }
  }

  static signup(String email, String password, String name, String gender,
      context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        user = FirebaseAuth.instance.currentUser;
        user!.updateDisplayName(name);
        addUser(name, email, password, accountType(),Random.secure().nextInt(999999), gender);
        await login(email, password, context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CherryToast.error(
                title: Text(Texts().weekPassword!,
                    style: TextStyle(color: Colors.black)))
            .show(context);
      } else if (e.code == 'email-already-in-use') {
        CherryToast.error(
                title: Text(Texts().accountExists!,
                    style: TextStyle(color: Colors.black)))
            .show(context);
      }
    } catch (e) {
      print("$e this catch error");
    }
  }

  static Future<void> getData(User user) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    AuthState.data = documentSnapshot.data() as Map<String, dynamic>;
    id = data!["id"];
    print(data);
  }

  static Future<void> addUser(String name, String email, String password,
      String accountType, int id, String gender) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users
        .doc(user!.uid)
        .set({
          "name": name,
          "email": email,
          "password": password,
          "accountType": accountType,
          "id": id,
          "gender": gender
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static logout() async {
    AuthState.isLogin = false;
    await FirebaseAuth.instance.signOut();
    Get.to(() => HomePageView());
    print("$isLogin");
  }

  static Future<void> openPage() async {
    if (accountType() == "Helper") {
      isLogin ? await Get.to(() => Rooms()) : await Get.to(AuthView());
    } else {
      isLogin
          ? await Get.to(() => VideoCallPage(
                  callID: user!.uid,
                  userName: data!["name"],
                  userId: AuthState.data!['id']))!
              .then((value) => {})
          : await Get.to(() => AuthView());
    }
  }

  static uploadRoomInfo(String callID, String gender) {
    Map<String, dynamic> roomInfo = {'callID': callID, 'gender': gender};
    CollectionReference rooms = FirebaseFirestore.instance.collection('rooms');
    rooms.doc(callID).set(roomInfo);
  }

  static getRoomInfo() async {
    FirebaseFirestore.instance
        .collection('rooms')
        .snapshots(includeMetadataChanges: true);
  }

  static deleteRoom(room) async {
    FirebaseFirestore.instance.collection("rooms").doc(room).delete();
  }

  static submitJobForm({
    required String name,
    required String phone,
    required String position,
    required String age,
    required String email,
    required String availblity,
    required String graduatedFrom,
    required String militaryStatus,
    required String whyHire,
    required String whyWorkHere,
    required String goals,
    required String salaryExpectations,
    required String experience,
    required String motivation,
    required String workExperienceRating,
    required String educationRating,
    required String skillsRating,
  }) {
    final currentDate = DateTime.now();
    CollectionReference apps = FirebaseFirestore.instance.collection('jobApps');
    Map<String, dynamic> data = {
      'date': currentDate.toString(),
      'name': name,
      'phone': phone,
      'position': position,
      'age': age,
      'email': email,
      'availblity': availblity,
      'graduatedFrom': graduatedFrom,
      'militaryStatus': militaryStatus,
      'whyHire': whyHire,
      'whyWorkHere': whyWorkHere,
      'goals': goals,
      'salaryExpectations': salaryExpectations,
      'experience': experience,
      'motivation': motivation,
      'workExperienceRating': workExperienceRating,
      'educationRating': educationRating,
      'skillsRating': skillsRating,
    };
    apps.doc(name).set(data);
  }
  static launchURL(String uri) async {
    try {
      if (await canLaunchUrl(Uri.parse(uri))) {
        await launchUrl(Uri.parse(uri));
      } else {}
    } catch (e) {
      print("here $e");
    }
  }
}
