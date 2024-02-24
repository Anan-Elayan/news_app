import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/config/enum/loading_type.dart';
import 'package:news_app/data/api/news_api.dart';
import 'package:news_app/data/model/result_api.dart';
import 'package:news_app/data/repository/news_api_repository.dart';
import '../../config/root/app_root.dart';
import '../../data/model/news_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BuildContext context;
  SearchCubit({
    required this.context,
  }) : super(SearchState(
    textFieldController: TextEditingController(),
  ));
  void onTapOkOnErrorDialog() {
    emit(state.copyWith(
      loadingTypes: LoadingType.init,
      errorMassage: '',
    ));
  }

  Future<void> searchText() async {
    emit(state.copyWith(
      loadingTypes: LoadingType.loading,
    ));
    String textSearch = state.textFieldController.text.trim();
    NewsApiRepository newsApiRepository = NewsApiRepository(
      newsApi: NewsApi(),
    );
    ResultApi resultApi =
    await newsApiRepository.getSearchResult(searchText: textSearch);
    if (resultApi.isDone) {
      List<NewsModel> news = List.from(resultApi.resultForError);
      emit(state.copyWith(
        loadingTypes: LoadingType.successfully,
        newsList: news,
      ));
    } else {
      emit(state.copyWith(
        errorMassage: resultApi.resultForError,
        loadingTypes: LoadingType.error,
      ));
    }
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.pushNamed(
      context,
      AppRoot.showNewsContent,
      arguments: newsModel,
    );
  }
}
