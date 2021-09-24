import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_challenge_flutter/model/article_model.dart';
import 'package:news_app_challenge_flutter/services/articles_data.dart';
import 'package:news_app_challenge_flutter/screens/DetailsScreen.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:news_app_challenge_flutter/navigationBar/navigationBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxList<ArticleModel> articlesList = <ArticleModel>[].obs;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews(search).then((value) {
      setState(() {
        if (value.isNotEmpty) {
          articlesList.value = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationTabBar(
        selectedIndex: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 10.0, bottom: 40.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for articles",
                  prefixIcon: Image.asset('images/search.png'),
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  search = text;
                  print(search);
                  if (text.length > 2) {
                    getNews(search).then((value) {
                      if (value.isNotEmpty) {
                        articlesList.value = value;
                        isLoading = false;
                      } else {
                        print("List is Empty");
                      }
                    });
                  }
                },
              ),
            ),
            isLoading
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 250.0),
                      width: 400,
                      color: Colors.grey[100],
                      child: Column(
                        children: [
                          Platform.isIOS
                              ? CupertinoActivityIndicator(
                                  radius: 20.0,
                                )
                              : CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text(
                            'Loading articles...',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Container(
                      color: Colors.grey[100],
                      child: Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.only(top: 1.0),
                          itemCount: articlesList.length,
                          itemBuilder: (context, index) {
                            return listItems(articlesList[index]);
                          },
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget listItems(ArticleModel article) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailsScreen(article: article),
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        //  elevation: 0,
        margin: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              height: 120,
              width: 120,
              child: Image.network(
                article.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(right: 25.0),
                  child: Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    article.author ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
