import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/enum/loading_type.dart';
import 'package:news_app/home/components/music_and_sport/widget/card_news.dart';
import 'package:news_app/search_page/bloc/search_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    // marge listener and builder to gather
    return BlocConsumer<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          previous.loadingTypes != current.loadingTypes,
      listener: (context, state) {
        switch (state.loadingTypes) {
          case LoadingType.loading:
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Loading'),
                      ],
                    ),
                  ),
                ),
              ),
            );
            break;
          case LoadingType.error:
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                          size: 50,
                        ),
                        Text('Some Error'),
                        Text(state.errorMassage),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<SearchCubit>().onTapOkOnErrorDialog(),
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            break;
          case LoadingType.successfully:
          case LoadingType.init:
            Navigator.pop(context);
            break;

          default:
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: state.textFieldController,
                cursorColor: Colors.red,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  context.read<SearchCubit>().searchText();
                },
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => context.read<SearchCubit>().searchText(),
                    color: Colors.white,
                  ),
                  hintText: 'Enter text to Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                return CardNews(
                  news: state.newsList.elementAt(index),
                  onTapNews: () => context
                      .read<SearchCubit>()
                      .onTapNews(state.newsList.elementAt(index)),
                );
              },
            ))
          ],
        );
      },
    );
  }
}
