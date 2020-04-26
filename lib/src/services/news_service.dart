import 'package:flutter/cupertino.dart';
import 'package:news/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = 'ff6608a44fe349f2aa64b1964dbad1a9';

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];

  NewsServices() {
    _getTopHeadLines();
  }

  Future _getTopHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY';
    final response = await http.get(url);
    final newsResponses = newsResponseFromJson(response.body);
    this.headLines.addAll(newsResponses.articles);
    notifyListeners();
  }
}
