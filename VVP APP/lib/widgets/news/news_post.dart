import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vvp/models/news_item.dart';
import 'package:intl/intl.dart';
import 'package:device_apps/device_apps.dart';


class NewsPost extends StatelessWidget {
  NewsItem _item;
  Function(BuildContext context, String number) action;

  NewsPost(this._item, this.action);



  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 8,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child:
                Text(_item.title, style: Theme.of(context).textTheme.headline2),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              child: Text(
                _item.content,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: action == null ? null : () {
                print("pressed");
                action(context, _item.content);},
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Skriven av: " + _item.writtenBy,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text("Postad: " + DateFormat('yyyy-MM-dd').format(_item.postedAt),
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ],
      ),
    );
  }
}
