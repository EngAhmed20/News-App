import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Services/dio_helper.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';
class NewsListView extends StatefulWidget {
  const NewsListView({required this.category });
final String category;
  @override
  State<NewsListView> createState() => _NewsListViewState();
}
class _NewsListViewState extends State<NewsListView> {
  var future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future=DioHelper(Dio()).getNews(category:widget.category );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(future: future, builder: (context,snapshot){
      if(snapshot.hasData)
        {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context,index)=>NewsTile(articalModel: snapshot.data![index],url: snapshot.data![index].url.toString()),
              itemCount:snapshot.data!.length);
        }
      else if(snapshot.hasError){
        return errorMsg();
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Text errorMsg() =>  Text('OOPS,there is an error');
}
