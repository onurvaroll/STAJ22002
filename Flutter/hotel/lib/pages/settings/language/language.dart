import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Language",
            style:
                Get.textTheme.bodyLarge!.copyWith(color: ColorConstants.black),
          ),
          iconTheme: IconThemeData(
              color: ColorConstants.black
          )
      ),
    );
  }
}
