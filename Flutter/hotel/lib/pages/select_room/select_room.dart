import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/room_controller.dart';
import '../../core/color.dart';
import '../../widget/select_hotel/room_card_list/room_card_list.dart';
import '../selected_hotel/selected_hotel.dart';

class SelectRoom extends StatelessWidget {
  SelectRoom({super.key});
  final RoomController roomController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomSheet: ButtonBottomSheet(
      onPressed: () {

      },
      buttonName: 'Continue',
    ),
      appBar: AppBar(
        title: Text('Select Room',
            textAlign: TextAlign.right,
            style: Get.textTheme.bodyMedium!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.description_outlined,color: ColorConstants.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.grid_view,color: ColorConstants.black,)),
        ],
      ),
       body: GridView.builder(gridDelegate: , itemBuilder: itemBuilder)
      //ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: 10,
      //   itemBuilder: (context, index) => RoomListCard(
      //    
      //   ),)
    );
  }
}


