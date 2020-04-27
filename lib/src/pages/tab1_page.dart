import 'package:flutter/material.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsServices>(builder: (context, newsService, _) {
        return newsService.headLines.length == 0
            ? Center(child: CircularProgressIndicator())
            : NewsList(newsService.headLines);
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
