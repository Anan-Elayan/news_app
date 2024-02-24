import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/components/music_and_sport/bloc/music_and_sport_cubit.dart';

class ShowError extends StatelessWidget {
  final String errorMessage;

  const ShowError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        IconButton(
            onPressed: () =>context.read<MusicAndSportCubit>().refreshData(),
            icon:const  Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            )),
      ],
    );
  }
}
