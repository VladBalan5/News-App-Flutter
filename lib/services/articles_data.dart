import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';

const apiURL = 'https://newsapi.org/v2/everything';
const apiKey = '88d188882e794c02829b2dfcb514732c';
String search = 'apple';

Future<List<ArticleModel>> getNews(search) async {
  Uri uri = Uri.parse('$apiURL?q=$search&apiKey=$apiKey');

  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List articalsList = map['articles'];

    List<ArticleModel> articlesList = articalsList
        .map((jsonData) => ArticleModel.fromJson(jsonData))
        .toList();

    return articlesList;
  } else {
    print("error");
    return [];
  }
}
