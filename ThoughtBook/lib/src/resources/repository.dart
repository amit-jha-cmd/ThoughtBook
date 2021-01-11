import 'dart:async';
import 'data.api.provider.dart';
import '../model/data.model.dart';

class Repository {
  final apiProvider = DataApiProvider();

  Future<DataModel> fetchHistory(date) => apiProvider.fetchHistory(date);
  Future<DataModel> fetchToday() => apiProvider.fetchTodaysEntries();
  Future<bool> publishEntry(data) => apiProvider.publishEntry(data);
}
