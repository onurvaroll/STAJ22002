import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/core/color.dart';
import 'package:hotel/extentions/extentions.dart';
import 'package:hotel/pages/select_room/select_room.dart';
import '../../widget/select_hotel/calendar/custom_date_picker.dart';
import '../../widget/select_hotel/check_date_column/check_date_column.dart';
import '../../widget/select_hotel/guest_counter/guest_counter.dart';
import '../selected_hotel/selected_hotel.dart';

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  String checkInDate = '';

  String checkOutDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date',
            textAlign: TextAlign.right,
            style: Get.textTheme.bodyMedium!.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold)),
      ),
      bottomSheet: ButtonBottomSheet(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectRoom(),));
        },
        buttonName: 'Select Date',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.pH,
          child: Column(
            children: [
              const CustomDatePicker(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckDateColumn(
                      title: 'Check In Date',
                    checkSelectedDate: checkInDate,
                  icon: Icons.date_range,),
                  Icon(
                    Icons.arrow_right_alt,
                    color: ColorConstants.black,
                  ),
                  CheckDateColumn(
                      title: 'Check Out Date',
                      checkSelectedDate: checkOutDate,
                      icon: Icons.date_range),
                ],
              ),
              4.yh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CheckDateColumn(
                      title: 'Check In Time',
                      checkSelectedDate: '',
                      icon: Icons.timer),
                  Icon(
                    Icons.arrow_right_alt,
                    color: ColorConstants.black,
                  ),
                  const CheckDateColumn(
                      title: 'Check Out Time',
                      checkSelectedDate: '',
                      icon: Icons.timer),
                ],
              ),
              4.yh,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CounterWidget(
                    title: 'Guest (Adult)',
                  ),
                  CounterWidget(
                    title: 'Guest (Children)',
                  )
                ],
              ),
              16.yh
            ],
          ),
        ),
      ),
    );
  }
}




