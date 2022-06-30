import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblogtest/main.dart';
import 'package:techblogtest/my_colors.dart';

import 'gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }


}

class MainScreenState extends State<MainScreen> {
  @override

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("data")
        ],
      ),
    );
  }
}
