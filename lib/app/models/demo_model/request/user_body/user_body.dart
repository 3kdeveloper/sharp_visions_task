import 'package:json_annotation/json_annotation.dart';

part 'user_body.g.dart';

@JsonSerializable()
class UserBody {
  UserBody({
    required this.email,
    required this.password,
    required this.deviceToken,
    required this.language,
  });

  final String email;
  final String password;
  @JsonKey(name: 'device_token')
  final String deviceToken;
  final String language;

  factory UserBody.fromJson(Map<String, dynamic> json) =>
      _$UserBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UserBodyToJson(this);
}
