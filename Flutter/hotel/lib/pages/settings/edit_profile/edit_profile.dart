import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel/extentions/extentions.dart';
import '../../../controller/text_controller/text_controller.dart';
import '../../../core/color.dart';
import '../../../core/icon.dart';
import '../../../model/user_model.dart';
import '../../../service/auth.dart';
import '../../../service/firestore_service.dart';
import '../../../widget/text_field/special_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  FireStoreService fireStore = FireStoreService();
  final AuthorizationService auth = Get.find<AuthorizationService>();
  UserModel? user;
  String? activeUserId;
  String _selectedValue='Male';
  final List<String> _options = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

//ayrı bir classtan verilerin çekilmesi gerekiyor
  Future<void> _fetchUserData() async {
    activeUserId=auth.activeUserId.value;
    if (activeUserId != null) {
      UserModel? fetchedUser = await fireStore.getUser(activeUserId!);
      print("mail: ${fetchedUser!.email}");
      setState(() {
        user = fetchedUser;
      });
    }else{
      print("user null");
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.black,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
    }
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorConstants.black),
          title: Text(
            "Edit Profile",
            style:
                Get.textTheme.bodyLarge!.copyWith(color: ColorConstants.black),
          ),
        ),
        body: Padding(
          padding: 16.pAll,
          child: ListView(
            children: [
              SpecialField(
                obscureText: false,
                controller: TextControllers().editFullName,
                hintText: user!.fullName ?? 'No FullName',
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.name,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editName,
                hintText: user!.name,
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.name,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editBirthDay,
                hintText: user!.birthDay,
                prefix: StaticIcons.email,
                suffix: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {
                    selectDate(context);
                  },
                ),
                keyboardType: TextInputType.datetime,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editMail,
                hintText: user!.email??'',
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              2.yh,
              SpecialField(
                obscureText: false,
                controller: TextControllers().editPhone,
                hintText: user!.phoneNumber??'',
                prefix: StaticIcons.email,
                suffix: StaticIcons.email,
                keyboardType: TextInputType.phone,
              ),
              2.yh,
              // Padding(
              //   padding: 8.pH,
              //   child: DropdownButton<String>(
              //     borderRadius: BorderRadius.circular(20),
              //     dropdownColor: Colors.grey,
              //     value: _selectedValue,
              //     icon: _selectedValue=='Male'?const Icon(Icons.male):const Icon(Icons.female),
              //     hint: const Text('Select an option'),
              //     isExpanded: true, // This helps the dropdown take all the available width
              //     items: _options.map((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value,style: Get.textTheme.labelMedium!.copyWith(color: ColorConstants.black),),
              //       );
              //     }).toList(),
              //     onChanged: (newValue) {
              //       setState(() {
              //         _selectedValue = newValue!;
              //       });
              //     },
              //   ),
              // ),
          DropdownMenu<String>(
          width: 90.w,
            hintText:'Gender',textStyle: Get.textTheme.labelMedium!.copyWith(color: Colors.black),
            leadingIcon: const Icon(Icons.person),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: ColorConstants.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
            onSelected: (String? value) {
              setState(() {
                _selectedValue = value!;
              });
            },
            dropdownMenuEntries: _options.map<DropdownMenuEntry<String>>(
                  (String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              },
            ).toList(),
          ),

              // SpecialField(
              //   obscureText: false,
              //   controller: TextControllers().editGender,
              //   hintText: user!.gender,
              //   prefix: StaticIcons.email,
              //   suffix: StaticIcons.email,
              //   keyboardType: TextInputType.multiline,
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorConstants.black),
                  ),
                  child: const Text("Update"),
                ),
              )
            ],
          ),
        ));
  }
}
