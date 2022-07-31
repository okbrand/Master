import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblogtest/my_colors.dart';

import '../gen/assets.gen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Future.delayed(const Duration(seconds: 1)).then((value) =>
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
  const MainScreen()
  ))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.logo.path,
            height: 64,
          ),
          const SizedBox(height: 50,),
          const SpinKitFoldingCube(
            color: SolidColors.primeryColor,
            size: 40.0,
          )
        ],
      ),
    );
  }
}
