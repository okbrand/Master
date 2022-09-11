import 'package:flutter/material.dart';
import '../componnents/my_component.dart';
import '../componnents/my_strings.dart';
import '../gen/assets.gen.dart';
import '../componnents/my_colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(right: size.width / 100, left: size.width / 100),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            //ImageAvatar
            Image.asset(
              Assets.images.profileAvatar.path,
              height: size.height / 6,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            //BluPen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.bluePen.path),
                  color: SolidColors.colorTitle,
                ),
                SizedBox(
                  width: size.width / 40,
                ),
                TextButton(onPressed: () {

                },
                  child:Text
                  (MyStrings.imageProfileEdit,style: textTheme.headline3,),

                ),
              ],
            ),
            SizedBox(height: size.height/15,),




            MyDivider(size: size),

            SizedBox(

              width: size.width,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    MyStrings.viewHotestBlog,
                    style: textTheme.headline3,
                  )),
            ),
            MyDivider(size: size),

            SizedBox(

              width: size.width,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.headline3,
                  )),
            ),
            MyDivider(size: size),

            SizedBox(

              width: size.width,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.headline3,
                  )),
            ),
            SizedBox(height: size.height/10,)
          ],
        ),
      ),
    );
  }
}
