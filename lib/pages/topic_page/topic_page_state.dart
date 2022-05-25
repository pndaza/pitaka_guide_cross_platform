import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/category.dart';
import '../../models/topic.dart';

part 'topic_page_state.freezed.dart';

@freezed
@freezed
class TopicPageState with _$TopicPageState {
  const factory TopicPageState.loading() = Loading;
  const factory TopicPageState.data(
    List<Topic> topics,
    List<Category> categories,
    Category currentCategory,
    String filterText,
  ) = Data;
  const factory TopicPageState.noData({String? message}) = NoData;
}
