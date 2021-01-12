import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> read() async {
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = 'loggedIn';
  final token = 'token';
  final name = 'name';
  final imageURL = 'imageURL';
  final provider = 'provider';
  final username = 'username';

  final loggedInValue = prefs.getBool(loggedIn) ?? false;
  final tokenValue = prefs.getString(token) ?? null;
  final nameValue = prefs.getString(name) ?? null;
  final imageURLValue = prefs.getString(imageURL) ?? null;
  final providerValue = prefs.getString(provider) ?? null;
  final usernameValue = prefs.getString(username) ?? null;

  final session = {
    loggedIn: loggedInValue,
    username: usernameValue,
    token: tokenValue,
    name: nameValue,
    provider: providerValue,
    imageURL: imageURLValue,
  };

  return session;
}

Future<bool> save(bool loggedInValue, String tokenValue, String imageURLValue,
    String nameValue, String providerValue, String usernameValue) async {
  final prefs = await SharedPreferences.getInstance();
  final loggedIn = 'loggedIn';
  final token = 'token';
  final name = 'name';
  final imageURL = 'imageURL';
  final provider = 'provider';
  final username = 'username';

  prefs.setBool(loggedIn, loggedInValue);
  prefs.setString(token, tokenValue);
  prefs.setString(name, nameValue);
  prefs.setString(imageURL, imageURLValue);
  prefs.setString(provider, providerValue);
  prefs.setString(username, usernameValue);

  return true;
}
