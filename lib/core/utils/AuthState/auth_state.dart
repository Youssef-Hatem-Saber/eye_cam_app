import 'dart:math';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eye_cam_app/Features/Auth/presentation/AuthView.dart';
import 'package:eye_cam_app/Features/HomePage/presentation/HomePageView.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/Rooms_Page.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/video_call_page.dart';
import 'package:eye_cam_app/core/Const/texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthState {
  static bool isLogin = false;
  static int id = 0;
  static Map<String, dynamic>? data;
  static User? user;
  static bool isHelper = true;
  static String accountType() {
      return isLogin ? data!["accountType"] : isHelper ? "Helper" : "Blind";
  }

  static login(String email, String password,context) async {
    try {
      isLogin = true;
    await FirebaseAuth
          .instance.signInWithEmailAndPassword(email: email, password: password);
      user = FirebaseAuth.instance.currentUser!;
      getData(user!);
      openPage();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CherryToast.error(
            title:  Text(Texts().noUser!, style: TextStyle(color: Colors.black))
        ).show(context);
      } else if (e.code == 'wrong-password') {
        CherryToast.error(
            title:  Text(Texts().noUser!, style: TextStyle(color: Colors.black))
        ).show(context);
      }
    }
  }

  static signup(String email, String password, String name,context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) async{
      user = FirebaseAuth.instance.currentUser;
      user!.updateDisplayName(name);
      addUser(name, email, password, accountType(), true, Random.secure().nextInt(999999));
      await login(email, password,context);
      openPage();
      });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CherryToast.error(
            title:  Text(Texts().weekPassword!, style: TextStyle(color: Colors.black))
        ).show(context);

      } else if (e.code == 'email-already-in-use') {
        CherryToast.error(
            title:  Text(Texts().accountExists!, style: TextStyle(color: Colors.black))
        ).show(context);

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


  static Future<void> addUser(String name, String email, String password, String accountType, bool activeState, int id) async
  {
    CollectionReference users =
    FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;
    users.doc(user!.uid).set({
      "name": name,
      "email": email,
      "password": password,
      "accountType": accountType,
      "id": id,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static logout() async{
    AuthState.isLogin = false;
    await FirebaseAuth.instance.signOut();
    Get.to(() => const HomePageView());
    print("$isLogin");
}
  static Future<void> openPage() async {
    if (accountType() == "Helper") {
      isLogin ? await Get.off(() => Rooms()) : await Get.to(() => AuthView());
    } else {
      isLogin ? await Get.off(() => VideoCallPage(callID: user!.uid, userName: data!["name"], userId: AuthState.data!['id']))!.then((value) => {
        AuthState.uploadRoomInfo(user!.uid)
      }) : await Get.to(() => AuthView());
    }
  }
  static uploadRoomInfo(String callID){
    Map<String,dynamic> roomInfo= {
      'callID' : callID,
    };
    CollectionReference rooms =
    FirebaseFirestore.instance.collection('rooms');
    rooms.add(roomInfo);
  }
  static getRoomInfo() async {
    FirebaseFirestore.instance
        .collection('rooms').
        snapshots(includeMetadataChanges: true);
  }
  static deleteRoom(room) async{
    FirebaseFirestore.instance.collection("rooms").doc(room).delete();
  }
}
