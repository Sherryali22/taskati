import 'package:hive/hive.dart';

class AppLocalStorange {
  static late Box userBox;
  static String nameKey = 'name';
  static String imageKey = 'image';
  static String isUploadKey = 'isUpload';


  static init() {
    userBox = Hive.box('user');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getCacheData(String key) {
    return userBox.get(key);
  }
}
