import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poorlex/enums/social_type.dart';

part 'social_login.freezed.dart';
part 'social_login.g.dart';

@freezed
class SocialLoginModel with _$SocialLoginModel {
  factory SocialLoginModel({
    required String code,
    required SocialType socialType,
  }) = _SocialLoginModel;

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginModelFromJson(json);
}
