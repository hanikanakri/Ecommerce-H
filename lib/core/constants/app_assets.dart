class AppAssets {
  AppAssets._();

  static const String baseDbURI = 'assets/images/db/';
  static const String personDbURI = '${baseDbURI}person_image.jpg';

  static const String baseAssetsURI = 'assets/images/';
  static const String mainBackground = '${baseAssetsURI}main_background.png';
  static const String noData = '${baseAssetsURI}no_data.png';
  static const String errorData = '${baseAssetsURI}error.png';

//logo
  static const String baseLogoURI = '${baseAssetsURI}logo/';
  static const String logoURI = '${baseLogoURI}app_icon.png';

  // static String get appName => SharedStorage.getLanguage() == "ar"
  //     ? "${baseLogoURI}app_name_ar.svg"
  //     : "${baseLogoURI}app_name_en.svg";
  //
  // static String get appNameGeneral => SharedStorage.getLanguage() == "ar"
  //     ? "${baseLogoURI}app_name_general_ar.svg"
  //     : "${baseLogoURI}app_name_general_en.svg";

  /*static String get splashLogo => SharedStorage.getLanguage() == "ar"
      ? baseLogoURI + "splash_logo_ar.png"
      : baseLogoURI + "splash_logo_en.png";*/
  static String splashLogo = "${baseLogoURI}splash_logo.png";

  //splash
  static const String baseSplashURI = '${baseAssetsURI}splash/';

  static const String splashBackGroundImageURI =
      '${baseSplashURI}splash_background.jpg';

  //auth assets
  static const String baseAuthURI = '${baseAssetsURI}auth/';

  static const String changeLanguageURI = '${baseAuthURI}changeLanguage.svg';

  //final auth
  static const String loginIcon = '${baseAuthURI}login_icon.svg';
  static const String registrationNewAccount =
      '${baseAuthURI}registeration_new_account.svg';
  static const String verifyCode = '${baseAuthURI}verify_code.svg';

  //Home  asset
  static const String baseHomeURI = '${baseAssetsURI}home/';
  static const String appBackgroundURI = '${baseHomeURI}app_background_1.png';

  static const String drawerMenu = '${baseHomeURI}drawer_menu.svg';
  static const String homePageAppBarLogo =
      '${baseHomeURI}home_page_app_bar_logo.svg';
  static const String profilePicture = '${baseHomeURI}profile_picture.png';

  //NavBar
  static const String basNavBar = "${baseHomeURI}bottom_navigation_bar/";
  static const String homeNave = '${basNavBar}home.svg';
  static const String shoppingNave = '${basNavBar}shopping.svg';
  static const String heartNave = '${basNavBar}heart.svg';
  static const String searchNave = '${basNavBar}search.svg';
  static const String settingsNave = '${basNavBar}settings.svg';

  /*static const String homePageBackGroundImageURI =
      baseHomeURI + 'home_page_backGraound_image.svg';*/

  //request  asset
  static const String baseRequestURI = '${baseAssetsURI}request/';
  static const String cameraIcon = '${baseRequestURI}camera.svg';
  static const String galleryIcon = '${baseRequestURI}gallery.svg';
  static const String uploadImageIcon = '${baseRequestURI}uploadImage.svg';
  static const String saveTempIcon = '${baseRequestURI}saveTemp.svg';

  // on boarding
  static const String baseOnBoardingURI = '${baseAssetsURI}on_boarding/';
  static const String onBoarding1URI = '${baseOnBoardingURI}on_boarding_1.png';
  static const String onBoarding2URI = '${baseOnBoardingURI}on_boarding_2.png';
  static const String onBoarding3URI = '${baseOnBoardingURI}on_boarding_3.png';

  //place holder
  static const String placeHolder =
      'assets/images/place_holders/place_holder.png';


  ///profile
 static const String baseProfile = '${baseAssetsURI}profile/';
 static const String editProfile = '${baseProfile}edit.svg';
 static const String emailProfile = '${baseProfile}email.png';
 static const String passwordProfile = '${baseProfile}password.png';
 static const String phoneProfile = '${baseProfile}phone.png';
 static const String profileProfile = '${baseProfile}profile.png';



 ///shopping
  static const String baseShopping = '${baseAssetsURI}shopping/';
  static const String locationShopping = '${baseShopping}location.svg';
 // static const String locationShopping = '${baseShopping}location.png';
}
