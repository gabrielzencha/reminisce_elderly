import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userInfoKey = "USERINFOSAVED";
  static String profilePhotoKey = "PROFILEPHOTO";

  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }
  static Future<bool> saveUserInfo() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userInfoKey, true );
  }
  static Future<bool> saveProfilePhoto(String url) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(profilePhotoKey, url );
  }


  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
  static Future<String?> getProfilePhotoFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(profilePhotoKey);
  }


  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
  static Future<bool?> getUserInfoSavedSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userInfoKey);
  }
}

