import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_notification_response.freezed.dart';
part 'battle_notification_response.g.dart';

@freezed
class BattleNotificationResponse with _$BattleNotificationResponse {
  factory BattleNotificationResponse({
    String? content,
    String? imageUrl,
  }) = _BattleNotificationResponse;

  factory BattleNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$BattleNotificationResponseFromJson(json);
}
