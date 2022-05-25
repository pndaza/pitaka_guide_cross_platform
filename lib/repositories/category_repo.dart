import 'package:fast_csv/fast_csv_ex.dart' as fast_csv_ex;
import 'package:flutter/services.dart';
import 'package:pitakaguide/data/constants.dart';
import 'package:pitakaguide/models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAll();
}

class CsvCategoryRepository extends CategoryRepository {
  CsvCategoryRepository();

  static List<Category>? _cached;

  @override
  Future<List<Category>> getAll() async {
    // loading from cache;
    if (_cached != null) return _cached!;

    // loading from assets
    final csvString = await rootBundle.loadString(kAssetsCategoryPath);
    final results = fast_csv_ex.parse(csvString, separator: '\t');
    final List<Category> categories = <Category>[];
    for (final result in results) {
      final id = int.parse(result[0]);
      final name = result[1];
      categories.add(Category(
        id: id,
        name: name,
      ));
    }
    // cache
    _cached = categories;

    return categories;
  }
}
