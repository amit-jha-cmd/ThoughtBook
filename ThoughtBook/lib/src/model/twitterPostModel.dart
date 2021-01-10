class Record {
  DateTime _created_at;
  String _id_str;
  String _text;

  Record.fromJSON(Map<String, dynamic> parsedJson) {
    _created_at = parsedJson['created_at'];
    _id_str = parsedJson['id_str'];
    _text = parsedJson['text'];
  }

  String get tweet_text => _text;
  DateTime get date_time => _created_at;
  String get id => _id_str;
}
