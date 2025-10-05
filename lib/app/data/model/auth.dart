import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
sealed class Auth with _$Auth {
  factory Auth.model({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    required UserModel user,
  }) = AuthModel;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
sealed class User with _$User {
  factory User.model(
      {required int id,
      required String name,
      required String email}) = UserModel;

  factory User.fromJson(Map<String, Object> json) => _$UserFromJson(json);
}
