import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "bonus_points")
  int? bonusPoints;

  ProfileModel({
    this.id,
    this.userId,
    this.firstName,
    this.bonusPoints,
    this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
