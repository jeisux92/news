import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/src/models/category_model.dart';
import 'package:news/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = 'ff6608a44fe349f2aa64b1964dbad1a9';

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  String _selectedCategory = 'business';
  NewsServices() {
    _getTopHeadLines();
    categories.forEach((element) {
      categoryArticles[element.name] = new List();
    });
  }
  String get selectedCategory => this._selectedCategory;

  List<Article> get articlesByCategory => categoryArticles[selectedCategory];

  set selectedCategory(String value) {
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  Future getArticlesByCategory(String category) async {
    if (categoryArticles[category].length > 0) {
      return categoryArticles[category];
    }
    final url =
        '$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY&category=$category';
    final response = await http.get(url);
    final newsResponses = newsResponseFromJson(response.body);
    this.categoryArticles[category].addAll(newsResponses.articles);
    notifyListeners();
  }

  Future _getTopHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY';
    final response = await http.get(url);
    final newsResponses = newsResponseFromJson(response.body);
    this.headLines.addAll(newsResponses.articles);
    notifyListeners();
  }
}
