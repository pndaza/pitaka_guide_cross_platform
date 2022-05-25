import 'package:flutter/foundation.dart';

import '../../models/category.dart' as filter;
import '../../models/recent.dart';
import '../../models/topic.dart';
import '../../repositories/category_repo.dart';
import '../../repositories/recent_repo.dart';
import '../../repositories/topic_repo.dart';
import 'search_bar.dart';
import 'topic_page_state.dart';

class TopicPageViewController {
  TopicPageViewController({
    required this.topicRepository,
    required this.categoryRepository,
    required this.recentRepository,
  });

  final TopicRepository topicRepository;
  final CategoryRepository categoryRepository;
  final RecentRepository recentRepository;

  late final List<Topic> _allTopic;
  late final List<filter.Category> _allCategory;

  late filter.Category _currentCategory;
  filter.Category? get currentCateogry => _currentCategory;

  String _filterText = '';
  FilterMode _filterMode = FilterMode.anywhere;

  final _state = ValueNotifier(const TopicPageState.loading());
  ValueListenable<TopicPageState> get state => _state;

  void onLoad({filter.Category? category}) async {
    _allTopic = await topicRepository.getAll();
    final categories = await categoryRepository.getAll();
    _allCategory = [
      const filter.Category(id: 0, name: 'အားလုံး'),
      ...categories
    ];

    //
    if (category == null) {
      _currentCategory = _allCategory.first;
      _state.value = TopicPageState.data(
        _allTopic,
        _allCategory,
        _currentCategory,
        _filterText,
      );
    } else {
      _currentCategory = category;
      final filterdTopics = _allTopic
          .where((element) => element.categoryID == category.id)
          .toList();
      _state.value = TopicPageState.data(
        filterdTopics,
        _allCategory,
        _currentCategory,
        _filterText,
      );
    }
  }

  void dispose() {
    _state.dispose();
  }

  void onCategoryChanged(filter.Category category) {
    _currentCategory = category;
    final filterdTopics = _getFilter(
      _allTopic,
      _currentCategory,
      _filterText,
      _filterMode,
    );
    _state.value = TopicPageState.data(
      filterdTopics,
      _allCategory,
      _currentCategory,
      _filterText,
    );
  }

  void onFilterTextChanged(String filterText) {
    _filterText = filterText;
    final filterdTopics = _getFilter(
      _allTopic,
      _currentCategory,
      _filterText,
      _filterMode,
    );
    _state.value = TopicPageState.data(
      filterdTopics,
      _allCategory,
      _currentCategory,
      _filterText,
    );
  }

  void onFilterModeChanged(FilterMode mode) {
    _filterMode = mode;
    final filterdTopics = _getFilter(
      _allTopic,
      _currentCategory,
      _filterText,
      _filterMode,
    );
    _state.value = TopicPageState.data(
      filterdTopics,
      _allCategory,
      _currentCategory,
      _filterText,
    );
  }

  List<Topic> _getFilter(List<Topic> all, filter.Category category,
      String filterText, FilterMode filterMode) {
    if (category.id == 0 && filterText.isEmpty) {
      return all;
    } else if (category.id == 0 && filterText.isNotEmpty) {
      return _allTopic
          .where((element) => _filterMode == FilterMode.anywhere
              ? element.name.contains(_filterText)
              : element.name.startsWith(_filterText))
          .toList();
    } else if (category.id != 0 && filterText.isEmpty) {
      return _allTopic
          .where((element) => element.categoryID == _currentCategory.id)
          .toList();
    }
    return _allTopic
        .where((element) => element.categoryID == _currentCategory.id &&
                _filterMode == FilterMode.anywhere
            ? element.name.contains(_filterText)
            : element.name.startsWith(_filterText))
        .toList();
  }

  void onTopicItemClicked(Topic topic) async {
    final recent = Recent(topic: topic, dateTime: DateTime.now());
    await recentRepository.insertOrReplace(recent);
  }
}
