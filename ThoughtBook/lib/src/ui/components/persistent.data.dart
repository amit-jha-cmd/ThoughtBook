import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> read() async {
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = 'loggedIn';
  final token = 'token';
  final name = 'name';
  final imageURL = 'imageURL';
  final provider = 'provider';

  final loggedInValue = prefs.getBool(loggedIn) ?? false;
  final tokenValue = prefs.getString(token) ?? "";
  final nameValue = prefs.getString(name) ?? "";
  final imageURLValue = prefs.getString(imageURL) ?? "";
  final providerValue = prefs.getString(provider) ?? "";

  final session = {
    loggedIn: loggedInValue,
    token: tokenValue,
    name: nameValue,
    provider: providerValue,
    imageURL: imageURLValue,
  };

  return session;
}

Future<bool> save(bool loggedInValue, String tokenValue, String imageURLValue,
    String nameValue, String providerValue) async {
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = 'loggedIn';
  final token = 'token';
  final name = 'name';
  final imageURL = 'imageURL';
  final provider = 'provider';

  prefs.setBool(loggedIn, loggedInValue);
  prefs.setString(token, tokenValue);
  prefs.setString(name, nameValue);
  prefs.setString(imageURL, imageURLValue);
  prefs.setString(provider, providerValue);

  return true;
}
