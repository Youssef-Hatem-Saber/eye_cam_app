 import 'package:eye_cam_app/core/settings/Settings.dart';

class Texts {
  String language = Settings.language;
  String? help;
  String? desireAssistant;
  String? subDesireAssistant;
  String? join;
  String? subJoin;
  String? languageState;
  String? welcome;
  String? email;
  String? password;
  String? loginWelcome;
  String? signupWelcome;
  String? login;
  String? logout;
  String? signup;
  String? name;
  String? noUser;
  String? wrongPassword;
  String? weekPassword;
  String? accountExists;
  String? noInternet;
  Texts() {
    if(language == "English") {
      help = "Help";
      desireAssistant = "Desire assistant";
      join = "Join our family";
      subJoin = "Become a part of our family";
      subDesireAssistant = "Call someone from our team";
      welcome = "We bring you Clarity";
      email= "Email";
      password = "Password";
      loginWelcome = "Welcome Back";
      login = "Login";
      logout = "Logout";
      signup = "Signup";
      name = "name";
      signupWelcome = "Welcome";
      noUser="User not found";
      wrongPassword="Wrong password";
      weekPassword = "The password provided is too weak.";
      accountExists= "The account already exists for that email.";
      noInternet= "there's no internet please check your connection";
      //Don't change this
      languageState = "العربية";
    } else if(language == "Arabic") {
      help = "مساعدة";
      desireAssistant = "الرغبة في المساعدة";
      join = "انضم إلى عائلتنا";
      welcome = "نحن نقدم لك الوضوح";

      //TODO: translate the text
      join = "Join our family";
      email= "Email";
      password = "Password";
      loginWelcome = "Welcome Back";
      login = "login";
      signup = "Signup";
      name = "name";
      login = "out";
      subJoin = "Become a part of our family";
      subDesireAssistant = "Call someone from our team";
      noUser="User not found";
      wrongPassword="Wrong password";
      weekPassword = "The password provided is too weak.";
      accountExists= "The account already exists for that email.";
      noInternet= "there's no internet please check your connection";
      //Don't change this
      languageState = "English";
    }
  }
}