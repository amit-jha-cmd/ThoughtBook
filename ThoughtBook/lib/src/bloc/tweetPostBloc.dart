import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../model/twitterPostModel.dart';

class TweetPostBloc {
  final _repository = Repository();
  final _tweetPoster = PublishSubject<Record>();

  Observable<Record> get postedTweet => _tweetPoster.stream;

  PostTweet(String _tweet) async {
    Record PostModel = await _repository.postTweet(_tweet);
    _tweetPoster.sink.add(PostModel);
  }

  dispose() {
    _tweetPoster.close();
  }
}

final bloc = TweetPostBloc();
