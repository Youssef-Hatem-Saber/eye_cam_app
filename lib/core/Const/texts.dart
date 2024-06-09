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
  String? openAppsPage;
  Texts() {
    if(language == "English") {
      help = "Help";
      desireAssistant = "Seeking vision";
      join = "share your vision";
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
      openAppsPage = "show applications";
      //Don't change this
      languageState = "العربية";
    } else if(language == "Arabic") {
      help = "مساعدة";
      desireAssistant = "كن لي عيناي";
      join = "انضم إلى عائلتنا";
      welcome = "نحن نقدم لك الوضوح";

      //TODO: translate the text
      email= "البريد الالكتروني";
      password = "كلمة المرور";
      loginWelcome = "مرحبا بعودتك";
      login = "تسجيل الدخول";
      signup = "التسجيل";
      logout = "تسجيل الخروج";
      name = "الاسم";
      subJoin = "كن فردا من عائلتنا";
      subDesireAssistant = "قم بمحادثة شخص من فريقنا";
      noUser="ليس لديك حساب";
      wrongPassword="كلمة مرور خاطئة";
      weekPassword = "كلمة المرور ضعيفة جدا";
      accountExists= "الحساب موجود بالفعل";
      noInternet= "لا يوجد اتصال بالانترنت";
      openAppsPage = "ارني الطلبات";
      //Don't change this
      languageState = "English";
    }
  }
}