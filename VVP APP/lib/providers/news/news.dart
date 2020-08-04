import 'package:flutter/material.dart';
import 'package:vvp/models/news_item.dart';

class News with ChangeNotifier {
  List<NewsItem> _items = [
    NewsItem(
        id: DateTime.now().toString(),
        title: "Welcome to The Pub",
        content: "Hej nya jobbare!",
        writtenBy: "Josef Atoui"),
    NewsItem(
        id: DateTime.now().toString(),
        title: "Welcome to The Pub",
        content: "Hej nya jobbare!",
        writtenBy: "Josef Atoui"),
    NewsItem(
        id: DateTime.now().toString(),
        title: "Welcome to The Pub",
        content: "Hej nya jobbare!",
        writtenBy: "Josef Atoui"),
    NewsItem(
        id: DateTime.now().toString(),
        title: "Swish me",
        content: "0707769116",
        writtenBy: "Josef Atoui"),
  ];

  void addItem(NewsItem item) {
    _items.add(item);
    notifyListeners();
  }

  List<NewsItem> get items {
    return [..._items];
  }

  Future<void> updateItems() async {
    _items = _items;
    notifyListeners();
  }
}
