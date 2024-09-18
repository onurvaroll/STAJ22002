import 'package:get/get.dart';
import '../model/otel_model.dart';
import '../service/firestore_service.dart';

class HotelController extends GetxController {
  var hotels = <List>[].obs;
  var recommendedHotels =<HotelModel>[].obs;
  var popularHotels =<HotelModel>[].obs;
  var trendingHotels =<HotelModel>[].obs;



  @override
  void onInit() {
    super.onInit();
    fetchHotels();
  }

  void fetchHotels() async {
    List<HotelModel> hotelList = await FireStoreService().getHotelList();

    recommendedHotels.assignAll(hotelList.sublist(0,7));
    popularHotels.assignAll(hotelList.sublist(7,14));
    trendingHotels.assignAll(hotelList.sublist(14,20));
    hotels.add(recommendedHotels);
    hotels.add(popularHotels);
    hotels.add(trendingHotels);


  }
}
