import 'package:cosmetics/views/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setIsNotFirstTime() async {
    await _prefs.setBool('isFirstTime', false);
  }

  static bool get isFirstTime {
    return _prefs.getBool('isFirstTime') ?? true;
  }

  static Future<void> setEmail(String email) async {
    await _prefs.setString('email', email);
  }

  static String get email {
    return _prefs.getString('email') ?? '';
  }

  static String get toke {
    return _prefs.getString('token') ?? '';
  }

  static Future<void> setToken(String token) async {
    await _prefs.setString('token', token);
  }

  static String get image {
    var image = _prefs.getString('profilePhotoUrl');
    if (image == null || image.isEmpty) {
      return 'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-High-Quality-Image.png';
    }
    return image;
  }

  static String get name {
    return _prefs.getString('username') ?? 'User';
  }

  static bool get isAuth {
    return token.isNotEmpty;
  }

  static String get token {
    return _prefs.getString('token') ?? '';
  }

  static Future<void> logout() async {
    // await _prefs.clear();
    await _prefs.remove('token');
    await _prefs.remove('email');
    await _prefs.remove('countryCode');
    await _prefs.remove('phoneNumber');
    await _prefs.remove('role');
    await _prefs.remove('username');
    await _prefs.remove('profilePhotoUrl');
    await _prefs.remove('id');
  }

  static Future<void> saveUserData({UserData? data, UserModel? model}) async {
    if (data == null && model == null) return;
    if (data != null) {
      await _prefs.setString('token', data.token);
      model = data.user;
    }
    if (model != null) {
      await _prefs.setString('email', model.email);
      await _prefs.setString('countryCode', model.countryCode);
      await _prefs.setString('phoneNumber', model.phoneNumber);
      await _prefs.setString('role', model.role);
      await _prefs.setString('username', model.username);
      await _prefs.setString('profilePhotoUrl', model.profilePhotoUrl ?? '');
      await _prefs.setInt('id', model.id);
    }
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }
}








// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CachHelper {
//   static late SharedPreferences _prefs;
//   static const _storage = FlutterSecureStorage();

//   static init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   static Future<void> set({required String key, required dynamic value}) async {
//     if (value is String) {
//       await _prefs.setString(key, value);
//     } else if (value is bool) {
//       await _prefs.setBool(key, value);
//     } else if (value is double) {
//       await _prefs.setDouble(key, value);
//     } else if (value is int) {
//       await _prefs.setInt(key, value);
//     } else if (value is List<String>) {
//       await _prefs.setStringList(key, value);
//     } else {
//       throw UnsupportedError('Unsupported Type');
//     }
//   }

//   static String? getString({required String key}) {
//     return _prefs.getString(key);
//   }

//   static bool? getBool({required String key}) {
//     return _prefs.getBool(key);
//   }

//   static double? getDouble({required String key}) {
//     return _prefs.getDouble(key);
//   }

//   static int? getInt({required String key}) {
//     return _prefs.getInt(key);
//   }

//   static List<String>? getStringList({required String key}) {
//     return _prefs.getStringList(key);
//   }

//   static Future<bool> remove({required String key}) async {
//     return _prefs.remove(key);
//   }

//   static Future<bool> clearAllData() async {
//     return _prefs.clear();
//   }

//   Future<void> setSecureData({
//     required String key,
//     required dynamic value,
//   }) async {
//     return await _storage.write(key: key, value: value);
//   }

//   Future<String?> getSecureData({required String key}) async {
//     return await _storage.read(key: key);
//   }

//   Future<void> deleteSecureData({required String key}) async {
//     return await _storage.delete(key: key);
//   }
// }

