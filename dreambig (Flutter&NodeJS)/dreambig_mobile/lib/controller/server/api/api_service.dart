import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../model/school_model.dart';

class APIService {

  String ipAdress='192.168.1.8';
  Future<List<SchoolTrailerModel>> getSchools() async {
    final response = await http.get(Uri.parse('http://$ipAdress:8081/university'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => SchoolTrailerModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
  Future<List<SchoolTrailerModel>> getSchoolsFromCountry(String country) async {
    final response = await http.get(Uri.parse('http://$ipAdress:8081/country/$country'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((school) => SchoolTrailerModel.fromJson(school)).toList();
    } else {
      throw Exception('Failed to load schools');
    }
  }
  Future<List<SchoolTrailerModel>> getSelectedSchool(String schoolName)async{
    final response =await http.get(Uri.parse('http://$ipAdress:8081/university/$schoolName'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((school) => SchoolTrailerModel.fromJson(school)).toList();
    } else {
      throw Exception('Failed to load schools');
    }
  }
  
  Future<List<String>> getSchoolsFromCountryUniName(String country) async {
    final response = await http.get(Uri.parse('http://$ipAdress:8081/university/country/$country/schoolName'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<String> countList = jsonResponse.map((
          item) => item['u_ulkesi'] as String).toList();
      return countList;

    }else{
      return [];
    }
  }


  Future<List<String>> getCountry() async {
    final response = await http.get(Uri.parse('http://$ipAdress:8081/country'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<String> countList = jsonResponse.map(
            (item) => (item['u_ulkesi'] as String).toUpperCase(),
      ).toList();
      print(countList);
      return countList;


    }else{
      return [];
    }
  }

  Future<List<String>> getSchoolName() async {
    final response = await http.get(Uri.parse('http://$ipAdress:8081/university/schoolName'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<String> countList = jsonResponse.map((
          item) => item['u_adi_tr'] as String).toList();
      print(countList);
      return countList;

    }else{
      return [];
    }
  }




}