import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/enum/categoris_type_news.dart';
import 'package:news_app/config/enum/loading_type.dart';
import 'package:news_app/data/api/news_api.dart';
import 'package:news_app/data/repository/news_api_repository.dart';
import 'package:news_app/home/components/music_and_sport/widget/list_news.dart';
import 'package:news_app/home/components/music_and_sport/widget/show_error.dart';

import '../bloc/music_and_sport_cubit.dart';
import '../bloc/music_and_sport_state.dart';

class MusicAndSportNews extends StatelessWidget {
  const MusicAndSportNews({super.key,required this.categoriesTypeNews});
  final CategoriesTypeNews categoriesTypeNews;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicAndSportCubit>(
      create: (contextB) => MusicAndSportCubit(
        context: context,
        newsRepository: NewsApiRepository(
          newsApi: NewsApi(),
        ), categoriesTypeNews: categoriesTypeNews,
      ),
      child: BlocBuilder<MusicAndSportCubit, MusicAndSportState>(
        builder: (context, state) {
          if (state.loadingType == LoadingType.loading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else if (state.loadingType == LoadingType.error) {
            return ShowError(errorMessage: state.error);
          } else {
            return ListNews(
              newsList: state.listNews,
            );
          }
        },
      ),
    );
  }
}
