import 'package:dreambig_mobile/core/color.dart';
import 'package:dreambig_mobile/extentions/extentions.dart';
import 'package:dreambig_mobile/screens/authantication/login_screen.dart';
import 'package:dreambig_mobile/model/school_model.dart';
import 'package:dreambig_mobile/screens/scholl_from_country.dart';
import 'package:dreambig_mobile/screens/selected_scholl.dart';
import 'package:flutter/material.dart';
import '../controller/server/api/api_service.dart';
import '../widget/search_bar.dart';

class SchoolList extends StatefulWidget {
  const SchoolList({super.key});

  @override
  State<SchoolList> createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  List<String> country=[];

  Future<void> getCountry() async {
    var list = await APIService().getCountry();
    setState(() {
      country = list;
    });
  }
  List<String> schoolName = [];

  Future<void> getSchoolName() async {
    var list = await APIService().getSchoolName();
    setState(() {
      schoolName = list;
    });
  }

  @override
  void initState() {
    super.initState();
    getCountry();
    getSchoolName();
  }
  late List<String> schools;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,actionsIconTheme: IconThemeData(size: 32),
        actions: [
          Icon(Icons.translate,color:Colors.white,),
          Icon(Icons.refresh,color:Colors.white)],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(top: 8,
              right: 16,
              left: 16,
              child: Image.asset('assets/images/dreambig_logo.png',height: 200,)),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    // Expanded(flex: 1,
                    //   child: FlagBuilder(flags: FlagData().flags),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Yurt Dışında Üniversite Bul',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
                        ),),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomSearchBar(getList: country,defaultString: 'Okumak İstediğiniz Ülkeyi Seçin',
                        onChanged: (value){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolFromCountry(countryName: value!),));
                        },),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomSearchBar(getList: schoolName,defaultString: 'Hedefindeki Üniversite',
                        onChanged: (value){
                          print(value);
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>SelectedSchoolScreen(schoolName: value!) ));
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomSearchBar(getList: schoolName,defaultString: 'Hayalindeki Bölüm',
                        onChanged: (value){
                          print(value);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) =>SelectedSchoolScreen(
                          //     schoolName: value!) )
                          // );
                        },
                      ),
                    ),



                    //***Tüm okulları listeliyor***
                    // Expanded(
                    //   flex: 8,
                    //   child: ShowSchoolList(schools: schools),
                    // ),


                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            right: 16,
            left: 16,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchoolFromCountry(countryName: 'amerika'),));
                },
                child: Text('Okumak İstediğiniz Ülkeyi Seçin Ekranına Gitmek İçin')),
          ),

          Positioned(
            bottom: 4,
            right: 16,
            left: 16,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SelectedSchoolScreen(schoolName: 'Oxford') ));
                },
                child: Text('Okumak İstediğiniz Ünversite Ekranına Gitmek İçin')),
          ),
        ],
      ),
    );
  }
}

class ShowSchoolList extends StatelessWidget {
  const ShowSchoolList({
    super.key,
    required this.schools,
  });

  final Future<List<SchoolTrailerModel>> schools;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SchoolTrailerModel>>(
      future: schools,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          List<SchoolTrailerModel> schoolList = snapshot.data!;
          return ListView.builder(
            itemCount: schoolList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/oxford_main.jpg',
                                ),
                                fit: BoxFit.cover)),
                        child: Stack(children: [
                          Positioned(
                            right: 20,
                            child: Image.asset(
                              'assets/images/oxford_logo.jpg',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ]),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            schoolList[index].schoolName!,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.deepOrange),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                              "Ülke: ${schoolList[index].schoolCountry!.toUpperCase()}"),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(schoolList[index].schoolCity!),
                          Text(
                              "Okul Kalitesi: ${schoolList[index].schoolQuality!}"),
                        ],
                      ),
                    ],
                  ),
                ),
              );

              //   ListTile(
              //   title: Text(schoolList[index].schoolName!),
              //   subtitle: Text('${schoolList[index].schoolCountry}'),
              // );
            },
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
