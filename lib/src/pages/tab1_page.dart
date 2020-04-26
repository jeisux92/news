import 'package:flutter/material.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsServices>(context);

    return Scaffold(
      body: NewsList(newsService.headLines),
    );
  }
}
