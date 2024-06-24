import 'package:get/get.dart';
import 'package:poorlex/provider/point_provider.dart';
import 'package:poorlex/schema/point_level_bar_response/point_level_bar_response.dart';
import 'package:poorlex/schema/point_response/point_response.dart';

class PointController extends GetxController {
  final PointProvider pointProvider;

  PointController({
    required this.pointProvider,
  });

  final Rx<PointResponse> point = PointResponse(
    totalPoint: 0,
    level: 0,
  ).obs;

  final Rx<PointLevelBarResponse> pointLevelBar = PointLevelBarResponse(
    levelRange: 0,
    currentPoint: 0,
    recentPoint: 0,
  ).obs;

  // 회원 포인트, 레벨 조회
  Future<void> getPoint() async {
    try {
      final response = await pointProvider.getPoint();
      point(response);
    } catch (e) {
      print(e);
    }
  }

  // 회원 레벨바 관련 포인트 조회
  Future<void> getPointLevelBar() async {
    try {
      final response = await pointProvider.getPointLevelBar();
      pointLevelBar(response);
    } catch (e) {
      print(e);
    }
  }
}
