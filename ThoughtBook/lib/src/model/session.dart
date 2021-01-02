class session {
  bool _loggedIn;
  String _username;
  String _token;
  String _key;

  void set setLogin(bool state) {
    _loggedIn = state;
  }

  bool get loggedIn => _loggedIn;

  void set setUsername(String name) {
    _username = name;
  }

  String get username => _username;

  void set setToken(String token) {
    _token = token;
  }

  String get token => _token;

  void set setKey(String key) {
    _key = key;
  }

  String get key => _key;
}

session activeSession = new session();
