import 'package:eye_cam_app/Features/HomePage/presentation/HomePageView.dart';
import 'package:eye_cam_app/core/Const/callInfo.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({
    Key? key,
    required this.callID,
    required this.userName,
    required this.userId,
  }) : super(key: key);

  final String callID, userName;
  final int userId;

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showGenderDialog();
    });
  }
  @override
  void dispose() {
    AuthState.deleteRoom(widget.callID);
    super.dispose();
  }

  Future<void> _showGenderDialog() async {
    await showDialog(
      context: context,
      builder: (context) => Dialog(callID: widget.callID,),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ZegoUIKitPrebuiltCall(
          appID: CallInfo.appID,
          appSign: CallInfo.appSign,
          userID: "${widget.userId}",
          userName: widget.userName,
          callID: widget.callID,
          onDispose: () async {
            AuthState.deleteRoom(widget.callID);
            AuthState.logout();
          },
          plugins: [ZegoUIKitSignalingPlugin()],
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
        ),
      ),
    );
  }

}
class Dialog extends StatefulWidget {
  const Dialog({super.key, required this.callID});
  final callID;
  @override
  State<Dialog> createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  bool male = false, female = false,all=false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: Text('Choose Gender'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: male,
                    onChanged: (value) {
                      setState(() {
                        male = value!;
                        if (value) {
                          female = false;
                          all = false;
                        }
                      });
                    },
                  ),
                  Text('Male'),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: female,
                    onChanged: (value) {
                      setState(() {
                        female = value!;
                        if (value) {
                          male = false;
                          all = false;
                        }
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: all,
                    onChanged: (value) {
                      setState(() {
                        all = value!;
                        if (value) {
                          male = false;
                          female = false;
                        }
                      });
                    },
                  ),
                  Text('All'),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                AuthState.uploadRoomInfo(widget.callID, male ? 'male' : female ?'female' : 'all');
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
  }
}
