import 'package:shared_preferences/shared_preferences.dart';
class SaveMyData{

  static String memeKey = "MEMEKEY";

  static Future<bool> saveData(int val) async{
    final inst = await SharedPreferences.getInstance();      // these three lines code is used to save data
    return await inst.setInt(memeKey, val);
  }
  static Future<int?> fetchData() async {         // int? is used because in future datya can be nullable
    final inst = await SharedPreferences.getInstance();    // these three line code is used to fetch data in integer
    return await inst.getInt(memeKey);
  }

}