import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pitakaguide/models/topic.dart';

import '../../data/basic_state.dart';
import '../../data/constants.dart';
import '../../data/shared_pref_client.dart';
import '../../models/favourite.dart';
import '../../packages/native_pdf_renderer/assets_pdf_viewer.dart';
import '../../repositories/favourite_repo.dart';

class ReaderViewController {
  ReaderViewController({
    required this.word,
    required this.favouriteRepository,
  });
  final Topic word;
  final FavouriteRepository favouriteRepository;

  late final String assetsPath;

  late List<Favourite> _favourites;

  final _stateStatus = ValueNotifier(StateStaus.loading);
  ValueNotifier<StateStaus> get stateStatus => _stateStatus;

  final List<String> _bookNames = ['ပထမတွဲ', 'ဒုတိယတွဲ', 'တတိယတွဲ'];
  String get bookName => _bookNames[word.bookID - 1];

  late final int _initialPage;
  int get initialPage => _initialPage;

  late final ValueNotifier<bool> _isAddedFavourite;
  ValueListenable<bool> get isAddedFavourite => _isAddedFavourite;

  late final ValueNotifier<Axis> _scrollDirection;
  ValueListenable<Axis> get scrollDirection => _scrollDirection;

  late final ValueNotifier<ColorMode> _colorMode;
  ValueListenable<ColorMode> get colorMode => _colorMode;

  void onLoad() async {
    assetsPath = '$kAssetsPdfPath/${word.bookID}.pdf';

    _initialPage = word.pageNumber;

    //
    _favourites = await favouriteRepository.getFavourites();
    if (_favourites.map((element) => element.topic.id).contains(word.id)) {
      _isAddedFavourite = ValueNotifier(true);
    } else {
      _isAddedFavourite = ValueNotifier(false);
    }
    // initialize scroll direction from sharedpref
    final scrollModeIndex = SharedPreferenceClient.scrollDirectionIndex;
    final scrollMode = Axis.values[scrollModeIndex];
    _scrollDirection = ValueNotifier<Axis>(scrollMode);
    _stateStatus.value = StateStaus.data;

    final colorModeIndex = SharedPreferenceClient.pdfThemeModeIndex;
    final colorMode = ColorMode.values[colorModeIndex];
    _colorMode = ValueNotifier(colorMode);
  }

  Future<void> onClickedFavourite() async {
    _isAddedFavourite.value = !_isAddedFavourite.value;
    final favourite = Favourite(
      topic: word,
      dateTime: DateTime.now(),
    );
    // save
    if (_isAddedFavourite.value) {
      await favouriteRepository.insert(favourite);
    } else {
      await favouriteRepository.delete(favourite);
    }
  }

  void onToggleScrollMode() {
    if (_scrollDirection.value == Axis.vertical) {
      _scrollDirection.value = Axis.horizontal;
    } else {
      _scrollDirection.value = Axis.vertical;
    }

    // save
    SharedPreferenceClient.scrollDirectionIndex = _scrollDirection.value.index;
  }

  void onChangedColorMode(ColorMode colorMode) {
    _colorMode.value = colorMode;
    SharedPreferenceClient.pdfThemeModeIndex = colorMode.index;
  }
}
