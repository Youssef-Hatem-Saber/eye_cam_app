import 'package:eye_cam_app/Features/HomePage/presentation/HomePageView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif/gif.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  GifController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(
      vsync: this,
    );
    _controller!.duration = const Duration(seconds: 2);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller!.forward();
      _controller!.addListener(_checkIfCompleted);
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _checkIfCompleted() {
    if (_controller!.isCompleted) {
      _controller!.removeListener(_checkIfCompleted);
      Get.off(()=>const HomePageView());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Gif(
          image: const AssetImage(
            'asset/images/splash.gif',
          ),
          autostart: Autostart.once,
          controller: _controller,
          placeholder: (context) => const CircularProgressIndicator(),
          onFetchCompleted: () {},
        ),
      ),
    );
  }
}
