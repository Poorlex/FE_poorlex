import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';

class ModifyBattleController extends GetxController {
  final BattlesProvider battlesProvider;
  final LayoutController layout;
  final ImagePickerController imagePickerController;
  ModifyBattleController({
    required this.battlesProvider,
    required this.layout,
    required this.imagePickerController,
  });

  final Rxn<BattleResponse> _battleInfo = Rxn<BattleResponse>();
  BattleResponse? get battleInfo => _battleInfo.value;

  /// 수정할 배틀 이미지 사진
  final Rxn<XFile> modifyImage = Rxn<XFile>();

  Future<void> getDetailById({
    required int battleId,
    required void Function(String title) updateTitle,
    required void Function(String introduction) updateIntroduction,
  }) async {
    layout.setIsLoading(true);
    try {
      final response = await battlesProvider.getDetailById(battleId: battleId);
      if (response != null) {
        print(response);
        _battleInfo(response);
        updateTitle(response.battleName);
        updateIntroduction(response.battleIntroduction);
      }
    } catch (e) {
      print(e);
    }
    layout.setIsLoading(false);
  }

  Future<void> getImage() async {
    final XFile? image = await imagePickerController.getImage();
    if (image != null) {
      modifyImage(image);
    }
  }

  /// [MEMO] 검토 필요한 API
  Future<void> modifyBattle({
    required int battleId,
    required String content,
  }) async {
    await battlesProvider.patchBattleNotification(
      battleId: battleId,
      content: content,
      imageUrl: _battleInfo.value!.battleImageUrl,
    );
  }

  Future<void> patchBattle({
    String? name,
    String? introduction,
  }) async {
    if (_battleInfo.value != null) {
      await battlesProvider.patchBattle(
        battleId: _battleInfo.value!.id,
        name: name,
        introduction: introduction,
        image: modifyImage.value,
      );
    }
  }
}
