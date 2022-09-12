import 'package:get/get.dart';
import 'package:techblogtest/componnents/api_constant.dart';

import 'package:techblogtest/models/podcast_model.dart';
import 'package:techblogtest/models/article_model.dart';
import 'package:techblogtest/services/dio_service.dart';

import '../models/poster_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster=PosterModel().obs;

  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getHomeItems();

  }

  getHomeItems() async {
    loading.value=true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      poster.value=PosterModel.fromJson(response.data['poster']);
      loading.value=false;




    }
  }
}
