
import 'package:eye_cam_app/Features/HomePage/presentation/HomePageView.dart';
import 'package:eye_cam_app/core/Const/callInfo.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key, required this.callID, required this.userName, required this.userId});
  final String callID,userName;
  final int userId;
  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  @override
  void initState() {
    super.initState();
    AuthState.uploadRoomInfo(widget.callID);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:ZegoUIKitPrebuiltCall(
          appID: CallInfo.appID,
          appSign: CallInfo.appSign,
          userID:"${widget.userId}" ,
          userName: widget.userName,
          callID: widget.callID,
          onDispose: () {
            AuthState.deleteRoom(widget.callID);
            Get.to(const HomePageView());
          },
          
          plugins: [ZegoUIKitSignalingPlugin()],
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
        )
      ),
    );
  }
}