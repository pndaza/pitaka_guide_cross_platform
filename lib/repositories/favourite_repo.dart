import 'dart:convert';

import '../data/shared_pref_client.dart';
import '../models/favourite.dart';

abstract class FavouriteRepository {
  Future<void> insert(Favourite favourite);

  Future<void> delete(Favourite favourite);
  Future<void> deletes(List<Favourite> favourites);
  Future<void> deleteAll();

  Future<List<Favourite>> getFavourites();
}

class PrefFavouriteRepository implements FavouriteRepository {
  @override
  Future<void> delete(Favourite favourite) async {
    final favourites = await getFavourites();
    favourites.removeWhere((element) => element.topic.id == favourite.topic.id);
    SharedPreferenceClient.favourites = json.encode(favourites);
  }

  @override
  Future<void> deleteAll() async {
    SharedPreferenceClient.favourites = '';
  }

  @override
  Future<void> deletes(List<Favourite> favourites) async {
    final savedFavourites = await getFavourites();
    for (final Favourite favourite in favourites) {
      savedFavourites
          .removeWhere((element) => element.topic.id == favourite.topic.id);
    }
    SharedPreferenceClient.favourites = json.encode(savedFavourites);
  }

  @override
  Future<List<Favourite>> getFavourites() async {
    final jsonString = SharedPreferenceClient.favourites;
    if (jsonString.isEmpty) return <Favourite>[];
    // parsing json to favourite
    return (json.decode(jsonString) as List)
        .map((e) => Favourite.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> insert(Favourite favourite) async {
    final favourites = await getFavourites();
    // removing if exist
    favourites.removeWhere((element) => element.topic.id == favourite.topic.id);
    favourites.add(favourite);
    favourites.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    SharedPreferenceClient.favourites = json.encode(favourites);
  }
}
