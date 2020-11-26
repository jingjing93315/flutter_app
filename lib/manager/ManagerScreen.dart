import 'package:flutter/material.dart';
import 'package:flutter_app/manager/Article.dart';
import 'package:flutter_app/manager/ArticleItem.dart';

class ManagerScreen extends StatefulWidget {
  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {

  List<Article> _dataList = [];

  getDataList(){
   setState(() {
     _dataList = Article.resolveDataFromJsonString("""
    {
       "list": [
    {
    "articleId": "1001",
    "articleTitle": "2017年全国兰展：400图文件夹",
    "articleSubtitle": "全国展",
    "articlePic": "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1766066825,2906599954&fm=26&gp=0.jpg",
    "userName": "花痴党",
    "count": "246"
    },
    {
    "articleId": "1002",
    "articleTitle": "2019年杭州兰展",
    "articleSubtitle": "杭州展",
    "articlePic": "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2162071428,2190895476&fm=26&gp=0.jpg",
    "userName": "花痴党",
    "count": "123"
    },
    {
    "articleId": "1003",
    "articleTitle": "云裳2020北京兰展",
    "articleSubtitle": "北京展",
    "articlePic": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=878408286,2859261148&fm=26&gp=0.jpg",
    "userName": "花痴党",
    "count": "187"
    },
    {
    "articleId": "1004",
    "articleTitle": "假酸浆",
    "articleSubtitle": "全国展",
    "articlePic": "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1821200571,31466678&fm=26&gp=0.jpg",
    "userName": "一花一世界",
    "count": "443"
    },
    {
    "articleId": "1005",
    "articleTitle": "紫花风铃木",
    "articleSubtitle": "花展",
    "articlePic": "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3432023094,105020052&fm=26&gp=0.jpg",
    "userName": "一花一世界",
    "count": "429"
    },
    {
    "articleId": "1006",
    "articlePic": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3501583875,315743878&fm=26&gp=0.jpg",
    "articleTitle": "白雪木",
    "articleSubtitle": "花展",
    "userName": "花伴侣说",
    "count": "121"
    }
    ]
    }
    """);
   });

  }
  @override
  void initState(){
    getDataList();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: Text('管理')
        ),
        body: ListView.builder(
            itemBuilder: (context, index){
              Article model = _dataList[index];
              return ArticleItem(model);
            },
          itemCount: _dataList.length,
        )
    );
  }
}


/*
*
*    "list": [
    {
    "articleId": "1001",
    "articleTitle": "2017年全国兰展：400图文件夹",
    "articleSubtitle": "全国展",
    "articlePic": "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1766066825,2906599954&fm=26&gp=0.jpg",
    "userName": "花痴党",
    "count": "246"
    },
    {
    "articleId": "1002",
    "articleTitle": "2019年杭州兰展",
    "articleSubtitle": "杭州展",
    "articlePic": "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2162071428,2190895476&fm=26&gp=0.jpg",
    "userName": "花痴党",
    "count": "123"
    },
    {
    "articleId": "1003",
    "articleTitle": "云裳2020北京兰展",
    "articleSubtitle": "北京展",
    "articlePic": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=878408286,2859261148&fm=26&gp=0.jpg",
    "userName": "花痴党",
    "count": "187"
    },
    {
    "articleId": "1004",
    "articleTitle": "假酸浆",
    "articleSubtitle": "全国展",
    "articlePic": "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1821200571,31466678&fm=26&gp=0.jpg",
    "userName": "一花一世界",
    "count": "443"
    },
    {
    "articleId": "1005",
    "articleTitle": "紫花风铃木",
    "articleSubtitle": "花展",
    "articlePic": "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3432023094,105020052&fm=26&gp=0.jpg",
    "userName": "一花一世界",
    "count": "429"
    },
    {
    "articleId": "1006",
    "articlePic": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3501583875,315743878&fm=26&gp=0.jpg",
    "articleTitle": "白雪木",
    "articleSubtitle": "花展",
    "userName": "花伴侣说",
    "count": "121"
    }
    ]
* */