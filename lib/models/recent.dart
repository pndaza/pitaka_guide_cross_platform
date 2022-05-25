import 'package:pitakaguide/models/topic.dart';

const String _jsonKeyWord = 'topic';
const String _jsonKeyDateTime = 'date_time';

class Recent {
  final Topic topic;
  final DateTime dateTime;
  Recent({
    required this.topic,
    required this.dateTime,
  });

  factory Recent.fromJson(Map<String, dynamic> json) {
    return Recent(
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
