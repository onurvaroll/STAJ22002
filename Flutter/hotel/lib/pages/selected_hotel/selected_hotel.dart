import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/const/const.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/model/otel_model.dart';
import 'package:hotel/widget/map/map_kit.dart';

import '../select_date/select_date.dart';

class SelectedHotel extends StatelessWidget {
  const SelectedHotel({super.key, required this.selectedHotel});

  final HotelModel selectedHotel;

  static List<Widget> facilities = [
    const SingleDetails(
      text: 'Swimming Pool',
      icons: Icons.pool,
    ),
    const SingleDetails(
      text: 'Wi-Fi',
      icons: Icons.wifi,
    ),
    const SingleDetails(
      text: 'Restaurant',
      icons: Icons.restaurant_menu,
    ),
    const SingleDetails(
      text: 'Parking',
      icons: Icons.local_parking,
    ),
    const SingleDetails(
      text: 'Meeting Room',
      icons: Icons.meeting_room,
    ),
    const SingleDetails(
      text: '24-hours Open',
      icons: Icons.open_in_new,
    ),
  ];

  static List<Widget> details = [
    const SingleDetails(
      text: 'Hotel',
      icons: Icons.hotel,
    ),
    const SingleDetails(
      text: '4-Bedrooms',
      icons: Icons.bedroom_parent,
    ),
    const SingleDetails(
      text: '2-Bathrooms',
      icons: Icons.bathtub,
    ),
    const SingleDetails(text: '3700 sqft', icons: Icons.aspect_ratio_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.08,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
        ],
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectDate(),
              ));
        },
        buttonName: 'Book Now',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScrollImage(selectedHotel: selectedHotel),
            Padding(
              padding: 16.pLeft,
              child: Text(
                selectedHotel.hotelName,
                style: Get.textTheme.displaySmall!
                    .copyWith(color: ColorConstants.black),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  Text(
                    selectedHotel.location,
                    style: Get.textTheme.labelMedium!
                        .copyWith(color: ColorConstants.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: 16.pH,
              child: Divider(
                color: ColorConstants.grey,
              ),
            ),
            Padding(
              padding: 16.pH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gallery Photos',
                    style: Get.textTheme.labelMedium!.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: Get.textTheme.labelMedium!.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Padding(
              padding: 16.pH,
              child: SizedBox(
                height: 20.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedHotel.detailsPhotos.length,
                  itemBuilder: (context, index) => Padding(
                    padding: 16.pH,
                    child: Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  selectedHotel.detailsPhotos[index]))),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Details',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: 16.pH,
              child: DetailsCard(
                childrenList: details,
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Description',
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            ),
            2.yh,
            Padding(
              padding: 16.pH,
              child: Text(
                Const().lorem,
                overflow: TextOverflow.clip,
                style: Get.textTheme.labelSmall!
                    .copyWith(color: ColorConstants.black),
              ),
            ),
            2.yh,
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Facilites',
                textAlign: TextAlign.start,
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: 16.pH,
              child: DetailsCard(
                childrenList: facilities,
              ),
            ),
            Padding(
              padding: 16.pLeft,
              child: Text(
                'Location',
                textAlign: TextAlign.start,
                style: Get.textTheme.labelMedium!.copyWith(
                    color: ColorConstants.black, fontWeight: FontWeight.bold),
              ),
            ),
            2.yh,
            Padding(
              padding: 16.pH,
              child: CityMapScreen(cityName: selectedHotel.location),
            ),
            16.yh,
          ],
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.childrenList,
  });

  final List<Widget> childrenList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        padding: 16.pH,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        crossAxisCount: 4,
        children: childrenList);
  }
}

class SingleDetails extends StatelessWidget {
  const SingleDetails({
    super.key,
    required this.icons,
    required this.text,
  });

  final IconData icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons,
            color: ColorConstants.green,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style:
                Get.textTheme.labelSmall!.copyWith(color: ColorConstants.black),
          )
        ],
      ),
    );
  }
}

class ButtonBottomSheet extends StatelessWidget {
  const ButtonBottomSheet({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  final Function onPressed;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.primary,
          border: Border(
              top: BorderSide(color: ColorConstants.black, width: 0.1)),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30))),
      height: 12.h,
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(ColorConstants.black),
                ),
                onPressed: () => onPressed(),  // Burada doğru bir şekilde fonksiyonu geçiyoruz
                child: Text(buttonName),
              ),
            ),
          )),
    );
  }
}

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key, required this.selectedHotel});

  final HotelModel selectedHotel;

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      setState(() {
        if (currentIndex < widget.selectedHotel.detailsPhotos.length - 1) {
          currentIndex++;
        }
      });
    } else if (details.primaryVelocity! > 0) {
      setState(() {
        if (currentIndex > 0) {
          currentIndex--;
        }
      });
    }
  }

  int currentIndex = 0;

  Widget pageRange(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 12,
        width: currentIndex == index ? 36 : 12,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstants.green,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.selectedHotel.detailsPhotos[currentIndex],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.selectedHotel.detailsPhotos.length,
                (index) => pageRange(index, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
