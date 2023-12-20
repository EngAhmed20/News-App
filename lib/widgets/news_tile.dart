import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

// cached network image
class NewsTile extends StatelessWidget {
  final ArticalModel articalModel;
  final String url;

  const NewsTile({ required this.articalModel,required this.url});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ContactItem(articalModel);

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                 articalModel.image??'https://techsouthafrica.co.za/wp-content/uploads/2023/01/No-Image.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(articalModel.title,
                maxLines: 2,overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(articalModel.subTitle??' ',style: TextStyle(color: Colors.grey,fontSize: 14),),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),

      ),
    );
  }
  void ContactItem(ArticalModel model)async{
    await launch('${model.url}');


  }



}
