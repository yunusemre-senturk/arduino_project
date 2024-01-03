// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationnModel _$NotificationnModelFromJson(Map<String, dynamic> json) =>
    NotificationnModel(
      date: json['date'] as String,
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$NotificationnModelToJson(NotificationnModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'date': instance.date,
    };
