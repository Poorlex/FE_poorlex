import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poorlex/schema/battle_success_count_response/battle_success_count_response.dart';
import 'package:poorlex/schema/friend_response/friend_response.dart';
import 'package:poorlex/schema/my_page_expenditure_response/my_page_expenditure_response.dart';
import 'package:poorlex/schema/my_page_level_info_response/my_page_level_info_response.dart';

part 'my_page_response.freezed.dart';
part 'my_page_response.g.dart';

@freezed
class MyPageResponse with _$MyPageResponse {
  const factory MyPageResponse({
    required String nickname,
    String? description,
    required MyPageLevelInfoResponse levelInfo,
    required BattleSuccessCountResponse battleSuccessInfo,
    required int friendTotalCount,
    required List<FriendResponse> friends,
    required int expenditureTotalCount,
    required List<MyPageExpenditureResponse> expenditures,
  }) = _MyPageResponse;

  factory MyPageResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPageResponseFromJson(json);
}


// {


//   "battleSuccessInfo": {
//     "totalBattleSuccessCount": 0,
//     "hardBattleSuccessCount": 0,
//     "normalBattleSuccessCount": 0,
//     "easyBattleSuccessCount": 0
//   },
//   "friendTotalCount": 0,
//   "friends": [
//     {
//       "id": 0,
//       "level": 0,
//       "nickname": "string",
//       "weeklyExpenditure": 0
//     }
//   ],
//   "expenditureTotalCount": 0,
//   "expenditures": [
//     {
//       "id": 0,
//       "date": "2024-05-18",
//       "amount": 0,
//       "imageUrl": "string"
//     }
//   ]
// }