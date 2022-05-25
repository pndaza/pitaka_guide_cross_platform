import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/category.dart';

part 'showcase_state.freezed.dart';

@freezed
class ShowcaseState with _$ShowcaseState {
  const factory ShowcaseState.loading() = Loading;
  const factory ShowcaseState.data(List<Category> categories) = Data;
}
