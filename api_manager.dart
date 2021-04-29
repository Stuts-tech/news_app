
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/newsinfo.dart';

class ApiManager {

  Future<NewsModel> getNews() async{

    var client= http.Client();
    var newsModel = null;
    try {

      var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API-key");

     var response = await client.get(url);


     if (response.statusCode == 200) {
       var jsonString = response.body;
       var jsonMap = jsonDecode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
     }
   }
   catch(Exceptions){
     return newsModel;
   }
    return newsModel;

  }
}