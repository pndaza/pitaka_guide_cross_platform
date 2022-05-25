import 'package:fast_csv/fast_csv_ex.dart' as fast_csv_ex;
import 'package:flutter/services.dart';
import 'package:pitakaguide/data/constants.dart';

import '../models/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getAll();
  Future<List<Topic>> getWords({required int categoryID});
}

class CsvTopicRepository extends TopicRepository {
  CsvTopicRepository();

  static List<Topic>? _cached;

  @override
  Future<List<Topic>> getAll() async {
    // loading from cache
    if (_cached != null) return _cached!;
    // loading from assets
    final csvString = await rootBundle.loadString(kAssetsTopicPath);
    final results = fast_csv_ex.parse(csvString, separator: '\t');
    final List<Topic> words = <Topic>[];
    for (final result in results) {
      final id = int.parse(result[0]);
      final word = result[1];
      final categoryID = int.parse(result[2]);
      final bookId = int.parse(result[3]);
      final pageNumber = int.parse(result[4]);
      words.add(Topic(
        id: id,
        name: word,
        categoryID: categoryID,
        bookID: bookId,
        pageNumber: pageNumber,
      ));
    }
    // do cache
    _cached = words;
    return words;
  }

  @override
  Future<List<Topic>> getWords({required int categoryID}) async {
    final topics = await getAll();
    return topics.where((topic) => topic.categoryID == categoryID).toList();
  }
}
