import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/components/music_and_sport/bloc/music_and_sport_cubit.dart';

import '../../../../data/model/news_model.dart';
import 'card_news.dart';

class ListNews extends StatelessWidget {
  const ListNews({
    super.key,
    required this.newsList,
  });

  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return CardNews(
          onTapNews: () => context
              .read<MusicAndSportCubit>()
              .onTapNews(newsList.elementAt(index)),
          news: newsList.elementAt(index),
        );
      },
    );
  }
}
