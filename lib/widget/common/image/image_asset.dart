import 'package:flutter/widgets.dart';

/// name(assets file)이 존재하지 않다면 에러 이미지를 보여줍니다.
class CImageAsset extends StatelessWidget {
  final String? name;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CImageAsset({
    super.key,
    this.name,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name ?? '',
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        /// [TODO]: error 이미지 정의되면 바꿔줍니다.
        return Image.asset(
          "assets/img_main_login.png",
          width: width,
          height: height,
        );
      },
    );
  }
}
