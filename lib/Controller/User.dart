import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:poorlex/Controller/Api.dart';

import 'package:poorlex/Models/User.dart';

import 'package:poorlex/Libs/Time.dart';

class UserController extends GetxController {
  final userInfo = UserInfo().obs;
  final userToken = UserToken().obs;
  final expenditure = Expenditure().obs;
  final expenditures = <Expenditure>[].obs;

  ApiController api = Get.find<ApiController>();

  Future<bool> getUserInfo() async {
    var ui = await api.request(method: Methods.get, url: '/api/member/my-page');
    print(ui.body);
    if (ui.success) updateUser(UserInfo.fromJson(ui.body!));
    return ui.success;
  }

  Future<bool> signout() async {
    var result = await api.request(method: Methods.delete, url: 'api/memeber');
    return result.success;
  }

  Future<bool> getExpenditures() async {
    var e = await api.request(method: Methods.get, url: '/api/expenditures');
    if (e.success)
      updateExpenditures((e.body ?? [])
          .map<Expenditure>((b) => Expenditure.fromJson(b))
          .toList());
    return e.success;
  }

  Future<Expenditure> getExpenditure(int id) async {
    var e = await api.request(method: Methods.get, url: '/api/expenditures/${id}');
    if (e.success) {
      expenditure.value = Expenditure.fromJson(e.body);
      update();
      return expenditure.value;
    } else return Expenditure();
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

  Future<bool> uploadExpenditure({
    required String price,
    required String description,
    required int day,
    int? id,
    XFile? mainImage,
    XFile? subImage,
  }) async {
    Map<String, List<XFile>> files = {};
    print(mainImage);
    print(subImage);
    if (mainImage != null) files['mainImage'] = [mainImage];
    if (subImage != null) files['subImage'] = [subImage];
    var r = await api.requestMultipart(
        method: id == null ? Methods.post : Methods.put,
        url: id == null ? '/api/expenditures' : '/api/expenditures/${id}',
        body: {
          'amount': price,
          'description': description,
          'date': CTimeFormat(day, 'yyyy-MM-dd')
        },
        files: files);
    if (r.success) {
      await getUserInfo();
      await getExpenditures();
    }
    return r.success;
  }

  void updateExpenditures(List<Expenditure> list) {
    expenditures.value = list;
    update();
  }

  void updateUser(UserInfo? user) {
    if (user != null) {
      userInfo.update((val) {
        val?.nickname = user.nickname;
        val?.description = user.description;
        val?.levelInfo = user.levelInfo;
        val?.battleSuccessInfo = user.battleSuccessInfo;
        val?.friendTotalCount = user.friendTotalCount;
        val?.friends = user.friends;
        val?.expenditures = user.expenditures;
      });
    } else {
      userInfo.update((val) {
        val = UserInfo();
      });
    }
  }

  bool updateToken(UserToken? token) {
    if (token != null) {
      userToken.update((val) {
        val?.token = token.token;
        val?.refreshToken = token.refreshToken;
      });
      api.updateToken(token.token!);
      var auth = Hive.box('auth');
      auth.put('token', token.token);
      return true;
    } else {
      userToken.update((val) {
        val = UserToken();
      });
      api.updateToken('');
      return false;
    }
  }

  bool getNotification() {
    // print(this.userInfo.value.);
    // api.request(method: Methods.get, url: '/api/member/alarms?')
    return true;
  }
}
