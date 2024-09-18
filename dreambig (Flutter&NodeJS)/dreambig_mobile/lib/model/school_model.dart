class SchoolTrailerModel {
  String? schoolName;
  String? schoolLogoUrl;
  String? schoolImageUrl;
  String? schoolCountry;
  String? schoolCity;
  String? schoolQuality;

  SchoolTrailerModel({
    required this.schoolName,
    required this.schoolLogoUrl,
    required this.schoolImageUrl,
    required this.schoolCountry,
    required this.schoolCity,
    required this.schoolQuality,
  });

  SchoolTrailerModel.fromJson(Map<String, dynamic> json) {
    schoolName = json["u_adi_tr"];
    schoolLogoUrl = json["u_resmi"];
    schoolImageUrl = json["u_giris_resmi"];
    schoolCountry = json["u_ulkesi"];
    schoolCity = json["u_city"];
    schoolQuality = json["kalite"];
  }

  Map<String, dynamic> toJson(List data) {
    final data = <String, dynamic>{};
    data["u_adi_tr"] = schoolName;
    data["u_resmi"] = schoolLogoUrl;
    data["u_giris_resmi"] = schoolImageUrl;
    data["u_ulkesi"] = schoolCountry;
    data["u_city"] = schoolCity;
    data["kalite"] = schoolQuality;
    return data;
  }
}



// SchoolTrailerModel.fromJson(Map<String, dynamic> json) {
// schoolName = json["u_adi_tr"];
// schoolLogoUrl = json["u_resmi"];
// schoolImageUrl = json["u_giris_resmi"];
// schoolCountry = json["u_ulkesi"];
// schoolCity = json["u_city"];
// schoolQuality = json["kalite"];
// }
//
// Map<String, dynamic> toJson() {
// final data = <String, dynamic>{};
// data["u_adi_tr"] = schoolName;
// data["u_resmi"]=schoolLogoUrl;
// data["u_giris_resmi"]=schoolImageUrl;
// data["u_ulkesi"]=schoolCountry;
// data["u_city"]=schoolCity;
// data["kalite"]=schoolQuality;
// return data;
//}