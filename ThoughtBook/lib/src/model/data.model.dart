class DataModel {
  String _id;
  List<_Data> data;

  DataModel.fromJosn(Map<String, dynamic> parsedJSON) {
    _id = parsedJSON['_id'];

    List<_Data> temp;
    for (int i = 0; i < parsedJSON['data'].length; i++) {
      _Data result = _Data(parsedJSON['data']);
      temp.add(result);
    }

    data = temp;
  }

  List<_Data> get entries => data;
  String get user_id => _id;
}

class _Data {
  String _id;
  DateTime timestamp;
  String entry;

  _Data(result) {
    _id = result['id'];
    timestamp = result["timestamp"];
    entry = result['entry'];
  }

  String get entry_data => entry;
  DateTime get timestamp_data => timestamp;
}
