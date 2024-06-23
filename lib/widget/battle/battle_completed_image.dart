import 'package:flutter/widgets.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';

class BattleCompletedImage extends StatelessWidget {
  final int rank;
  final bool isFailure;
  const BattleCompletedImage({
    super.key,
    required this.rank,
    required this.isFailure,
  });

  static String _first_rank = "assets/battle_page/completed/first_rank.png";
  static String _second_rank = "assets/battle_page/completed/second_rank.png";
  static String _third_rank = "assets/battle_page/completed/third_rank.png";
  static String _clear_rank = "assets/battle_page/completed/clear.png";
  static String _loose_rank = "assets/battle_page/completed/loose.png";
  @override
  Widget build(BuildContext context) {
    return CImageAsset(
      name: _selectedImageAsset(),
      width: 90,
      height: 90,
    );
  }

  String _selectedImageAsset() {
    if (isFailure) {
      return _loose_rank;
    }
    switch (rank) {
      case 1:
        return _first_rank;
      case 2:
        return _second_rank;
      case 3:
        return _third_rank;
      case >= 4:
        return _clear_rank;
      default:
        return _loose_rank;
    }
  }
}
