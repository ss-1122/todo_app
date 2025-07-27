import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/theme/custom_color_scheme.dart';

/// Todoページ。
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        backgroundColor: colorScheme.surface,
        elevation: 2,
        shadowColor: colorScheme.outline,
        leading: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: Icon(Icons.delete, color: colorScheme.iconColor),
        ),
        actions: [Icon(Icons.add, color: colorScheme.iconColor)],
        actionsPadding: const EdgeInsets.only(right: 30),
        automaticallyImplyLeading: false,
      ),
      body: _TodoPageBody(),
    );
  }
}

/// Todoページのボディクラス。
class _TodoPageBody extends StatelessWidget {
  const _TodoPageBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 2, 12, 2),
                child: Icon(Icons.check_box, color: colorScheme.iconColor),
              ),
              const Text('Todoの内容です', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
