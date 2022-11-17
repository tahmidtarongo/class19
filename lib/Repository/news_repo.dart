import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:maan_academy_news/Model/News_details_model.dart';
import 'package:maan_academy_news/Server%20Config/config.dart';

import '../Model/News_model.dart';


class NewsRepo{

Future<NewsModel> getNews() async{
  var response = await http.get(Uri.parse(Config.serverUrl + Config.latestNewsUrl));
  if(response.statusCode == 200){
    return NewsModel.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Error Occurred');
  }
}

Future<NewsDetailsModel> getNewsDetails(String id) async{
  var response = await http.get(Uri.parse('${Config.serverUrl + Config.newsDetailsUrl}/$id'));
  if(response.statusCode == 200){
    return NewsDetailsModel.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Error Occurred');
  }
}

}