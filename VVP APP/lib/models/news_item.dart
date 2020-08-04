import 'package:flutter/material.dart';

class NewsItem {
  String id;
  String title;
  dynamic content;
  String writtenBy;
  List<String> imageURLs = [];
  DateTime postedAt;

  NewsItem(
      {@required this.title,
      @required this.id,
      @required this.content,
      this.imageURLs,
      this.writtenBy}) {
    this.postedAt = DateTime.now();
  }
}
