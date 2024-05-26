import 'package:get/get.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/provider/friends_provider.dart';
import 'package:poorlex/schema/friend_response/friend_response.dart';

class FriendsController extends GetxController {
  final FriendsProvider friendsProvider;
  final LayoutController layout;
  FriendsController({
    required this.friendsProvider,
    required this.layout,
  });

  final RxList<List<FriendResponse>> friends = <List<FriendResponse>>[].obs;

  Future<void> getFriends({
    required int memberId,
  }) async {
    final response = await friendsProvider.getFriends(memberId: memberId);
    if (response != null) {
      friends.assignAll([response]);
    }
  }
}
