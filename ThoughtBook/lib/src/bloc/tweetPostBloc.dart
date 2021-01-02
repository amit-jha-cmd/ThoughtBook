import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/twitterPostModel.dart';

class TweetPostBloc {
  final _repository = Repository();
  final _tweetPoster = PublishSubject<TwitterPostModel>();

  Observable<TwitterPostModel> get postedTweet => _tweetPoster.stream;

  PostTweet(String _tweet) async {
    TwitterPostModel PostModel = await _repository.postTweet(_tweet);
    _tweetPoster.sink.add(PostModel);
  }

  dispose() {
    _tweetPoster.close();
  }
}

final bloc = TweetPostBloc();
