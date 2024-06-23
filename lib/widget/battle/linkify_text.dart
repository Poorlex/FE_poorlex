import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkifyText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const LinkifyText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableLinkify(
      onOpen: (link) async {
        if (!await launchUrl(Uri.parse(link.url))) {
          throw 'Could not launch ${link.url}';
        }
      },
      text: utf8.decode(utf8.encode(text)),
      style: style,
      linkStyle: TextStyle(color: CColors.brown),
      options: LinkifyOptions(humanize: false),
      contextMenuBuilder: (context, editableTextState) {
        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: editableTextState.contextMenuAnchors,
          buttonItems: <ContextMenuButtonItem>[
            ContextMenuButtonItem(
              onPressed: () {
                editableTextState.copySelection(SelectionChangedCause.toolbar);
              },
              type: ContextMenuButtonType.copy,
            ),
            ContextMenuButtonItem(
              onPressed: () {
                editableTextState.selectAll(SelectionChangedCause.toolbar);
              },
              type: ContextMenuButtonType.selectAll,
            ),
          ],
        );
      },
    );
  }
}
