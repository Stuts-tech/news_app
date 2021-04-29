import 'package:flutter/material.dart';
import 'package:newsapp/models/newsinfo.dart';
import 'package:newsapp/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;
  @override
  void initState(){
    _newsModel= ApiManager().getNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('NEWS APP'),

      ),
      body: Container(
        child:FutureBuilder<NewsModel>(
          future:_newsModel,
          builder: (context,snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    var article= snapshot.data.articles[index];
                return Container(
                  height: 100,
                  child: Row(
                  children:<Widget> [
                     Card(

                      clipBehavior: Clip.antiAlias,
                      shape : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    child: AspectRatio(
                      aspectRatio:1,
                      child: Image.network(
                        article.urlToImage,
                        fit: BoxFit.cover,
                      )

                    ),


                  ),
                    Flexible(
                      child: Column(
                        children:<Widget>[
                          Text(article.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(article.description, overflow: TextOverflow.ellipsis,),
                        ]
                      ),
                    ),

                  ],

                  ),

                );
              });


            }
            else{
              return CircularProgressIndicator();

            }


       },
        ),
      ),
    );



  }
}
