
import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  static String? name;
  static int? userId;

  UserData(User? user,Map<String,dynamic> data){
    name = user!.displayName;
    userId = data['id'];
  }
}