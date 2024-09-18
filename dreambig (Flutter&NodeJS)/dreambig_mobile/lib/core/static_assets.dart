class StaticAssets {
  static String get welcomeImage => 'assets/images/welcome_coffee.jpeg';
  static String get dummyAvatar => 'assets/images/dummy_avatar.jpeg';
  static String get coffeeNew => 'assets/images/coffee_new.jpeg';

  static String get coffeeMillLogo => 'assets/images/coffee_mill_logo.png';
  static String get favIcon => 'assets/icons/ic_fav.svg';
  static String get noFavIcon => 'assets/icons/ic_no_fav.svg';
  static String get home => 'assets/icons/ic_home.svg';
  static String get noHome => 'assets/icons/ic_no_home.svg';
  static String get profile => 'assets/icons/ic_profile.svg';
  static String get noProfile => 'assets/icons/ic_no_profile.svg';
  static String get search => 'assets/icons/ic_search.svg';
  static String get filter => 'assets/icons/ic_filter.svg';



  static List<String> get otherOptionButtonName =>["facebook","google","apple"];
  static String getAssetAddr(int index){
    return "assets/icons/${otherOptionButtonName[index]}.svg";
  }

  static String get forgotPassword => 'assets/icons/forgot_password.svg';
  static String get sms => 'assets/icons/sms.svg';
  static String get mail => 'assets/icons/mail.svg';
  static String get verification=> 'assets/icons/verification.svg';


}
