import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));

//repos
  Get.lazyPut(()=>PopularProductRepo(apiClient:Get.find()));
  Get.lazyPut(()=>RecommendedProductRepo(apiClient:Get.find()));
  Get.lazyPut(()=>CartRepo(sharedPreferences:Get.find()));

//controllers
  Get.lazyPut(()=>PopularProductController(popularProductRepo:Get.find(), PopularProductRepo: null));
  Get.lazyPut(()=>RecommendedProductController(recommendedProductRepo:Get.find(), RecommendedProductRepo: null));
  Get.lazyPut(()=>CartController(cartRepo: Get.find()));
}