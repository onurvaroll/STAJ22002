import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../const/const.dart';
import '../../controller/option_controller.dart';
import '../../core/color.dart';
import '../../enums/options_names.dart';
import '../../widget/home_page/name.dart';
import '../../widget/home_page/option_button.dart';
import '../../widget/home_page/room_list.dart';
import '../../widget/home_page/search.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.onButtonPressed, required this.onButtonPressed2});

  final VoidCallback onButtonPressed;
  final VoidCallback onButtonPressed2;

  final OptionsController controller =
      Get.put(OptionsController());
  final Const consts = Const();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: consts.appIcon,
        title: Text(
          consts.appName,
          textAlign: TextAlign.right,
          style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_border_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: 16.pLeft,
              child: const HomePageName(),
            ),
            2.yh,
            Padding(
              padding: 12.pH,
              child: HomePageSearch(onSearchSubmit: onButtonPressed2),
            ),
            //2.yh,
            Center(
              child: SizedBox(
                height: 8.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: 12.pAll,
                  itemCount: OptionNames.values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: 8.pH,
                      child: OptionsButton(index: index),
                    );
                  },
                ),
              ),
            ),

            const RoomList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Recently Booked",
                  style: Get.textTheme.bodySmall!
                      .copyWith(color: ColorConstants.black),
                ),
                TextButton(
                  onPressed: onButtonPressed,
                  child: Text("See All",
                      style: Get.textTheme.labelMedium!
                          .copyWith(color: Colors.black)),
                ),
              ],
            ),

            //test için
            const RecentlyBookedList(),
          ],
        ),
      ),
    );
  }
}

class RecentlyBookedList extends StatelessWidget {
  const RecentlyBookedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.pH,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: 8.pV,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black12),
            child: Padding(
              padding: 16.pAll,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 30.w,
                      width: 30.w,
                      child: Image.asset(
                        "assets/images/bridge.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  4.xw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Otel Adı",
                        style: Get.textTheme.labelLarge!
                            .copyWith(color: ColorConstants.black),
                      ),
                      Text(
                        "Ankara",
                        style: Get.textTheme.labelMedium!
                            .copyWith(color: ColorConstants.grey),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          Text(
                            "4.7(2.750 reviews)",
                            style: Get.textTheme.labelSmall!
                                .copyWith(color: ColorConstants.black),
                          )
                        ],
                      ),
                    ],
                  ),
                  4.xw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "4000TL\n/day",
                        style: Get.textTheme.labelSmall!
                            .copyWith(color: ColorConstants.black),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_border_outlined))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
