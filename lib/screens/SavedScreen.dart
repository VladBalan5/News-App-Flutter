import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_challenge_flutter/services/singleton.dart';
import 'package:news_app_challenge_flutter/screens/SavedArticleDetails.dart';
import 'package:news_app_challenge_flutter/navigationBar/navigationBar.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationTabBar(
        selectedIndex: 1,
      ),
      body: SavedData.instance.getArticle().length > 0
          ? Container(
              color: Colors.grey.shade100,
              child: Obx(
                () => ListView.builder(
                    itemCount: SavedData.instance.getArticle().length,
                    itemBuilder: (BuildContext context, int index) {
                      var article = SavedData.instance.getArticle()[index];
                      return GestureDetector(
                        onTap: () =>
                            Get.to(() => SavedArticleDetails(article: article)),
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          //  elevation: 0,
                          margin: EdgeInsets.only(
                              top: 25.0, left: 25.0, right: 25.0),
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
                    }),
              ),
            )
          : Center(
              child: Text(
                'Saved Screen is empty. Start saving some articles!',
                style: TextStyle(fontSize: 15),
              ),
            ),
    );
  }
}
