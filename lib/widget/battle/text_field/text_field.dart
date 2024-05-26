import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

class CTextFieldContainer extends StatelessWidget {
  final TextEditingController textController;
  final int maxLength;
  final FocusNode? focusNode;
  final void Function()? onTapField;
  const CTextFieldContainer({
    super.key,
    required this.textController,
    this.maxLength = 200,
    this.focusNode,
    this.onTapField,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode?.requestFocus();
        if (onTapField != null) {
          onTapField!();
        }
      },
      child: Container(
        width: double.maxFinite,
        child: Container(
          constraints: BoxConstraints(minHeight: 160),
          width: double.maxFinite,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CColors.gray10,
            borderRadius: BorderRadius.circular(2),
          ),

          /// [TODO]textField 구현하고 하단 length 표기하기
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                focusNode: focusNode,
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLength: maxLength,
                maxLines: null,
                style: CTextStyles.Body1(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4,
                      right: 8.0,
                      top: 26,
                    ),
                    child: Text(
                      "${textController.text.length}/${maxLength}"
                      '',
                      style: CTextStyles.Title3(
                        color: CColors.gray30Str,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
