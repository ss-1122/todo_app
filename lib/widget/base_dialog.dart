import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/extensions/context_extensions.dart';
import 'package:todo_app/extensions/font_size_extensions.dart';

/// ベースダイアログウィジェット。
class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.content,
    required this.actions,
    this.title,
  });

  final String? title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: context.textTheme.fontSize18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(8),
            content,
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: actions,
            ),
          ],
        ),
      ),
    );
  }
}
