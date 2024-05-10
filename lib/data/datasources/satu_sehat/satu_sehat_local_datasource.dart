import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SatuSehatLocalDatasource {
  String satuSehatTokenKey = dotenv.get('SATU_SEHAT_TOKEN_KEY');
  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(satuSehatTokenKey, token);
    return result;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(satuSehatTokenKey);
    return result;
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(satuSehatTokenKey);
  }
}
