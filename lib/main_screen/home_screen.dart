import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../componnents/my_component.dart';
import '../componnents/my_strings.dart';
import '../gen/assets.gen.dart';
import '../models/fack_data.dart';
import '../componnents/my_colors.dart';
import '../controller/home_screen_controller.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    late List myList=listTags;
    return SingleChildScrollView(
      child: Obx(()=>
          Container(
          padding:
              EdgeInsets.only(right: size.width / 100, left: size.width / 100),
          decoration: const BoxDecoration(color: Colors.white),
          child: homeScreenController.loading.value== false?Column(
            children: [
              //PosterHomePage
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: homeScreenController.poster.value.image!,
                    imageBuilder: (context, imageProvider) {
                      return  Container(
                          foregroundDecoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(
                                  colors: GradiantColors.homePosterCoverGradiant,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          height: size.height / 4.20,
                          width: size.width / 1.19,
                          decoration: BoxDecoration(
                              color: SolidColors.darkColor,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image:
                                  imageProvider,
                                  fit: BoxFit.cover)));
                    },
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.image_not_supported_outlined,size: 50,color: Colors.grey,);
                    },
                    placeholder: (context, url) {
                      return MySpinKit();
                    },

                  ),
                  //TextInPoster
                  Positioned(
                      bottom: 10,
                      right: 0,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '',
                              ),
                              Row(
                                children: [
                                  Text(homePagePosterDataMap["view"],
                                      style: textTheme.subtitle1),
                                  const Icon(
                                    Icons.remove_red_eye,
                                    size: 20,
                                    color: SolidColors.posterSubTitle,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: size.width / 12),
                            child: Text(homeScreenController.poster.value.title!,
                                style: textTheme.headline1),
                          ),
                        ],
                      )),
                ],
              ),


              SizedBox(
                height: size.height / 70,
              ),
              //Hashtag
              SizedBox(
                height: size.height / 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeScreenController.tagsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 0, index == 0 ? bodyMargin : 10, 0),
                      child: WidgetLIstHashTag(
                        size: size, index: index, textTheme: textTheme,myList: myList,myGradiantColors: GradiantColors.tags,colorTextAndIcon: SolidColors.lightColor,),
                    );
                  },
                ),
              ),

              SizedBox(
                height: size.height / 30,
              ),
              //bluePen
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: size.width / 15)),
                  ImageIcon(
                    AssetImage(Assets.icons.bluePen.path),
                    color: SolidColors.colorTitle,
                  ),
                  SizedBox(
                    width: size.width / 40,
                  ),
                  Text(
                    MyStrings.viewHotestBlog,
                    style: textTheme.headline3,
                  ),
                ],
              ),

              SizedBox(
                height: size.height / 70,
              ),
              //listPost
              SizedBox(
                  height: size.height / 5,
                  child: SizedBox(
                    height: size.height / 8,
                    child: Obx(()
                    => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenController.topVisitedList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, index == 0 ? size.width / 15 : 10, 0),
                          height: size.height / 8,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: homeScreenController.topVisitedList[index].image!,


                                    imageBuilder:  (context, imageProvider) {
                                      return Container(
                                        foregroundDecoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                            color: Colors.red,
                                            gradient: LinearGradient(
                                                colors: GradiantColors.blogPost,
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter)),
                                        height: size.height / 8,
                                        width: size.width / 3,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.red,
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return const Icon(Icons.image_not_supported_outlined,size: 50,);
                                    },
                                    placeholder: (context, url) {
                                      return MySpinKit();
                                    },
                                  ),
                                  Positioned(
                                      bottom: size.height / 70,
                                      right: size.width / 70,
                                      left: size.width / 70,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeScreenController.topVisitedList[index].author!.toString(),
                                            style: textTheme.headline2,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                homeScreenController.topVisitedList[index].view!.toString(),
                                                style: textTheme.headline2,
                                              ),
                                              const Icon(
                                                Icons.remove_red_eye,
                                                color: SolidColors.posterSubTitle,
                                                size: 16,
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: size.height / 500,
                              ),
                              SizedBox(
                                  height: size.height / 15,
                                  child: SizedBox(
                                      width: size.width / 3,
                                      child: Text(
                                        homeScreenController.topVisitedList[index].title!.toString(),
                                        style: textTheme.headline4,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )))
                            ],
                          ),
                        );
                      },
                    ),
                    ),
                  )),
              SizedBox(
                height: size.height / 90,
              ),
              //microphon
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: size.width / 15)),
                  ImageIcon(
                    AssetImage(Assets.icons.microphon.path),
                    color: SolidColors.colorTitle,
                  ),
                  SizedBox(
                    width: size.width / 40,
                  ),
                  Text(
                    MyStrings.viewHotestPodCasts,
                    style: textTheme.headline3,
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 70,
              ),
              //podcastList
              SizedBox(
                  height: size.height / 5,
                  child: SizedBox(
                    height: size.height / 8,
                    child: Obx(()=> ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenController.topPodcastList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, index == 0 ? size.width / 15 : 10, 0),
                          height: size.height / 8,
                          child: Column(
                            children: [
                              CachedNetworkImage(imageUrl: homeScreenController.topPodcastList[index].poster!.toString(),
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    foregroundDecoration: const BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        color: Colors.red,
                                        gradient: LinearGradient(
                                            colors: GradiantColors.blogPost,
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter)),
                                    height: size.height / 8,
                                    width: size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const MySpinKit( );
                                },
                                errorWidget:(context, url, error) {
                                  return const Icon(Icons.image_not_supported_outlined,size: 50,);
                                },
                              ),
                              SizedBox(
                                height: size.height / 200,
                              ),
                              SizedBox(
                                  height: size.height / 15,
                                  child: SizedBox(
                                      width: size.width / 3,
                                      child: Center(
                                        child: Text(
                                          homeScreenController.topPodcastList[index].title!.toString(),
                                          style: textTheme.headline4,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      )))
                            ],
                          ),
                        );
                      },
                    ),
                    ),
                  )),
              const SizedBox(
                height: 90,
              )
            ],
          ) :const Center(child: MySpinKit()),
        ),
      ),
    );
  }
}


