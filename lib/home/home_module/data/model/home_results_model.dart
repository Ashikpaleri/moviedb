import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_results_model.freezed.dart';
part 'home_results_model.g.dart';

@freezed
class HomeResultsModel with _$HomeResultsModel {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory HomeResultsModel({
    final bool ? adult,
   final String? backdropPath,
    final  List<int> ? genreIds,
    final int ? id,
    final String ? originalLanguage,
   final String ? originalTitle,
    final String ? overview,
    final  double ? popularity,
    final String ? posterPath,
    final DateTime ? releaseDate,
    final String ? title,
    final bool ? video,
    final double ? voteAverage,
    final int ? voteCount,
  }) = _HomeResultsModel;



  factory HomeResultsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResultsModelFromJson(json);
}