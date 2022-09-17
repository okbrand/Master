import 'package:get/get.dart';
import 'package:techblogtest/models/article_model.dart';

import '../componnents/api_constant.dart';
import '../services/dio_service.dart';

class ArticleController extends GetxController{
  RxList<ArticleModel> articleList=RxList();



  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getArticleListItems();

  }

  getArticleListItems() async {
    loading.value=true;
    var response = await DioService().getMethod(ApiConstant.getArticleList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });


      loading.value=false;




    }
  }
}