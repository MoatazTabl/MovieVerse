import 'package:json_annotation/json_annotation.dart';

part 'top_cast_model.g.dart';

@JsonSerializable()
class TopCastModel {
  final List<TopCastCastModel?>? cast;

  TopCastModel(this.cast);

  factory TopCastModel.fromJson(Map<String, dynamic> json) =>
      _$TopCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopCastModelToJson(this);
}

@JsonSerializable()
class TopCastCastModel {
  final bool? adult;
  final int? gender;
  final int? id;
  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;
  final String? name;
  @JsonKey(name: 'original_name')
  final String? originalName;
  final double? popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'cast_id')
  final int? castId;
  final String? character;
  @JsonKey(name: 'credit_id')
  final String? creditId;
  final int? order;

  TopCastCastModel(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory TopCastCastModel.fromJson(Map<String, dynamic> json) =>
      _$TopCastCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopCastCastModelToJson(this);
}
