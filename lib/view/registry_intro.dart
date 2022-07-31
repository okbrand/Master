import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblogtest/gen/assets.gen.dart';
import 'package:techblogtest/my_colors.dart';
import 'package:techblogtest/my_strings.dart';
import 'package:techblogtest/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegistryInto extends StatelessWidget {
  const RegistryInto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextTheme textThem = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.tcbot.path,
              height: size.height / 6,
            ),
            SizedBox(
              height: size.height / 20,
            ),
            RichText(
                text:
                    TextSpan(text: MyStrings.welcom, style: textThem.headline4),
                textAlign: TextAlign.center),
            SizedBox(
              height: size.height / 20,
            ),
            ElevatedButton(
              onPressed: () {
                showEmailBottomSheet(context, size, textThem);
              },
              child: Text(
                MyStrings.letsGo,
                style: textThem.headline1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textThem) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: size.height / 2,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(MyStrings.insertYourEmail),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width / 10,
                        size.height / 40, size.width / 10, size.height / 40),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      style: textThem.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "EhsanMosavi2482@gmail.com",
                          hintStyle: textThem.headline5),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                        showActivateCodeModalBottomSheet(
                            context, size, textThem);
                      },
                      child: const Text(MyStrings.goNext))
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> showActivateCodeModalBottomSheet(
      BuildContext context, Size size, TextTheme textThem) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: size.height / 2,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(MyStrings.activateCode),
                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width / 10,
                        size.height / 40, size.width / 10, size.height / 40),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      style: textThem.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "*********", hintStyle: textThem.headline5),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyCats(),));
                      }, child: const Text(MyStrings.goNext))
                ],
              ),
            ),
          );
        });
  }
}
