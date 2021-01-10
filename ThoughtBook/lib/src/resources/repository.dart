import 'dart:async';
import 'tweetPostProvider.dart';
import '../model/twitterPostModel.dart';

class Repository {
  final tweetPostProviderApi = TweetPostProvider();

  Future<Record> postTweet(String _tweet) =>
      tweetPostProviderApi.postTweet(_tweet);
}
