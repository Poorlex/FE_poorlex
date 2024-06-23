import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';

import 'battles_provider_test.mocks.dart';

@GenerateMocks([BattlesProvider])
void main() {
  group("BattlesProvider", () {
    final MockBattlesProvider _mockBattlesProvider = MockBattlesProvider();

    test("should fetch all battles", () async {
      /// 참여중을 조회하는 status
      final recruitingStatus = [
        BattleStatus.RECRUITING,
        BattleStatus.RECRUITING_FINISHED
      ];
      when(_mockBattlesProvider.getAll(status: recruitingStatus)).thenAnswer(
        (_) async {
          return [
            FindingBattleResponse(
              battleId: 1,
              name: "1번 배틀입니다.",
              introduction: "환영합니다. 첫 배틀이에요!",
              imageUrl: "imageUrl",
              difficulty: "difficulty",
              budget: 150000,
              currentParticipant: 2,
              maxParticipantCount: 6,
            ),
          ];
        },
      );
      final result =
          await _mockBattlesProvider.getAll(status: recruitingStatus);
      expect(result, isA<List<FindingBattleResponse>>());
    });
  });
}
