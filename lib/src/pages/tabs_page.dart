import 'package:flutter/material.dart';
import 'package:news/src/pages/tab1_page.dart';
import 'package:news/src/pages/tab2_page.dart';
import 'package:news/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _NavigationModel(),
      child: Scaffold(
        body: Center(
          child: _Pages(),
        ),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    final newsService = Provider.of<NewsServices>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (int value) => navigationModel.currentPage = value,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('For you'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text('Headers'),
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      
      controller: navigationModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  int get currentPage => _currentPage;

  set currentPage(int value) {
    this._currentPage = value;
    this._pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
