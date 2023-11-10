// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopCastModel _$TopCastModelFromJson(Map<String, dynamic> json) => TopCastModel(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TopCastCastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopCastModelToJson(TopCastModel instance) =>
    <String, dynamic>{
      'cast': instance.cast,
    };

TopCastCastModel _$TopCastCastModelFromJson(Map<String, dynamic> json) =>
    TopCastCastModel(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
      json['cast_id'] as int?,
      json['character'] as String?,
      json['credit_id'] as String?,
      json['order'] as int?,
    );

Map<String, dynamic> _$TopCastCastModelToJson(TopCastCastModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
