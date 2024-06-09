import 'package:cherry_toast/cherry_toast.dart';
import 'package:eye_cam_app/Features/videoCall/presentation/video_call_page.dart';
import 'package:eye_cam_app/core/Const/texts.dart';
import 'package:eye_cam_app/core/settings/Settings.dart';
import 'package:eye_cam_app/core/utils/AuthState/auth_state.dart';
import 'package:eye_cam_app/core/utils/sizeConfig.dart';
import 'package:eye_cam_app/core/widgets/CustomButton.dart';
import 'package:eye_cam_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
@override
  void initState() {
  AuthState();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return InternetWidget(
      offline: FullScreenWidget(
        child: Scaffold(
          body: DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesBackground),

              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.signal_wifi_connected_no_internet_4,size: 60,),
                  Text(Texts().noInternet!,style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ),
      ),
      loadingWidget: const Center(child: CircularProgressIndicator()),
      online: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imageHomeBG),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.defultSize! * 5),
                Row(
                  children: [
                    const Spacer(),
                    Flexible(
                      flex: 1,
                      child: CustomGeneralButton(
                        text: Texts().help!,
                        onPressed: () {
                          AuthState.isLogin! ?
                            Get.to(VideoCallPage(callID: "support${AuthState.data!['id']}", userName:AuthState.data!['name'] , userId: AuthState.data!['id']))
                          :
                            CherryToast.error(
                              title: Text("Please login first"),
                            ).show(context);

                        },
                      ),
                    ),
                    SizedBox(width: SizeConfig.defultSize! * 5),
                    Flexible(
                      flex: 1,
                      child: CustomGeneralButton(
                        text: Texts().languageState!,
                        onPressed: () {
                          setState(() {
                            Settings.language == "English"
                                ? Settings.language = "Arabic"
                                : Settings.language = "English";
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.defultSize! * 2,
                        right: SizeConfig.defultSize! * 2,
                        bottom: SizeConfig.defultSize! * 2.5,
                      ),
                      child: CustomButtonTwoText(
                        text: Texts().join!,
                        subText: Texts().subJoin!,
                        onPressed: () async {
                        AuthState.isHelper = true;
                        AuthState.accountType();
                          await AuthState.openPage();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.defultSize! * 2,
                        right: SizeConfig.defultSize! * 2,
                        bottom: SizeConfig.defultSize! * 2.5,
                      ),
                      child: CustomButtonTwoText(
                        text: Texts().desireAssistant!,
                        subText: Texts().subDesireAssistant!,
                        onPressed: () {
                          AuthState.isHelper = false;
                          AuthState.accountType();
                          AuthState.openPage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.defultSize! * 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
