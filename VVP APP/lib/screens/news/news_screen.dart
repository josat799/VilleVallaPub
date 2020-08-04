import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvp/widgets/navigation/custom_layout.dart';
import 'package:vvp/widgets/news/news_post.dart';
import 'package:vvp/providers/news/news.dart';
import 'package:vvp/widgets/navigation/custom_bottom_navigationbar.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  initApps() async {
    Application app = await DeviceApps.getApp('se.bankgirot.swish');
    DeviceApps.openApp(app.packageName);
  }

  Future<void> launchSwish(BuildContext context, String number) async {

    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Launching Swish"), duration: Duration(seconds: 2),));
    ClipboardManager.copyToClipBoard(number);
    Application app = await DeviceApps.getApp('se.bankgirot.swish');
    DeviceApps.openApp(app.packageName);
  }

  @override
  Widget build(BuildContext context) {
    final loadedNewsItems = Provider.of<News>(context);
    final mediaQuery = MediaQuery.of(context);
    return CustomLayout(
      Padding(
        padding:
            EdgeInsets.only(top: mediaQuery.padding.top, left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Text(
              "News",
              style: Theme.of(context).textTheme.headline1,
            ),
            Flexible(
              child: RefreshIndicator(
                  onRefresh: () => loadedNewsItems.updateItems(),
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: loadedNewsItems.items.length,
                        itemBuilder: (ctx, i) => NewsPost(loadedNewsItems.items[i], launchSwish),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
