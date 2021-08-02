import 'dart:convert';

import 'package:google_news/models/models.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String apiKey = "";

  final endPointUrl = "https://newsapi.org/v2/top-headlines?country=pl&apiKey=";

  Future<List<NewsModel>> getNews() async {

    http.Response res = await http.get(Uri.parse(endPointUrl + apiKey));

    if(res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List body = json["articles"];

      List<NewsModel> news = body.map((item) => NewsModel.fromJson(item)).toList();
      return news;
    } else {
      throw ("Error with fetching data");
    }

  }

}