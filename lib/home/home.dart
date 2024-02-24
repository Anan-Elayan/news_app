import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/bloc/home_cubit.dart';
import 'package:news_app/home/widget/home_body.dart';
import 'package:news_app/home/widget/template_categories_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (contextB) => HomeCubit(context: context),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon:const Icon(Icons.bookmark),
                onPressed: () =>context.read<HomeCubit>().goToSavedNews(),
                color: Colors.white,
                iconSize: 30,
              ),
              title: const Center(
                child: Column(
                  children: [
                    Text(
                      'News App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'US',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.selectedPage != current.selectedPage,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TemplateCategoriesTitle(
                        icon: Icons.music_note_rounded,
                        title: "Musics",
                        isSelected: state.selectedPage == 0,
                        onTap: () {
                          context.read<HomeCubit>().onTapTitleBottomBar(0);
                        },
                      ),
                      SizedBox(),
                      TemplateCategoriesTitle(
                        icon: Icons.sports_baseball,
                        title: "Sport",
                        isSelected: state.selectedPage == 1,
                        onTap: () {
                          context.read<HomeCubit>().onTapTitleBottomBar(1);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<HomeCubit>().onTapSearch(),
              backgroundColor: Colors.black87,
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
            body: const HomeBody(),
          ),
        );
      }),
    );
  }
}
