// import 'dart:convert';
// import 'package:dreambig_mobile/model/school_model.dart';
// import 'package:http/http.dart' as http;
//
// class APIService {
//
//   Future<List<SchoolTrailerModel>> getSchools() async {
//     final response = await http.get(Uri.parse('http://192.168.1.8:8081/university'));
//
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       print(jsonResponse);
//       return jsonResponse.map((user) => SchoolTrailerModel.fromJson(user)).toList();
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }
//   // Future<List<SchoolTrailerModel>> getSchoolsFromCountry(String country) async {
//   //   final response = await http.get(Uri.parse('http://192.168.1.8:8081/university'));
//   //   if (response.statusCode == 200) {
//   //     List jsonResponse = json.decode(response.body);
//   //     return jsonResponse.map((user) => SchoolTrailerModel.fromJson(user)).toList();
//   //   } else {
//   //     throw Exception('Failed to load users');
//   //   }
//   // }
//
//   Future<List<SchoolTrailerModel>> getSchoolsFromCountry(String country) async {
//     final response = await http.get(Uri.parse('http://192.168.1.8:8081/university/country/$country'));
//
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((school) => SchoolTrailerModel.fromJson(school)).toList();
//     } else {
//       throw Exception('Failed to load schools');
//     }
//   }
//
//   Future<List<String>> getCountry() async {
//     final response = await http.get(Uri.parse('http://192.168.1.8:8081/university/country'));
//     if (response.statusCode == 200) {
//       List<dynamic> jsonResponse = json.decode(response.body);
//       List<String> countList = jsonResponse.map((
//           item) => item['u_ulkesi'] as String).toList();
//       return countList;
//
//     }else{
//       return [];
//     }
//   }
//
//
//
// //   static var client = http.Client();
// // expLoad()async {
// //   var url = Uri.http(Config.apiUrl,Config.schoolUrl);
// //   var response = await http.post(url, body: {});
// //   print('Response status: ${response.statusCode}');
// //   print('Response body: ${response.body}');}
// //
// //
// //   static Future<List<SchoolTrailerModel>?> getSchools() async {
// //     print("get çalıştı");
// //     Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
// //     var url = Uri.http(Config.apiUrl, Config.schoolUrl);
// //     var response = await client.get(url, headers: requestHeaders);
// //
// //     if (response.statusCode == 200) {
// //       List<SchoolTrailerModel> schoolList = (json.decode(response.body) as List)
// //           .map((data) => SchoolTrailerModel.fromJson(data))
// //           .toList();
// //       return schoolList;
// //     } else {
// //       throw Exception('Veri getirilemedi');
// //     }
// //   }
// }
