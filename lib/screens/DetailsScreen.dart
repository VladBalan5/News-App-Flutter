import 'package:flutter/material.dart';
import 'package:news_app_challenge_flutter/model/article_model.dart';
import 'package:get/get.dart';
import 'package:news_app_challenge_flutter/constants/constants.dart';
import 'package:news_app_challenge_flutter/services/singleton.dart';
import 'package:news_app_challenge_flutter/navigationBar/navigationBar.dart';

class DetailsScreen extends StatefulWidget {
  final ArticleModel article;

  DetailsScreen({required this.article});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  RxBool checkIcon = false.obs;
  Color buttonColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    List<ArticleModel> data = SavedData.instance.getArticle();

    try {
      ArticleModel? currentArticle =
          data.firstWhere((item) => item.title == widget.article.title);
      if (currentArticle != null) {
        checkIcon.value = true;
        buttonColor = customPrimaryColor.value;
      } else {
        checkIcon.value = false;
        buttonColor = Colors.black;
      }
    } catch (e) {
      checkIcon.value = false;
      buttonColor = Colors.black;
    }

    return Scaffold(
      bottomNavigationBar: NavigationTabBar(
        selectedIndex: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('images/back.png'),
                  ),
                ),
                Text(
                  'Article details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        checkIcon.value = !checkIcon.value;
                        if (checkIcon.value == true) {
                          SavedData.instance
                              .addArticle(article: widget.article);
                          buttonColor = customPrimaryColor.value;
                        } else {
                          SavedData.instance
                              .removeArticle(article: widget.article);
                          buttonColor = Colors.black;
                        }
                      });
                    },
                    child: Obx(
                      () => checkIcon.value
                          ? Image.asset('images/bookmark1.png',
                              color: buttonColor)
                          : Image.asset('images/bookmark0.png',
                              color: buttonColor),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 90.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: 90.0,
                      bottom: 60.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            widget.article.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 18.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.article.author ?? '',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          child: Divider(
                            color: Colors.grey[300],
                            indent: 110,
                            endIndent: 110,
                            height: 50,
                            thickness: 2.5,
                          ),
                        ),
                        Container(
                          child: Text(
                            widget.article.description,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 10),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Image.network(
                        widget.article.imageUrl,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
