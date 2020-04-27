import 'package:flutter/material.dart';
import 'package:news/src/models/category_model.dart';
import 'package:news/src/services/news_service.dart';
import 'package:news/src/theme/dark_theme.dart';
import 'package:news/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _CategoryList(),
            Consumer<NewsServices>(
              builder: (context, newsService, _) {
                return Expanded(
                  child: newsService.articlesByCategory.length == 0
                      ? Center(child: CircularProgressIndicator())
                      : NewsList(newsService.articlesByCategory),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsServices>(builder: (context, newsService, _) {
      return Container(
        height: 80,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: newsService.categories.length,
          itemBuilder: (context, index) {
            final categoryName = newsService.categories[index].name;
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _CategoryButton(newsService.categories[index]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "${categoryName[0].toUpperCase()}${categoryName.substring(1)}")
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;
  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsServices>(builder: (context, service, _) {
      return GestureDetector(
        onTap: () {
          final newsService = Provider.of<NewsServices>(context, listen: false);
          newsService.selectedCategory = category.name;
        },
        child: Container(
          width: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            category.icon,
            color: service.selectedCategory == category.name
                ? theme.accentColor
                : Colors.black54,
          ),
        ),
      );
    });
  }
}
