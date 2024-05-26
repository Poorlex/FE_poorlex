import 'package:flutter/widgets.dart';

/// src이 존재하지 않다면 에러 이미지를 보여줍니다.
class CImageNetwork extends StatelessWidget {
  final String? src;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? errorAssetName;
  const CImageNetwork({
    super.key,
    this.src,
    this.width,
    this.height,
    this.fit,
    this.errorAssetName,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src ?? '',
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        /// [TODO]: error 이미지 정의되면 바꿔줍니다.
        return Image.asset(
          errorAssetName ?? "assets/img_main_login.png",
          width: width,
          height: height,
        );
      },
    );
  }
}
