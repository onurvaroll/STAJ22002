import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/color.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.accessibility,
          color: Colors.black,
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "My Booking",
          style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorConstants.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
