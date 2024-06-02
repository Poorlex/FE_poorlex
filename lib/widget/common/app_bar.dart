import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/Icon.dart';

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> children;
  const CAppBar({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 26,
            style: IconButton.styleFrom(
                padding: EdgeInsets.zero, minimumSize: Size.zero),
            icon: CIcon(
              icon: 'arrow-left',
              width: 26,
              height: 26,
              color: CColors.whiteStr,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ...children,
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
