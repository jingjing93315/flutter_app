import 'dart:convert';

class Article {
  final String articleTitle;
  final String articleSubtitle;
  final String articlePic;
  final String userName;
  final String count;

  // 构造函数
  Article({
    this.articleTitle,
    this.articleSubtitle,
    this.articlePic,
    this.userName,
    this.count
  });



  // String => List<Article>
  static List<Article> resolveDataFromJsonString(String json){
    List<Article> listModel = new List<Article>();
    List list = jsonDecode(json)['list'];
    list.forEach((element) {
      var model = Article(
        articlePic: element['articlePic'],
        articleTitle: element['articleTitle'],
        articleSubtitle: element['articleSubtitle'],
        userName: element['userName'],
        count: element['count']
      );

      listModel.add(model);
    });
    return listModel;
  }
}


