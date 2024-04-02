import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  late SharedPreferences _prefs;
  Map<String, String> localS = {'id': '0'};

  AppSettings() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readSettings();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readSettings() {
    final id = _prefs.getString('id') ?? '0';
    localS = {'id': id};
  }

  setlocalS(String id) async {
    await _prefs.setString('id', id);
  }

  Future<bool> isEmpty() async {
    await _startPreferences();
    String id = _prefs.getString('id') ?? '0';
    return id == '0';
  }

  readData() async {
    await _readSettings();
    return localS['id'] ?? 'id não encontrado';
  }
}
