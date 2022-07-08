import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1.5,
      indent: size.width/6 ,
      endIndent: size.width/6,
      color:SolidColors.dividerColor,
    );
  }
}
