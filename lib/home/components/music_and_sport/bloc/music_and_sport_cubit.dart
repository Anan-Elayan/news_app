import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/config/enum/categoris_type_news.dart';
import 'package:news_app/config/enum/loading_type.dart';
import 'package:news_app/config/root/app_root.dart';
import 'package:news_app/data/model/result_api.dart';

import '../../../../data/model/news_model.dart';
import '../../../../data/repository/news_api_repository.dart';
import 'music_and_sport_state.dart';

class MusicAndSportCubit extends Cubit<MusicAndSportState> {
  final NewsApiRepository newsRepository;
  final CategoriesTypeNews categoriesTypeNews;
  final BuildContext context;

  MusicAndSportCubit({
    required this.newsRepository,
    required this.categoriesTypeNews,
    required this.context,
  }) : super(const MusicAndSportState()) {
    getNews();
  }

  Future<void> getNews() async {
    final ResultApi resultApi =
        await newsRepository.getNews(catagoriesTypeNews: categoriesTypeNews);

    if (resultApi.isDone) {
      List<NewsModel> newsList = List.from(resultApi.resultForError);
      emit(state.copyWith(
        loadingType: LoadingType.successfully,
        listNews: newsList,
        error: '',
      ));
    } else {
      emit(
        state.copyWith(
          error: resultApi.resultForError,
          loadingType: LoadingType.error,
        ),
      );
    }
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.pushNamed(context, AppRoot.showNewsContent, arguments: newsModel);
  }

  void refreshData() {
    emit(state.copyWith(loadingType: LoadingType.loading));
    getNews();
  }
}
