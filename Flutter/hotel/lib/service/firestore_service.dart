import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


import '../model/otel_model.dart';
import '../model/user_model.dart';

class FireStoreService extends GetxController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> saveUser(
      {required UserModel user}) async {
    await fireStore.collection("users").doc(user.id).set({
      "fullName": user.fullName,
      "email": user.email,
      "photoUrl": user.photoUrl,
      "phoneNumber": user.phoneNumber,
      "gender":user.gender,
      "name":user.name,
    });
  }

  Future<UserModel?> getUser(userId) async {
    DocumentSnapshot docUser =
        await fireStore.collection("users").doc(userId).get();
    if (docUser.exists) {
      UserModel user = UserModel.todocument(docUser);
      return user;
    }
    return null;
  }

  void updateUser(
      {required String? userId,
      required String userName,
      required String photoUrl,
      required String content}) {
    fireStore.collection("users").doc(userId).update({
      "kullaniciAdi": userName,
      "fotoUrl": photoUrl,
      "hakkinda": content,
    });
  }

  Future<List<UserModel>> searchUser(String text) async {
    QuerySnapshot snapshot = await fireStore
        .collection("otels")
        .where("kullaniciAdi", isGreaterThanOrEqualTo: text)
        .get();
    List<UserModel> users =
        snapshot.docs.map((doc) => UserModel.todocument(doc)).toList();
    return users;
  }
  
  Future<List<HotelModel>> searchHotel(String text)async{
    QuerySnapshot snapshot=await fireStore.collection("hotels").where("hotelName", isGreaterThanOrEqualTo: text).get();
    List<HotelModel> searchingHotel =
    snapshot.docs.map((doc) => HotelModel.todocument(doc)).toList();
    return searchingHotel;
  }

  Future<List<HotelModel>> getHotelList() async {
    QuerySnapshot snapshot = await fireStore.collection("hotels").get();
    List<HotelModel> hotels = snapshot.docs.map((doc) => HotelModel.fromFirestore(doc)).toList();
    return hotels;
  }

  void addFavHotel(String userId,String hotelId){
    fireStore.collection("favorites").doc(userId).collection(hotelId).doc();
    print("user:$userId");
    print("hotel:$hotelId");
  }
}
