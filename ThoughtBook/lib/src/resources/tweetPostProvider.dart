import 'dart:async';
import 'package:ThoughtBook/src/model/session.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/twitterPostModel.dart';

class TweetPostProvider {
  Client clinet = Client();

  Future<Record> postTweet(_tweet) async {}
}
