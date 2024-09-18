import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/selected_hotel/selected_hotel.dart';
import 'package:hotel/service/auth.dart';
import 'package:hotel/service/firestore_service.dart';

import '../../core/color.dart';
import '../../model/otel_model.dart';


class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedHotel(selectedHotel: hotelModel),));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        width: 72.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                hotelModel.coverPhoto,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Card(
                color: ColorConstants.black,
                child: Padding(
                  padding: 8.pAll,
                  child: Row(
                    children: [
                      Icon(Icons.star, color: ColorConstants.primary),
                      Text(
                        hotelModel.starRating.toString(),
                        style: Get.textTheme.labelMedium!
                            .copyWith(color: ColorConstants.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     hotelModel.hotelName,
                      style: Get.textTheme.bodySmall!.copyWith(
                          color: ColorConstants.primary,
                          fontFamily: 'Poppins-Regular',fontWeight: FontWeight.bold),
                    ),
                    1.yh,
                    Text(
                      hotelModel.location,
                      style: Get.textTheme.labelMedium!.copyWith(
                          color: ColorConstants.primary,
                          fontFamily: 'Poppins-ThinItalic'),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "\$${hotelModel.perHour}",
                        style: Get.textTheme.labelLarge!.copyWith(
                            color: ColorConstants.primary,
                            fontFamily: 'Poppins-Regular',
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " / per hour",
                        style: Get.textTheme.labelMedium!.copyWith(
                          color: ColorConstants.primary,
                          fontFamily: 'Poppins-ThinItalic',
                        ),
                      ),
                    ])),

                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: IconButton(onPressed: (){
                FireStoreService().addFavHotel("wgXDjDUcb4SJaexouOL6ClGl4Ji2", hotelModel.id);
              },
                  icon: const Icon(Icons.bookmark_border)),
            )
          ],
        ),
      ),
    );
  }
}
