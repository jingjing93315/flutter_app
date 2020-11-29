import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/find/Section.dart';
import 'package:flutter_app/mine/ThirdScreen.dart';

import 'SectionItem.dart';

import 'package:http/http.dart' as http;

import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

// 暗号：原来还可以这么玩
class _FindScreenState extends State<FindScreen> {
  List<Section> _dataList = [];

  int currentPage = 1;

  // ScrollController _scrollController = ScrollController();
  getDataList() async {
    String url = 'http://m.app.haosou.com/index/getData?type=1&page=$currentPage';
    var response = await http.get(url);
    var data = response.body;
    var json = jsonDecode(data);
    setState(() {
      var resultList = Section.fromMapData(json);
      if(resultList.length == 0) {
        _refreshController.loadNoData();
      }
      if(currentPage == 1){
        _dataList = Section.fromMapData(json);
      } else {
        _dataList.addAll(resultList);
      }
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getDataList();
    // _scrollController.addListener(() {
    //   if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
    //     print('滑动到最底部了');
    //   }
    // });
  }

  _buildContent() {
    if (_dataList.isEmpty) {
      return new Center(child: CircularProgressIndicator());
    } else {
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(
          // refreshingIcon: ,
          refreshingText: '正在加载中',
          idleText: '拉刷新',
          completeText: '加载完成',
          failedText: '数据刷新异常',
          releaseText: '松开刷新',
        ),
        footer: ClassicFooter(
          idleText: '加载更多数据',
          loadingText: '玩命加载中...',
          noDataText: '没有更多数据啦',
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            // controller: _scrollController,
            itemCount: _dataList.length,
            itemBuilder: (context, index) {
              Section model = _dataList[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen('${model.name}')));
                },
                child: SectionItem(model),
              );
            }),
      );
    }
  }

  _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      currentPage = 1;
      getDataList();
      _refreshController.refreshCompleted();
    });
  }

  _onLoading() async {
    await Future.delayed(Duration(seconds: 1), () {
      currentPage++;
      getDataList();
      _refreshController.loadComplete();
      // _refreshController.loadFailed();
      // _refreshController.loadNoData();
    });

  }

  // Future<void> _onRefresh() async{
  //   await Future.delayed(Duration(seconds: 2),(){
  //     print('_onRefresh');
  //   });
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('发现')),
      body: _buildContent(),
    );
  }
}
