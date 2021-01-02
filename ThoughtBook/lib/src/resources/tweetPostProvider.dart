import 'dart:async';
import 'package:ThoughtBook/src/model/session.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/twitterPostModel.dart';

class TweetPostProvider {
  Client clinet = Client();
  final _apiKey = activeSession.key;
  final _token = activeSession.token;
  final _username = activeSession.username;

  Future<TwitterPostModel> postTweet(_tweet) async {
    final response = await clinet.post(
        "https://api.twitter.com/1.1/statuses/update.json" + "status=$_tweet",
        headers: <String, String>{
          "authorization": "OAuth",
          "oauth_consumer_key": "oauth_customer_key",
          "oauth_nonce": "generated_oauth_nonce",
          "oauth_signature": "generated_oauth_signature",
          "oauth_signature_method": "HMAC-SHA1",
          "oauth_timestamp": "generated_timestamp",
          "oauth_token": "oauth_token",
          "oauth_version": "1.0"
        });

    if (response.statusCode == 200) {
      // post was successfull
      return TwitterPostModel.fromJSON(jsonDecode(response.body));
    }
  }
}
