import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/local/hive_local_storg.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/home/bloc/home_cubit.dart';
import 'package:news_app/home/components/music_and_sport/widget/card_news.dart';
import 'package:news_app/saved_news/bloc/saved_news_cubit.dart';

class SavedNews extends StatelessWidget {
  const SavedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedNewsCubit>(
      create: (contextB) => SavedNewsCubit(context: context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Saved News',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<SavedNewsCubit, SavedNewsState>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                NewsModel newsModel = state.newsList.elementAt(index);
                return CardNews(
                  news: newsModel,
                  onTapNews: () =>
                      context.read<SavedNewsCubit>().onTapNews(newsModel),
                  isSaved:
                      context.read<HiveStorg>().isKeyExist(newsModel.title),
                  onChangeSavedNews: (value) =>
                      context.read<SavedNewsCubit>().removeFromList(value),
                );
              },
              itemCount: state.newsList.length,
            );
          },
        ),
      ),
    );
  }
}
