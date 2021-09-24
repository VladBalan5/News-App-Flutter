import '../model/article_model.dart';
import 'package:get/get.dart';

class SavedData {
  static SavedData _instance = SavedData._();

  SavedData._();

  static SavedData get instance => _instance;

  static RxList<ArticleModel> _savedArticles = <ArticleModel>[].obs;

  void addArticle({required ArticleModel article}) {
    _savedArticles.add(article);
  }

  void removeArticle({required ArticleModel article}) =>
      _savedArticles.remove(article);

  RxList<ArticleModel> getArticle() {
    return _savedArticles;
  }
}
