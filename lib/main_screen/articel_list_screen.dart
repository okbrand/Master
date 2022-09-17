import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:techblogtest/controller/article_controller.dart';
import 'package:techblogtest/controller/home_screen_controller.dart';

import '../componnents/my_component.dart';

class ArticelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textThem= Theme.of(context).textTheme;
    var size= MediaQuery.of(context).size;
    ArticleController articleController = Get.put(ArticleController());
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: myAppbar("مقالات و مجلات من"),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: articleController.articleList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: Get.width/5,
                      height: Get.height/12,
                      child: CachedNetworkImage(

                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                )),
                          );
                        },
                        imageUrl: articleController.articleList[index].image!,
                        placeholder: (context, url) {
                          return const MySpinKit();
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16,),
                    Column(

                      children: [
                        SizedBox(
                          width: size.width/1.5 ,
                          child: Text(articleController.articleList[index].title!,style: textThem.headline4,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,

                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(

                          children: [

                            Text(articleController.articleList[index].author!,style: textThem.caption),
                            SizedBox(width: 10,),
                            Text(" بازدید "+articleController.articleList[index].view!,style: textThem.caption,),

                          ],
                        ),
                        MyDivider(size: size)
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
