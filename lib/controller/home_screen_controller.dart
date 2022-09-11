import 'package:get/get.dart';
import 'package:techblogtest/componnents/api_constant.dart';
import 'package:techblogtest/models/Data_models.dart';
import 'package:techblogtest/models/article_model.dart';
import 'package:techblogtest/services/dio_service.dart';

import '../models/poster_model.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;

  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  @override
  onInit(){
    super.onInit();
    getHomeItems();

  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
