import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_ranking_response.freezed.dart';
part 'participant_ranking_response.g.dart';

@freezed
class ParticipantRankingResponse with _$ParticipantRankingResponse {
  const factory ParticipantRankingResponse({
    required int rank,
    required int level,
    required String nickname,
    required int expenditure,
    required String role,
  }) = _ParticipantRankingResponse;

  factory ParticipantRankingResponse.fromJson(Map<String, dynamic> json) =>
      _$ParticipantRankingResponseFromJson(json);
}
