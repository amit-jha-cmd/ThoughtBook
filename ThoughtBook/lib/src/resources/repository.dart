import 'dart:async';
import 'data.api.provider.dart';
import '../model/data.model.dart';

class Repository {
  final apiProvider = DataApiProvider();

  Future<DataModel> fetchHistory(date, username, platform) =>
      apiProvider.fetchHistory(date, username, platform);
  Future<DataModel> fetchToday(username, platform) =>
      apiProvider.fetchTodaysEntries(username, platform);
  Future<bool> publishEntry(data) => apiProvider.publishEntry(data);
}
