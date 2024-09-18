import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../core/color.dart';
import '../../widget/search_page/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.clear,
              color: ColorConstants.black,
            ),
          ),
        ],
        titleSpacing: 0,
        title: const SearchAppBar(),
      ),
      body: Padding(
          padding: 8.pAll,
          child: Column(
            children: [
              Text(
                "Recent",
                style:
                    Get.textTheme.headlineLarge!.copyWith(color: ColorConstants.black),
              ),
            ],
          ),
        )

    );
  }
}


