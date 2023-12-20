import 'package:flutter/cupertino.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List <CategoryModel>categories=const [
    CategoryModel(image: 'assets/business.jpg', categoryName: 'Business'),
    CategoryModel(image: 'assets/entertaiment.jpg', categoryName: 'Entertaiment'),
    CategoryModel(image: 'assets/general.jpeg', categoryName: 'General'),
    CategoryModel(image: 'assets/healthy.jpg', categoryName: 'Healthy'),
    CategoryModel(image: 'assets/science.jpeg', categoryName: 'Science'),
    CategoryModel(image: 'assets/sports.jpeg', categoryName: 'Sports'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context,index){return
            CategoryCard(category: categories[index],);},
          scrollDirection: Axis.horizontal,

        ),
      ),
    );
  }
}
