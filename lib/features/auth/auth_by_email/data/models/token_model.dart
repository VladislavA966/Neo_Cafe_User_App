import 'package:json_annotation/json_annotation.dart';
import 'package:neo_cafe_24/features/profile/data/models/profile_model/profile_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  final String message;
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "customer_profile")
  final ProfileModel customerProfile;

  AuthenticationResponse(
      {required this.message,
      required this.accessToken,
      required this.refreshToken,
      required this.customerProfile});

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
