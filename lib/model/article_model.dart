class ArticleModel {
  String title;
  String? author;
  String imageUrl;
  String content;
  String description;

  ArticleModel({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.content,
    required this.description,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> jsonData) {
    return ArticleModel(
      title: jsonData['title'],
      author: jsonData['author'],
      imageUrl: jsonData['urlToImage'],
      content: jsonData['content'],
      description: jsonData['description'],
    );
  }
}
