import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_response.freezed.dart';
part 'friend_response.g.dart';

/// friend
@freezed
class FriendResponse with _$FriendResponse {
  const factory FriendResponse({
    required int id,
    required String nickname,
    required int weeklyExpenditure,
  }) = _FriendResponse;

  factory FriendResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendResponseFromJson(json);
}
