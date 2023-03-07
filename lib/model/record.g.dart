// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      weight: (json['weight'] as num).toDouble(),
      datetime: DateTime.parse(json['datetime'] as String),
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'weight': instance.weight,
      'datetime': instance.datetime.toIso8601String(),
      'description': instance.description,
      'photoUrl': instance.photoUrl,
    };
