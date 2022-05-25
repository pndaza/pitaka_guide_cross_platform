// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'topic_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)
        data,
    required TResult Function(String? message) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicPageStateCopyWith<$Res> {
  factory $TopicPageStateCopyWith(
          TopicPageState value, $Res Function(TopicPageState) then) =
      _$TopicPageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TopicPageStateCopyWithImpl<$Res>
    implements $TopicPageStateCopyWith<$Res> {
  _$TopicPageStateCopyWithImpl(this._value, this._then);

  final TopicPageState _value;
  // ignore: unused_field
  final $Res Function(TopicPageState) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$TopicPageStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'TopicPageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)
        data,
    required TResult Function(String? message) noData,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements TopicPageState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  $Res call(
      {List<Topic> topics,
      List<Category> categories,
      Category currentCategory,
      String filterText});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res> extends _$TopicPageStateCopyWithImpl<$Res>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, (v) => _then(v as _$Data));

  @override
  _$Data get _value => super._value as _$Data;

  @override
  $Res call({
    Object? topics = freezed,
    Object? categories = freezed,
    Object? currentCategory = freezed,
    Object? filterText = freezed,
  }) {
    return _then(_$Data(
      topics == freezed
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
      categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      currentCategory == freezed
          ? _value.currentCategory
          : currentCategory // ignore: cast_nullable_to_non_nullable
              as Category,
      filterText == freezed
          ? _value.filterText
          : filterText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Data implements Data {
  const _$Data(final List<Topic> topics, final List<Category> categories,
      this.currentCategory, this.filterText)
      : _topics = topics,
        _categories = categories;

  final List<Topic> _topics;
  @override
  List<Topic> get topics {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  final List<Category> _categories;
  @override
  List<Category> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final Category currentCategory;
  @override
  final String filterText;

  @override
  String toString() {
    return 'TopicPageState.data(topics: $topics, categories: $categories, currentCategory: $currentCategory, filterText: $filterText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other.currentCategory, currentCategory) &&
            const DeepCollectionEquality()
                .equals(other.filterText, filterText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topics),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(currentCategory),
      const DeepCollectionEquality().hash(filterText));

  @JsonKey(ignore: true)
  @override
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)
        data,
    required TResult Function(String? message) noData,
  }) {
    return data(topics, categories, currentCategory, filterText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
  }) {
    return data?.call(topics, categories, currentCategory, filterText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(topics, categories, currentCategory, filterText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements TopicPageState {
  const factory Data(final List<Topic> topics, final List<Category> categories,
      final Category currentCategory, final String filterText) = _$Data;

  List<Topic> get topics => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  Category get currentCategory => throw _privateConstructorUsedError;
  String get filterText => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoDataCopyWith<$Res> {
  factory _$$NoDataCopyWith(_$NoData value, $Res Function(_$NoData) then) =
      __$$NoDataCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$NoDataCopyWithImpl<$Res> extends _$TopicPageStateCopyWithImpl<$Res>
    implements _$$NoDataCopyWith<$Res> {
  __$$NoDataCopyWithImpl(_$NoData _value, $Res Function(_$NoData) _then)
      : super(_value, (v) => _then(v as _$NoData));

  @override
  _$NoData get _value => super._value as _$NoData;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NoData(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NoData implements NoData {
  const _$NoData({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'TopicPageState.noData(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoData &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$NoDataCopyWith<_$NoData> get copyWith =>
      __$$NoDataCopyWithImpl<_$NoData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)
        data,
    required TResult Function(String? message) noData,
  }) {
    return noData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
  }) {
    return noData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Topic> topics, List<Category> categories,
            Category currentCategory, String filterText)?
        data,
    TResult Function(String? message)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(NoData value) noData,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(NoData value)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData implements TopicPageState {
  const factory NoData({final String? message}) = _$NoData;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$NoDataCopyWith<_$NoData> get copyWith =>
      throw _privateConstructorUsedError;
}
