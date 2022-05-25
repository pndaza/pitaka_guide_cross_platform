import 'dart:convert';

import '../data/shared_pref_client.dart';
import '../models/recent.dart';

abstract class RecentRepository {
  Future<void> insertOrReplace(Recent recent);

  Future<void> delete(Recent recent);

  Future<void> deletes(List<Recent> recents);

  Future<void> deleteAll();

  Future<List<Recent>> getRecents();
}

class PrefRecentRepository implements RecentRepository {
  @override
  Future<void> delete(Recent recent) async {
    final recents = await getRecents();
    recents.removeWhere((element) => element.topic.id == recent.topic.id);
    SharedPreferenceClient.recents = json.encode(recents);
  }

  @override
  Future<void> deleteAll() async {
    SharedPreferenceClient.recents = '{}';
  }

  @override
  Future<void> deletes(List<Recent> recents) async {
    final savedRecents = await getRecents();
    for (final Recent recent in recents) {
      savedRecents
          .removeWhere((element) => element.topic.id == recent.topic.id);
    }
    SharedPreferenceClient.recents = json.encode(savedRecents);
  }

  @override
  Future<List<Recent>> getRecents() async {
    final jsonString = SharedPreferenceClient.recents;
    if (jsonString.isEmpty) return <Recent>[];
    // parsing json to recent
    return (json.decode(jsonString) as List)
        .map((e) => Recent.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> insertOrReplace(Recent recent) async {
    final recents = await getRecents();
    // removing if exist
    recents.removeWhere((element) => element.topic.id == recent.topic.id);
    recents.add(recent);
    recents.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    SharedPreferenceClient.recents = json.encode(recents);
  }
}
