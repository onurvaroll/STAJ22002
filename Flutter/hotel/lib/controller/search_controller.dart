import 'package:get/get.dart';
import 'package:hotel/service/firestore_service.dart';


class SearchsController extends GetxController{
FireStoreService fireStoreService=Get.find();

static List searchList=[].obs;
final String searchText;

  SearchsController(this.searchText);

@override
  void onInit() async{
    super.onInit();
    searchList = await fireStoreService.searchHotel(searchText);
  }

}