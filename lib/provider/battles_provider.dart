import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/enums/day_of_week.dart';
import 'package:poorlex/schema/battle_expenditure_response/battle_expenditure_response.dart';
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/error_response/error_response.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';
import 'package:poorlex/schema/member_complete_battle_response/member_complete_battle_response.dart';
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';
import 'package:poorlex/schema/vote_response/vote_response.dart';

enum BattleStatus {
  RECRUITING,
  RECRUITING_FINISHED,
  PROGRESS,
  COMPLETE,
}

class BattlesProvider extends GetConnect {
  BattlesProvider();

  @override
  void onInit() {
    // prefix "/battles" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/battles";

    httpClient.addRequestModifier<Object?>((request) {
      final user = Get.find<UserController>();
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
  Future<List<FindingBattleResponse>> getAll(
      {required List<BattleStatus> status}) async {
    final response = await get(
      '',
      query: {
        "status": status.map((e) => e.name),
      },
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
  }) async {
    final response = await get(
      '/$battleId',
      decoder: (data) {
        return BattleResponse.fromJson(data);
      },
    );
    return response.body;
  }

  /// 회원 배틀 조회 (진행중)
  Future<List<MemberProgressBattleResponse>?> getProgress() async {
    final response = await get(
      '/progress',
      decoder: (data) {
        print(data);
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
    required FileWithName image,
  }) async {
    final formData = FormData({
      "image": MultipartFile(
        image.file,
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
  Future<Either<ErrorResponse, bool>> addParticipants({
    required int battleId,
  }) async {
    try {
      final response = await post("/$battleId/participants", null);
      if (response.statusCode == 201) {
        return Right(true);
      } else if (response.statusCode == 400) {
        return Left(ErrorResponse(message: "이미 참여한 배틀입니다.", tag: "배틀 참가 에러"));
      }

      throw response;
    } catch (e) {
      return Left(ErrorResponse(message: "알 수 없는 에러", tag: "배틀 참가 에러"));
    }
  }

  /// 배틀 탈퇴
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

  /// 배틀 삭제
  Future<void> deleteBattle({
    required int battleId,
  }) async {
    await delete("/$battleId");
  }

  /// 배틀 수정
  Future<void> patchBattle({
    required int battleId,
    String? name,
    String? introduction,
    FileWithName? image,
  }) async {
    final formData = FormData(
      {
        if (image != null)
          "image": MultipartFile(
            image.file,
            filename: image.name,
          ),
      },
    );

    await patch(
      "/$battleId",
      formData,
      query: {
        if (name != null) "name": name,
        if (introduction != null) "introduction": introduction,
      },
    );
  }

  Future<List<ParticipantRankingResponse>> getBattleRankings({
    required int battleId,
  }) async {
    final response = await get<List<ParticipantRankingResponse>>(
      "/$battleId/rankings",
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => ParticipantRankingResponse.fromJson(e))
            .toList();
      },
    );
    return response.body ?? [];
  }
}
