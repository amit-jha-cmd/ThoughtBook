class TwitterPostModel {
  DateTime _created_at;
  int _id;
  String _id_str;
  String _text;
  String _in_reply_to_status_id_str;
  Map<String, dynamic> _user;

  TwitterPostModel.fromJSON(Map<String, dynamic> parsedJson) {
    _created_at = parsedJson['created_at'];
    _id = parsedJson['id'];
    _id_str = parsedJson['id_str'];
    _text = parsedJson['text'];
    _in_reply_to_status_id_str = parsedJson['in_reply_to_status_id_str'];
    _user = parsedJson['user'];
  }

  String get tweet_text => _text;
  DateTime get date_time => _created_at;
  String get id => _id_str;
  String get tweetId => _in_reply_to_status_id_str;
}
