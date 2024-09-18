import 'package:flutter/cupertino.dart';

class TextControllers {
  static final TextControllers _instance = TextControllers._internal();
  factory TextControllers() => _instance;
  TextControllers._internal();

  TextEditingController loginMailController =TextEditingController();
  TextEditingController loginPasswordController=TextEditingController();
}