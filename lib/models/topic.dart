import 'dart:convert';
import 'package:flutter/material.dart';

@immutable
class Topic {
  final int id;
  final String name;
  final int categoryID;
  final int bookID;
  final int pageNumber;

  const Topic({
    required this.id,
    required this.name,
    required this.categoryID,
    required this.bookID,
    required this.pageNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categoryID': categoryID,
      'bookID': bookID,
      'pageNumber': pageNumber,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      categoryID: map['categoryID']?.toInt() ?? 0,
      bookID: map['bookID']?.toInt() ?? 0,
      pageNumber: map['pageNumber']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source));
}
