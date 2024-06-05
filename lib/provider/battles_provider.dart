import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/enums/day_of_week.dart';
import 'package:poorlex/schema/battle_expenditure_response/battle_expenditure_response.dart';
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';
import 'package:poorlex/schema/member_complete_battle_response/member_complete_battle_response.dart';
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart';
import 'package:poorlex/schema/vote_response/vote_response.dart';

class BattlesProvider extends GetConnect {
  final UserController user;
  BattlesProvider({
    required this.user,
  });

  @override
  void onInit() {
    // prefix "/battles" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/battles";

    /// [TODO] header에 token 잘 들어가는지 확인 필요
    httpClient.addRequestModifier<Object?>((request) {
      final token = user.userToken;
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      print(
        '### REQUEST [method: ${request.method}]'
        '\nURL: ${request.url}'
        '\n${"Header : ${request.headers}"}'
        '\n ### RESPONSE BODY: ${response.body}',
      );
      return response;
    });
  }

  /// 모든 배틀 조회 (모집중, 모집완료)
  Future<List<FindingBattleResponse>> getAll() async {
    final response = await get(
      '',
      decoder: (data) {
        return (data as List<dynamic>).map((e) {
          return FindingBattleResponse.fromJson(e);
        }).toList();
      },
    );

    return response.body ?? [];
  }

  Future<BattleResponse?> getDetailById({
    required int battleId,
    required DateTime date,
  }) async {
    final response = await get(
      '/$battleId',
      decoder: (data) {
        return BattleResponse.fromJson(data);
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 회원 배틀 조회 (진행중)
  Future<List<MemberProgressBattleResponse>?> getProgress() async {
    final response = await get(
      '/progress',
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => MemberProgressBattleResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 회원 배틀 조회 (완료)
  Future<List<MemberCompleteBattleResponse>?> getComplete() async {
    final response = await get(
      '/complete',
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => MemberCompleteBattleResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// 배틀 생성
  Future<bool> createBattles({
    required String name,
    required String introduction,
    required int budget,
    required int maxParticipantSize,
    required XFile image,
  }) async {
    final formData = FormData({
      "image": MultipartFile(
        File(image.path),
        filename: image.name,
      ),
    });
    try {
      final response = await post(
        "",
        formData,
        query: {
          "name": name,
          "introduction": introduction,
          "budget": budget.toString(),
          "maxParticipantSize": maxParticipantSize.toString(),
        },
      );
      return response.status == 201;
    } catch (e) {
      return false;
    }
  }

  /// [TEST] x
  /// 배틀 요일별 참가자 지출 목록 조회
  Future<List<BattleExpenditureResponse>?> getExpenditures({
    required int battleId,
    required DayOfWeek dayOfWeek,
  }) async {
    final response = await get(
      "/$battleId/expenditures",
      query: {
        "dayOfWeek": dayOfWeek.name,
      },
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => BattleExpenditureResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 회원 배틀 기간 지출 목록 조회
  Future<List<BattleExpenditureResponse>?> getMemberExpenditures({
    required int battleId,
  }) async {
    final response = await get(
      "/$battleId/expenditures/member",
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => BattleExpenditureResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 배틀 알림 조회
  Future<List<VoteResponse>?> getBattlesAlarms({
    required int battleId,
    required DateTime dateTime,
  }) async {
    final response = await get(
      "/$battleId/alarms",
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => VoteResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] x
  /// 미확인 배틀 알림 수 조회
  Future<int?> getUncheckedBattlesAlarms({
    required int battleId,
  }) async {
    final response = await get(
      "/$battleId/alarms/unchecked",
      decoder: (data) {
        return data['count'];
      },
    );
    return response.body;
  }

  Future<BattleNotificationResponse?> getBattleNotification({
    required int battleId,
  }) async {
    final response = await get(
      "/$battleId/notification",
      decoder: (data) {
        return BattleNotificationResponse.fromJson(data);
      },
    );
    return response.body;
  }

  Future<bool> createBattleNotification({
    required int battleId,
    required int memberId,
    required String content,
    required String imageUrl,
  }) async {
    try {
      final response = await post(
        "/$battleId/notification",
        {
          "memberInfo": {
            "memberId": memberId,
          },
          "request": {
            "content": content,
            "imageUrl": imageUrl,
          }
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> patchBattleNotification({
    required int battleId,
    required String content,
    required String imageUrl,
  }) async {
    try {
      final response = await patch(
        "/$battleId/notification",
        {
          "content": content,
          "imageUrl": imageUrl,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// 배틀 참가
  Future<bool> addParticipants({
    required int battleId,
  }) async {
    try {
      final response = await post("/$battleId/participants", null);
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  /// [REFACTOR] api 수정 필요
  Future<bool> deleteParticipants({
    required int battleId,
  }) async {
    try {
      final response = await delete(
        "/$battleId/participants",
      );
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      return false;
    }
  }
}
