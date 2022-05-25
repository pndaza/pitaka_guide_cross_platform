import 'package:flutter/foundation.dart';
import 'package:pitakaguide/models/category.dart' as tag;
import 'package:pitakaguide/repositories/category_repo.dart';

import 'showcase_state.dart';

class ShowcaseViewController {
  ShowcaseViewController({required this.categoryRepository});
  final CategoryRepository categoryRepository;

  final _state = ValueNotifier<ShowcaseState>(const ShowcaseState.loading());
  ValueListenable<ShowcaseState> get state => _state;

  void onLoad() async {
    final categories = await _fetchCategories();
    _state.value = ShowcaseState.data(categories);
  }

  void dispose() {
    _state.dispose();
  }

  Future<List<tag.Category>> _fetchCategories() async {
    return await categoryRepository.getAll();
  }
}
