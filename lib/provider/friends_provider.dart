import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/schema/friend_response/friend_response.dart';

class FriendsProvider extends GetConnect {
  final UserController user;
  FriendsProvider({
    required this.user,
  });

  @override
  void onInit() {
    // prefix "/battles" 적용
    httpClient.baseUrl = "${dotenv.get('SERVER_URL')}/friends";

    /// [TODO] header에 token 잘 들어가는지 확인 필요
    httpClient.addRequestModifier<Object?>((request) {
      final token = user.userToken().token;
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

  /// [TEST] 동작 확인 필요
  Future<List<FriendResponse>?> getFriends({
    required int memberId,
  }) async {
    final response = await get(
      '',
      query: {'memberId': memberId.toString()},
      decoder: (data) {
        return (data as List<dynamic>)
            .map((e) => FriendResponse.fromJson(e))
            .toList();
      },
    );
    return response.body;
  }

  /// [TEST] 동작 확인 필요
  Future<bool> invite({
    required int memberId,
    required int inviteMemberId,
  }) async {
    try {
      final response = await post(
        '/invite',
        {
          "memberInfo": {
            "memberId": memberId,
          },
          "request": {
            "inviteMemberId": inviteMemberId,
          }
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// [TEST] 동작 확인 필요
  Future<bool> inviteDeny({
    required int memberId,
    required int inviteMemberId,
  }) async {
    try {
      final response = await post(
        '/invite/deny',
        {
          "memberInfo": {
            "memberId": memberId,
          },
          "request": {
            "inviteMemberId": inviteMemberId,
          }
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// [TEST] 동작 확인 필요
  Future<bool> inviteAccept({
    required int memberId,
    required int inviteMemberId,
  }) async {
    try {
      final response = await post(
        '/invite/accept',
        {
          "memberInfo": {
            "memberId": memberId,
          },
          "request": {
            "inviteMemberId": inviteMemberId,
          }
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
