import 'package:dreambig_mobile/controller/server/api/api_service.dart';
import 'package:dreambig_mobile/extentions/extentions.dart';
import 'package:dreambig_mobile/model/school_model.dart';
import 'package:dreambig_mobile/screens/authantication/login_screen.dart';
import 'package:flutter/material.dart';

class SelectedSchoolScreen extends StatefulWidget {
  const SelectedSchoolScreen({
    super.key,
    required this.schoolName,
  });

  final String schoolName;

  @override
  State<SelectedSchoolScreen> createState() => _SelectedSchoolScreenState();
}

class _SelectedSchoolScreenState extends State<SelectedSchoolScreen> {
  late SchoolTrailerModel? school;

  Future<void> getSelectSchool() async {
    var obj = await APIService().getSelectedSchool(widget.schoolName);
    setState(() {
      school = obj[0];
    });
  }

  @override
  void initState() {
    super.initState();
    getSelectSchool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            }, child: const Text('Giriş Yap'))
          ],
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: const BoxDecoration(
                    color: Colors.indigo,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.schoolName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const CircleAvatar(radius: 50,
                        backgroundImage: AssetImage(
                        'assets/images/oxford_logo.jpg')
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset('assets/images/oxford_main.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Okul Adı: ",
                          style: TextStyle(color: Colors.deepOrange,fontSize: 16),
                        ),
                        TextSpan(
                          text: 'Oxford University',//school!.schoolName!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),
                        ),
                        const TextSpan(
                          text: "\nÜlkesi: ",
                          style: TextStyle(color: Colors.deepOrange,fontSize: 16),
                        ),
                        TextSpan(
                          text: 'Amerika',//school!.schoolCountry!.toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),
                        ),
                        const TextSpan(
                          text: "\nŞehir: ",
                          style: TextStyle(color: Colors.deepOrange,fontSize: 16),
                        ),
                        TextSpan(
                          text: 'City',//school!.schoolCity!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),
                        ),
                        const TextSpan(
                          text: "\nOkul Kalitesi: ",
                          style: TextStyle(color: Colors.deepOrange,fontSize: 16),
                        ),
                        TextSpan(
                          text: '98',//school!.schoolQuality!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black,fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              const Text('Bölümler'),
            ],
          ),
        ));
  }
}
