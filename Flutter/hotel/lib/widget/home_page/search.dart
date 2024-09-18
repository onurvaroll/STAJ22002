import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/color.dart';

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({
    super.key, required this.onSearchSubmit,
  });
  final VoidCallback onSearchSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorConstants.green,
      style: Get.textTheme.labelLarge!.copyWith(color: ColorConstants.black),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50)),
          hintText: "Search",
          prefixIcon: Icon(Icons.search, size: 30,
          color: ColorConstants.green),
          suffixIcon: Icon(
              (Icons.settings),color: ColorConstants.green),
          ),
      onSubmitted: (value){
        onSearchSubmit();
        print(value);
      },
      );
  }
}