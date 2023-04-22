import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:machine_test/home/home_module/data/model/home_results_model.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class HomeModel with _$HomeModel {
  @JsonSerializable(explicitToJson: true,includeIfNull: false)
  const factory HomeModel({
    final int ? page,
    final List<HomeResultsModel>? results,
   final int ? totalPages,
    final int ? totalResults,

  }) = _HomeModel;



  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}