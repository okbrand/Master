import 'package:flutter/material.dart';
import 'package:techblogtest/models/fack_data.dart';
import 'package:techblogtest/my_colors.dart';
import 'package:techblogtest/my_strings.dart';
import 'package:techblogtest/view/home_screen.dart';
import 'package:techblogtest/view/profile_screen.dart';
import '../gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  int selectIndexPage=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 15;

    TextTheme textTheme = Theme.of(context).textTheme;
    
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SolidColors.lightColor,
        title: MyAppBar(size: size),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: Positioned.fill(
                    child: IndexedStack(
                      index: selectIndexPage,
                      children: [
                        HomeScreen(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
                        ProfileScreen(size: size, bodyMargin: bodyMargin, textTheme: textTheme)
                      ],
                    ) 
                )),
            ButtonNavigation(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme, changeScreenPage: (int value){
                  setState(() {
                    selectIndexPage=value;
                  },);
            }),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.menu,
          size: 40,
          color: SolidColors.darkColor,
        ),
        Image.asset(
          Assets.images.logo.path,
          height: size.height / 14,
        ),
        const Icon(Icons.search, size: 40, color: SolidColors.darkColor),
      ],
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
    required this.changeScreenPage,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;
  final Function(int) changeScreenPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: size.height / 10,
        foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColors.bottomNavBackgroand,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    colors: GradiantColors.bottomNav,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      
                      changeScreenPage(0);
                    },
                    icon: Image.asset(
                      Assets.icons.home.path,
                      color: SolidColors.lightColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Assets.icons.write.path,
                      color: SolidColors.lightColor,
                    )),
                IconButton(
                    onPressed: () {
                      
                        changeScreenPage(1);
                      
                    },
                    icon: Image.asset(
                      Assets.icons.user.path,
                      color: SolidColors.lightColor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
