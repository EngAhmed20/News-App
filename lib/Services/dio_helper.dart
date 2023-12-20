import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class DioHelper{
 final Dio dio;
 DioHelper(this.dio);
Future<List<ArticalModel>> getNews({required String category})async{
try{
  Response response=await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=804fb8244562487589287b21e4499872&category=${category}');
  Map<String,dynamic>jsonData=response.data;
  List<dynamic>articles=jsonData['articles'];
  List<ArticalModel>ArticalList=[];
  for(var article in articles)
  {
    ArticalModel articalModel=
    ArticalModel(image: article['urlToImage'],
        title: article['title'],
        subTitle: article['description'],
        url:article['url'],
    );
    ArticalList.add(articalModel);
  }
  return ArticalList;
}
catch(e){
 return[];
}

 }

 }


