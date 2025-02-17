import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newtr_application/presentation/resources/assets_manager.dart';
import 'package:newtr_application/presentation/resources/color_manager.dart';
import 'package:newtr_application/presentation/resources/constants_manager.dart';
import 'package:newtr_application/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay(){
    _timer= Timer(const Duration(seconds: AppConstants.splashDelay), _getNext);
  }
  _getNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute );
  }
  @override
   void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: ColorManager.slateGray,
     body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo),),),
    );
  }
  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }
}