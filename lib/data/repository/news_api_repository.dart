import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/config/enum/categoris_type_news.dart';
import 'package:news_app/data/api/news_api.dart';
import 'package:news_app/data/model/news_model.dart';

import '../model/result_api.dart';

class NewsApiRepository {
  final NewsApi newsApi;

  NewsApiRepository({required this.newsApi});

  Future<ResultApi> getNews({
    required CategoriesTypeNews catagoriesTypeNews,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      ResultApi resultApi =
          await newsApi.getNews(categoriesTypeNews: catagoriesTypeNews);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultForError);
        List dataJsonList = List.from(data['articles']);
        List<NewsModel> listNews = [];
        for (var element in dataJsonList) {
          listNews.add(NewsModel.fromJson(element));
        }
        return ResultApi(isDone: true, resultForError: listNews);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(
        isDone: false,
        resultForError: 'No internet access',
      );
    }
  }

  Future<ResultApi> getSearchResult({
    required String searchText,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      ResultApi resultApi =
          await newsApi.getSearchResult(searchText: searchText);
      if (resultApi.isDone) {
        Map<String, dynamic> data = jsonDecode(resultApi.resultForError);
        List dataJsonList = List.from(data['articles']);
        List<NewsModel> listNews = [];
        for (var element in dataJsonList) {
          listNews.add(NewsModel.fromJson(element));
        }
        return ResultApi(isDone: true, resultForError: listNews);
      } else {
        return resultApi;
      }
    } else {
      return ResultApi(
        isDone: false,
        resultForError: 'No internet access',
      );
    }
  }
}
