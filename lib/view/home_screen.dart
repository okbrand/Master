
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fack_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
        padding: EdgeInsets.only(
            right: size.width / 100, left: size.width / 100),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            //PosterHomePage
            Stack(
              children: [
                Container(
                    foregroundDecoration: const BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            colors:
                            GradiantColors.homePosterCoverGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    height: size.height / 4.20,
                    width: size.width / 1.19,
                    decoration: BoxDecoration(
                        color: SolidColors.darkColor,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(
                                homePagePosterDataMap["imagePath"]),
                            fit: BoxFit.cover))),
                //TextInPoster
                Positioned(
                    bottom: 10,
                    right: 0,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homePagePosterDataMap["writer"] +
                                  " _ " +
                                  homePagePosterDataMap["dataWrite"],
                              style: textTheme.subtitle1,
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
                          padding:
                          EdgeInsets.only(right: size.width / 12),
                          child: Text(
                              homePagePosterDataMap["title"].toString(),
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
                itemCount: listTags.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, index == 0 ? bodyMargin : 10, 0),
                    child: Container(
                      height: size.height / 20,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradiantColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width / 30,
                          ),
                          ImageIcon(
                            AssetImage(Assets.icons.hashtagicon.path),
                            color: SolidColors.lightColor,
                            size: 17,
                          ),
                          SizedBox(
                            width: size.width / 30,
                          ),
                          Text(
                            listTags[index].title.toString(),
                            style: textTheme.headline1,
                          ),
                          SizedBox(
                            width: size.width / 30,
                          ),
                        ],
                      ),
                    ),
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
                Padding(
                    padding: EdgeInsets.only(right: size.width / 15)),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, index == 0 ? size.width / 15 : 10, 0),
                        height: size.height / 8,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  foregroundDecoration:
                                  const BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Colors.red,
                                      gradient: LinearGradient(
                                          colors: GradiantColors
                                              .blogPost,
                                          begin: Alignment
                                              .bottomCenter,
                                          end:
                                          Alignment.topCenter)),
                                  height: size.height / 8,
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              blogList[index].imageUrl),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    bottom: size.height / 70,
                                    right: size.width / 70,
                                    left: size.width / 70,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          blogList[index].writer,
                                          style: textTheme.headline2,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              blogList[index].views,
                                              style:
                                              textTheme.headline2,
                                            ),
                                            const Icon(
                                              Icons.remove_red_eye,
                                              color: SolidColors
                                                  .posterSubTitle,
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
                                      blogList[index].title,
                                      style: textTheme.headline4,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )))
                          ],
                        ),
                      );
                    },
                  ),
                )),
            SizedBox(
              height: size.height / 90,
            ),
            //microphon
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: size.width / 15)),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: podcastList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, index == 0 ? size.width / 15 : 10, 0),
                        height: size.height / 8,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: size.height / 8,
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(
                                          Radius.circular(20)),
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              podcastList[index]
                                                  .imageUrl),
                                          fit: BoxFit.cover)),
                                ),
                              ],
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
                                        podcastList[index].title,
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
                )),
            const SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}
