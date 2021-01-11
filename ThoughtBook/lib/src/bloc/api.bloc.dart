import 'package:ThoughtBook/src/model/data.model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ApiBloc {
  final _repository = Repository();
  final _historyFetcher = PublishSubject<DataModel>();
  final _entrysToday = PublishSubject<DataModel>();

  Observable<DataModel> get getHistory => _historyFetcher.stream;
  Observable<DataModel> get getTodaysEntry => _entrysToday.stream;

  fetchHistory(DateTime timestamp) async {
    DataModel entryModel = await _repository.fetchHistory(timestamp);
    _historyFetcher.sink.add(entryModel);
  }

  fetchTodaysEntry() async {
    DataModel todaysEntryModel = await _repository.fetchToday();
    _entrysToday.sink.add(todaysEntryModel);
  }

  Future<bool> postTodayEntry(data) async {
    bool posted = await _repository.publishEntry(data);
    return posted;
  }

  dispose() {
    _historyFetcher.close();
    _entrysToday.close();
  }
}

final bloc = ApiBloc();
