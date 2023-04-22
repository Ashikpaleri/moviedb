// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeResultsModel _$$_HomeResultsModelFromJson(Map<String, dynamic> json) =>
    _$_HomeResultsModel(
      adult: json['adult'] as bool?,
      backdropPath: json['backdropPath'] as String?,
      genreIds:
          (json['genreIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: json['voteCount'] as int?,
    );

Map<String, dynamic> _$$_HomeResultsModelToJson(_$_HomeResultsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('adult', instance.adult);
  writeNotNull('backdropPath', instance.backdropPath);
  writeNotNull('genreIds', instance.genreIds);
  writeNotNull('id', instance.id);
  writeNotNull('originalLanguage', instance.originalLanguage);
  writeNotNull('originalTitle', instance.originalTitle);
  writeNotNull('overview', instance.overview);
  writeNotNull('popularity', instance.popularity);
  writeNotNull('posterPath', instance.posterPath);
  writeNotNull('releaseDate', instance.releaseDate?.toIso8601String());
  writeNotNull('title', instance.title);
  writeNotNull('video', instance.video);
  writeNotNull('voteAverage', instance.voteAverage);
  writeNotNull('voteCount', instance.voteCount);
  return val;
}
