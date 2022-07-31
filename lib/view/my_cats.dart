import 'package:flutter/material.dart';
import 'package:techblogtest/gen/assets.gen.dart';

class MyCats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(Assets.images.tcbot.path),
        ],
      ),
    );
  }
}
