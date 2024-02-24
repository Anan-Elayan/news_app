import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/root/app_root.dart';
import 'package:news_app/data/local/hive_local_storg.dart';

import '../../data/model/news_model.dart';

part 'saved_news_state.dart';

class SavedNewsCubit extends Cubit<SavedNewsState> {
  final BuildContext context;

  SavedNewsCubit({required this.context}) : super(const SavedNewsState()){
    getAllSavedNews();
  }

  void getAllSavedNews() {
    List<Map<dynamic, dynamic>> allNewsJson =
        context.read<HiveStorg>().getAllSavedNews();
    List<NewsModel> newsList = List.generate(
      allNewsJson.length,
      (index) => NewsModel.fromJson(
        allNewsJson.elementAt(
          index,
        ),
      ),
    );
    emit(state.copyWith(
      newsList: newsList,
    ));
  }

  void removeFromList(String key) {
    List<NewsModel> newsList = List.from(state.newsList);
    newsList.removeWhere((element) => element.title == key);
    emit(state.copyWith(
      newsList: newsList,
    ));
  }

  void onTapNews(NewsModel newsModel) {
    Navigator.pushNamed(
      context,
      AppRoot.showNewsContent,
      arguments: newsModel,
    );
  }
}
