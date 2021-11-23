import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_example2/models/newsinfo.dart';
import 'package:rest_api_example2/utils/strings.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    }
    catch (Exceptin){
      return newsModel;
    }

    return newsModel;
  }
}