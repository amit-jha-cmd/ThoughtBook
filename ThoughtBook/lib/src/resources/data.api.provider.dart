import 'dart:async';
import 'package:ThoughtBook/src/ui/components/persistent.data.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/data.model.dart';

final String url = "https://4baf5a48d0de.ngrok.io";

class DataApiProvider {
  Client clinet = Client();

  Future<DataModel> fetchHistory(date, username, platform) async {
    read().then((value) async {
      final token = value['token'];

      final response = await clinet.get(
        "$url/history?username=$username&platform=$platform&datetime=$date",
        headers: {'authtoken': token},
      );

      if (response.statusCode == 200) {
        return DataModel.fromJosn(json.decode(response.body));
      } else {
        throw Exception('Failed to Load. Please try gain');
      }
    });
  }

  Future<DataModel> fetchTodaysEntries(username, platform) async {
    read().then((value) async {
      final token = value['token'];

      final response = await clinet.get(
        "$url/todaysentry?username=$username&platform=$platform",
        headers: {'authtoken': token},
      );

      if (response.statusCode == 200) {
        return DataModel.fromJosn(
          json.decode(response.body),
        );
      } else {
        throw Exception('Failed to load. Please try again');
      }
    });
  }

  Future<bool> publishEntry(data) async {
    read().then((value) async {
      final token = value['token'];

      final response = await clinet.post(
        "$url/postentry",
        headers: {'authtoken': token},
        body: {
          'timestamp': data['timestamp'],
          'entry': data['entry'],
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }).catchError(() {
      return false;
    });
  }
}
