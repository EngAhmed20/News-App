import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({super.key,required this.category });
  final String category;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          NewsListView(category: category,),

        ],),
      ),
    );
  }
}