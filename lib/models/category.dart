import 'package:flutter/material.dart';

@immutable
class Category {
  final int id;
  final String name;

  const Category({
    required this.id,
    required this.name,
  });

  static const categories = <Category>[
      Category(id: 0, name: 'အားလုံး'),
      Category(id: 1, name: 'သုတ္တန်'),
      Category(id: 2, name: 'ဇာတက'),
      Category(id: 3, name: 'ဝတ္ထု'),
      Category(id: 4, name: 'ဂါထာ'),
      Category(id: 5, name: 'အဖွင့်-သံဝဏ္ဏနာ'),
      Category(id: 6, name: 'သရုပ်'),
      Category(id: 7, name: 'ပုဂ္ဂိုလ်'),
      Category(id: 8, name: 'ရဟန်း'),
      Category(id: 9, name: 'ထေရ-ထေရီ'),
      Category(id: 10, name: 'နတ်စသည်'),
      Category(id: 11, name: 'မင်း၊မင်းသား၊ပုဏ္ဏား၊အမတ်စသည်'),
      Category(id: 12, name: 'မြို့'),
      Category(id: 13, name: 'အကျိုး-အပြစ်'),
    ];
}
