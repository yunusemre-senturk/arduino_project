// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'notification.g.dart';

@JsonSerializable()
class NotificationnModel {
  String title;
  String subtitle;
  String date;
  NotificationnModel(
      {required this.date, required this.subtitle, required this.title});

  factory NotificationnModel.fromJson(Map<String, dynamic> json) {
    return _$NotificationnModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationnModelToJson(this);
}
