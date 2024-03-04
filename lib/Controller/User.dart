import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/Controller/Api.dart';

import 'package:poorlex/Models/User.dart';

import 'package:poorlex/Libs/Time.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;
  final userToken = UserToken().obs;
  final expenditures = <Expenditure>[].obs;

  ApiController api = Get.find<ApiController>();

  Future<bool> getUserInfo() async {
    var ui = await api.request(method: Methods.get, url: '/api/member/my-page');
    if (ui.success) updateUser(UserInfo.fromJson(ui.body!));
    return ui.success;
  }

  Future<bool> getExpenditures() async {
    var e = await api.request(method: Methods.get, url: '/api/expenditures');
    if (e.success)
      updateExpenditures((e.body ?? [])
          .map<Expenditure>((b) => Expenditure.fromJson(b))
          .toList());
    return e.success;
  }

  Future<bool> patchProfile(
      {required String nicknme, required String description}) async {
    var r = await api.request(
        method: Methods.patch,
        url: '/api/member/profile',
        body: {'nickname': nicknme, 'description': description});
    if (r.success) await getUserInfo();
    return r.success;
  }

  Future<bool> uploadExpenditure ({
    required String price,
    required String description,
    required int day,
    Map<String, List<XFile>>? images,
  }) async {
    var r = await api.requestMultipart(
      method: Methods.post,
      url: '/api/expenditures',
      body: {
        'expenditureCreateRequest[amount]': price,
        'expenditureCreateRequest[description]': description,
        'expenditureCreateRequest[datetime]': CTimeFormat(day, 'yyyy-mm-dd 00:00:00'),
      },
      files: images
    );
    if (r.success) {
      await getUserInfo();
      await getExpenditures();
    }
    return r.success;
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
      var auth = Hive.box('auth');
      auth.put('token', token.token);
      return true;
    }
    return false;
  }
}
