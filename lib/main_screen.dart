import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblogtest/main.dart';
import 'package:techblogtest/models/fack_data.dart';
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin=size.width/15;


    TextTheme _textTheme = Theme.of(context).textTheme;
    // TODO: implement build

    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.only(right: size.width / 100, left: size.width / 100),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            //AppBar
            Row(
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
                const Icon(Icons.search,
                    size: 40, color: SolidColors.darkColor),
              ],
            ),
            //Poster
            SizedBox(
              height: size.height / 100,
            ),
            //PosterHomePage
            Stack(
              children: [
                Container(
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
                                AssetImage(homePagePosterDataMap["imagePath"]),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homePagePosterDataMap["writer"] +
                                  " _ " +
                                  homePagePosterDataMap["dataWrite"],
                              style: _textTheme.subtitle1,
                            ),
                            Row(
                              children: [
                                Text(homePagePosterDataMap["view"],style: _textTheme.subtitle1),

                                const Icon(Icons.remove_red_eye,size: 20,color: SolidColors.posterSubTitle,),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: size.width/12),
                          child: Text(homePagePosterDataMap["title"].toString(),style: _textTheme.headline1),
                        ),



                      ],
                    )),


              ],
            ),
            //Hashtag
            SizedBox(height:size.height/70 ,),

            SizedBox(



              height: size.height/20,

              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: listTags.length,
                itemBuilder: (context, index) {
                return Padding(

                padding:  EdgeInsets.fromLTRB( 0 ,0,index==0? bodyMargin:10,0),
                  child: Container(
                    height: size.height/20,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradiantColors.tags,
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft


                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),


                    child: Row(

                      children: [

                        SizedBox(width: size.width/30,),
                        ImageIcon(AssetImage(Assets.icons.hashtagicon.path),color: SolidColors.lightColor,size: 17,),
                        SizedBox(width: size.width/30,),
                        Text(listTags[index].title.toString(),style: _textTheme.headline1,),
                        SizedBox(width: size.width/30,),
                      ],
                    ),
                  ),
                );
              },),
            )

          ],
        ),
      ),
    );
  }
}
