// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempeture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tempeture _$TempetureFromJson(Map<String, dynamic> json) => Tempeture(
      json['deviceuid'] as String?,
      json['location'] as String?,
      json['type'] as String?,
      (json['value'] as num?)?.toDouble(),
    )..date = json['date'] as String?;

Map<String, dynamic> _$TempetureToJson(Tempeture instance) => <String, dynamic>{
      'deviceuid': instance.deviceuid,
      'location': instance.location,
      'type': instance.type,
      'value': instance.value,
      'date': instance.date,
    };
