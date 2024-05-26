import 'package:get/get.dart';
import 'package:poorlex/controller/friends.dart';
import 'package:poorlex/provider/friends_provider.dart';

class FriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendsProvider(user: Get.find()));
    Get.put(FriendsController(friendsProvider: Get.find(), layout: Get.find()));
  }
}
