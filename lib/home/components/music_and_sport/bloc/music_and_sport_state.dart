
import 'package:equatable/equatable.dart';

import '../../../../config/enum/loading_type.dart';
import '../../../../data/model/news_model.dart';

class MusicAndSportState extends Equatable {
  const MusicAndSportState({
    this.listNews = const [],
    this.loadingType = LoadingType.loading,
    this.error = '',
  });

  final List<NewsModel> listNews;
  final LoadingType loadingType;
  final String error;

  MusicAndSportState copyWith({
    List<NewsModel>? listNews,
    LoadingType? loadingType,
    String? error,
  }) =>
      MusicAndSportState(
        error: error ?? this.error,
        loadingType: loadingType ?? this.loadingType,
        listNews: listNews ?? this.listNews,
      );

  @override
  List<Object?> get props => [listNews, loadingType, error];
}
