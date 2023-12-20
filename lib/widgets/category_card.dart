import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../views/category_view.dart';

class CategoryCard extends StatelessWidget {
const CategoryCard({super.key,required this.category});
final CategoryModel category;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return CategoryView(category:category.categoryName ,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          width: 160,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(category.image), fit: BoxFit.fill),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
