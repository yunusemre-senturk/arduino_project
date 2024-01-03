// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'tempeture.g.dart';

@JsonSerializable()
class Tempeture {
  String? deviceuid;
  String? location;
  String? type;
  double? value;
  String? date;

  Tempeture(this.deviceuid, this.location, this.type, this.value, this.date);

  factory Tempeture.fromJson(Map<String, dynamic> json) {
    return _$TempetureFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TempetureToJson(this);
}
