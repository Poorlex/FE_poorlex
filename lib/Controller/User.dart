import 'package:get/get.dart';
import 'package:poorlex/Controller/Api.dart';

import 'package:poorlex/Models/User.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;
  final userToken = UserToken().obs;
  final expenditures = <Expenditure>[].obs;

  ApiController api = Get.find<ApiController>();

  void getUserInfo() async {
    var ui = await api.request(method: Methods.get, url: '/api/member/my-page');
    if (ui.success) {
      updateUser(UserInfo.fromJson(ui.body!));
    }
  }

  void getExpenditures() async {
    var e = await api.request(method: Methods.get, url: '/api/expenditures');
    if (e.success) {
      updateExpenditures((e.body ?? []).map<Expenditure>((b) => Expenditure.fromJson(b)).toList());
    }
  }

  void updateExpenditures(List<Expenditure> list) {
    int index = 0;
    list.forEach((li) {
      expenditures.value[index] = li;
      index++;
    });
    update();
  }

  void updateUser(UserInfo user) {
    userInfo.update((val) {
      val?.nickname = user.nickname;
      val?.description = user.description;
      val?.levelInfo = user.levelInfo;
      val?.battleSuccessInfo = user.battleSuccessInfo;
      val?.friendTotalCount = user.friendTotalCount;
      val?.friends = user.friends;
      val?.expenditures = user.expenditures;
    });
  }

  bool updateToken(UserToken token) {
    if (token.token != null) {
      userToken.update((val) {
        val?.token = token.token;
        val?.refreshToken = token.refreshToken;
      });
      api.updateToken(token.token!);
      return true;
    } return false;
  }
}
