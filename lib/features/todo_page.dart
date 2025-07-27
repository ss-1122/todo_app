import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: _TodoPageBody(),
      ),
    );
  }
}

/// Todoページのボディクラス。
class _TodoPageBody extends StatelessWidget {
  const _TodoPageBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 2, 12, 2),
          child: Icon(Icons.check_box, color: colorScheme.iconColor),
        ),
        // TODO: 文字数制限を設けるか折り返しできるようにする
        const Text('Todoの内容です', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
