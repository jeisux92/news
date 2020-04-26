import 'package:flutter/material.dart';
import 'package:news/src/models/news_models.dart';
import 'package:news/src/theme/dark_theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> _news;

  NewsList(this._news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this._news.length,
      itemBuilder: (BuildContext context, int index) {
        Article article = this._news[index];
        return _New(article: article, index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article article;
  final int index;

  _New({@required this.article, @required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard(article, index),
        _TitleCard(article),
        _ImageCard(article),
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article article;
  final int index;
  const _TopBarCard(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style: TextStyle(color: theme.accentColor)),
          Text('${article.source.name}. ',
              style: TextStyle(color: theme.accentColor))
        ],
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article article;

  const _TitleCard(this.article);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article article;

  _ImageCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
