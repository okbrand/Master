import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblogtest/componnents/api_constant.dart';
import 'package:techblogtest/componnents/my_colors.dart';
import 'package:techblogtest/componnents/my_component.dart';
import 'package:techblogtest/componnents/my_strings.dart';
import 'package:techblogtest/services/dio_service.dart';
import 'package:techblogtest/view/home_screen.dart';
import 'package:techblogtest/view/profile_screen.dart';
import 'package:techblogtest/view/registry_intro.dart';
import '../gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  RxInt selectIndexPage = 0.obs;
  @override
  Widget build(BuildContext context) {
    DioService().getMethod(ApiConstant.getHomeItems);
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 15;

    TextTheme textTheme = Theme.of(context).textTheme;

    // TODO: implement build

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.lightText,
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.asset(
              Assets.images.logo.path,
              scale: 2,
            )),
            ListTile(
              title: Text(
                "پروفایل کاربری",
                style: textTheme.headline4,
              ),
              onTap: () {},
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),
            ListTile(
              title: Text(
                "درباره تک‌بلاگ",
                style: textTheme.headline4,
              ),
              onTap: () {},
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),
            ListTile(
              title: Text(
                "اشتراک گذاری تک بلاگ",
                style: textTheme.headline4,
              ),
              onTap: () async{
                await Share.share(MyStrings.shareText);
              },
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),
            ListTile(
              title: Text(
                "تک‌بلاگ در گیت هاب",
                style: textTheme.headline4,
              ),
              onTap: () {
                myLauncherUrl(MyStrings.gitHubUrl);
              },
            ),
            Divider(
              color: SolidColors.dividerColor,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.lightColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 40,
                color: SolidColors.darkColor,
              ),
            ),
            Image.asset(
              Assets.images.logo.path,
              height: size.height / 14,
            ),
            const Icon(Icons.search, size: 40, color: SolidColors.darkColor),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Obx(() => IndexedStack(
                    index: selectIndexPage.value,
                    children: [
                      HomeScreen(
                          size: size,
                          bodyMargin: bodyMargin,
                          textTheme: textTheme),
                      const RegistryInto(),
                      ProfileScreen(
                          size: size,
                          bodyMargin: bodyMargin,
                          textTheme: textTheme)
                    ],
                  )),
            ),
            ButtonNavigation(
                size: size,
                bodyMargin: bodyMargin,
                textTheme: textTheme,
                changeScreenPage: (int value) {
                  selectIndexPage.value = value;
                }),
          ],
        ),
      ),
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
                    onPressed: () {
                      changeScreenPage(1);
                    },
                    icon: Image.asset(
                      Assets.icons.write.path,
                      color: SolidColors.lightColor,
                    )),
                IconButton(
                    onPressed: () {
                      changeScreenPage(2);
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
