
import 'package:flutter/cupertino.dart';
import 'package:news_app/config/extension/string.dart';
import '../../config/enum/categoris_type_news.dart';
import '../model/result_api.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  Future<ResultApi> getNews({
    required CategoriesTypeNews categoriesTypeNews,
  }) async {
    try {
      Uri url = Uri.https(''.baseUrlNews,''.baseUrlWithTop,{
        'country': 'us',
        'category': categoriesTypeNews.value,
        'apiKey': ''.getApiKey,
      });
      var response = await http.get(url);
      print(url);
      if(response.statusCode==200){
        return ResultApi(isDone: true, resultForError: response.body);
      }else{
        return ResultApi(isDone: false, resultForError: 'Some Error According in server');
      }
    } catch (e) {
      debugPrint(e.toString());
      return ResultApi(isDone: false, resultForError: 'Some Error accord');
    }
  }Future<ResultApi> getSearchResult({
    required String searchText,
  }) async {
    try {
      Uri url = Uri.https(''.baseUrlNews,''.baseUrlWithEverything,{
        'q': searchText,
        'sortBy': 'publishedAt',
        'apiKey': ''.getApiKey,
      });
      var response = await http.get(url);
      print(url);
      if(response.statusCode==200){
        return ResultApi(isDone: true, resultForError: response.body);
      }else{
        return ResultApi(isDone: false, resultForError: 'Some Error According in server');
      }
    } catch (e) {
      debugPrint(e.toString());
      return ResultApi(isDone: false, resultForError: 'Some Error accord');
    }
  }
}
