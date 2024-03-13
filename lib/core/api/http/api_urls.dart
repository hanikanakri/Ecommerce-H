class ApiURLs {
  static const String BaseURL = 'https://student.valuxapps.com/api/';

  /// Auth
  static const String login = "${BaseURL}login";
  static const String register = "${BaseURL}register";


  ///profile
  static const String profile = "${BaseURL}profile";
  static const String editProfile = "${BaseURL}update-profile";
  static const String editPassword = "${BaseURL}change-password";

  //settings
  static const String logOut = "${BaseURL}logout";
  static const String settings = "${BaseURL}settings";

  ///notification
  static const String tokenFCM = "${BaseURL}fcm-token";

  ///home page
  static const String homePageData = "${BaseURL}home";



  ///categories
  static const String getAllCategories = "${BaseURL}categories";


  ///shopping
  static const String shoppingList = "${BaseURL}products";

  /// favorites
  static const String favorites = "${BaseURL}favorites";

  ///location
  static const String getLocationAddresses = "${BaseURL}addresses";
  static const String deleteLocationAddresses = "${BaseURL}addresses/";


  //search
  static const String searchProduct = "${BaseURL}products/search";
}
