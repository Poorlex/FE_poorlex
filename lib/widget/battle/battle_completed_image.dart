import 'package:flutter/widgets.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';

class BattleCompletedImage extends StatelessWidget {
  final int rank;
  const BattleCompletedImage({
    super.key,
    required this.rank,
  });

  static String _first_rank = "assets/battle_page/completed/first_rank.png";
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
    switch (rank) {
      case 1:
        return _first_rank;
      case >= 2:
        return _clear_rank;
      default:
        return _loose_rank;
    }
  }
}
