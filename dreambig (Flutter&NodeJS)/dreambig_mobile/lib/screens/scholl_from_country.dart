import 'package:dreambig_mobile/model/school_model.dart';
import 'package:dreambig_mobile/screens/home_page.dart';
import 'package:dreambig_mobile/screens/selected_scholl.dart';
import 'package:flutter/material.dart';
import '../controller/server/api/api_service.dart';
import '../widget/search_bar.dart';

class SchoolFromCountry extends StatefulWidget {
  const SchoolFromCountry({super.key, required this.countryName});

  final String countryName;

  @override
  State<SchoolFromCountry> createState() => _SchoolFromCountryState();
}

class _SchoolFromCountryState extends State<SchoolFromCountry> {
  Future<List<SchoolTrailerModel>>? futureSchools;
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
    futureSchools = APIService().getSchoolsFromCountry(widget.countryName);
    getSchoolName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.countryName.toUpperCase()} UNIVERSITELERI'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Expanded(
                flex: 1,
                child: CustomSearchBar(getList: schoolName,defaultString: 'Size En Uygun Üniversiteyi Arayın',
                onChanged: (value){
                  print(value);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedSchoolScreen(schoolName: value!)));
                },),
              ),
              Expanded(
                  flex: 8,
                  child: FutureBuilder<List<SchoolTrailerModel>>(
                      future: futureSchools,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedSchoolScreen(schoolName:schoolList[index].schoolName! ),));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                'assets/images/oxford_main.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                right: 20,
                                                child: Image.asset(
                                                  'assets/images/oxford_logo.jpg',
                                                  width: 80,
                                                  height: 80,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              schoolList[index].schoolName!,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Colors.deepOrange,
                                              ),
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
                                ),
                              );
                            },
                          );
                        } else {
                          return const Text('No data available');
                        }
                      }))
            ])));
  }
}
