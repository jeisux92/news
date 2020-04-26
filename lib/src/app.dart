import 'package:flutter/material.dart';
import 'package:news/src/pages/tabs_page.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/theme/dark_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsServices(),
        )
      ],
      child: MaterialApp(
        title: 'news app',
        theme: theme,
        home: TabsPage(),
      ),
    );
  }
}
