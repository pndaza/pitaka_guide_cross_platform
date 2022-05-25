import 'topic.dart';

const String _jsonKeyWord = 'topic';
const String _jsonKeyDateTime = 'date_time';

class Favourite {
  final Topic topic;
  final DateTime dateTime;
  Favourite({
    required this.topic,
    required this.dateTime,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      topic: Topic.fromJson(json[_jsonKeyWord]),
      dateTime: DateTime.parse(json[_jsonKeyDateTime]),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      _jsonKeyWord: topic.toJson(),
      _jsonKeyDateTime: dateTime.toIso8601String(),
    };
  }
}
