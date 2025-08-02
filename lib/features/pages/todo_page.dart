import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/extensions/context_extensions.dart';
import 'package:todo_app/extensions/font_size_extensions.dart';
import 'package:todo_app/features/model/todo.dart';
import 'package:todo_app/extensions/color_scheme_extensions.dart';
import 'package:todo_app/features/use_case/todo_list_state_notifier.dart';
import 'package:todo_app/features/widget/base_dialog.dart';

/// Todoページ。
class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListStateNotifierProvider);
    final todos = state.todos;
    final isExistTodo = todos.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        centerTitle: true,
        backgroundColor: context.colorScheme.surface,
        elevation: 2,
        shadowColor: context.colorScheme.outline,
        // 削除ボタン
        leading: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: _TodoRemoveButton(isExsistTodo: isExistTodo),
        ),
        // 追加ボタン
        actions: [_TodoAddButton()],
        actionsPadding: const EdgeInsets.only(right: 30),
        automaticallyImplyLeading: false,
      ),
      body: isExistTodo
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _TodoPageBody(todos: todos),
            )
          : _EmptyBody(),
    );
  }
}

/// Todoページのボディクラス。
class _TodoPageBody extends ConsumerWidget {
  const _TodoPageBody({required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final todo = todos[index];
            return Column(
              children: [
                if (index == 0) const Gap(10),
                _Todo(todo: todo, index: index),
                if (index != todos.length - 1) const Gap(20),
              ],
            );
          }, childCount: todos.length),
        ),
      ],
    );
  }
}

/// Todoが１件もない時のボディクラス。
class _EmptyBody extends StatelessWidget {
  const _EmptyBody();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.emptyBackgroundColor,
      child: Center(
        child: Text(
          'Todoがありません',
          style: TextStyle(fontSize: context.textTheme.fontSize18),
        ),
      ),
    );
  }
}

/// Todoウィジェット
class _Todo extends ConsumerWidget {
  const _Todo({required this.todo, required this.index});

  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            todo.onCheck ? Icons.check_box : Icons.check_box_outline_blank,
            color: context.colorScheme.iconColor,
          ),
          onPressed: () {
            ref.read(todoListStateNotifierProvider.notifier).toggle(index);
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              todo.contents,
              style: TextStyle(fontSize: context.textTheme.fontSize16),
              maxLines: 1, // 1行だけ表示
              overflow: TextOverflow.ellipsis, // はみ出たら「...」で省略
            ),
          ),
        ),
      ],
    );
  }
}

/// 追加ボタン
class _TodoAddButton extends ConsumerWidget {
  const _TodoAddButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(Icons.add, color: context.colorScheme.iconColor),
      onPressed: () async {
        // ユーザの入力を待ってTodoの内容を受け取る
        final contents = await showDialog<String?>(
          context: context,
          builder: (context) => _TodoEnterDialog(),
        );
        // ユーザがキャンセルボタンかダイアログ外をタップしてダイアログを閉じた時、
        // contentsはnullなので、非nullのときのみ更新する
        if (contents != null) {
          ref.read(todoListStateNotifierProvider.notifier).add(contents);
        }
      },
    );
  }
}

/// 削除ボタン
///
/// TODO: 将来的に、「選択して削除」機能を追加したい
class _TodoRemoveButton extends ConsumerWidget {
  const _TodoRemoveButton({required this.isExsistTodo});

  final bool isExsistTodo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(Icons.delete, color: context.colorScheme.iconColor),
      onPressed: () async {
        if (isExsistTodo) {
          await showDialog(
            context: context,
            builder: (context) => _TodoRemoveDialog(),
          );
        }
      },
    );
  }
}

/// Todo入力ダイアログ
class _TodoEnterDialog extends StatefulWidget {
  const _TodoEnterDialog();

  @override
  State<_TodoEnterDialog> createState() => _TodoEnterDialogState();
}

class _TodoEnterDialogState extends State<_TodoEnterDialog> {
  late final TextEditingController _controller;
  bool _hasEnterError = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '新規追加',
      content: Column(
        children: [
          TextField(
            controller: _controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Todoを入力してね',
              hintStyle: TextStyle(fontSize: context.textTheme.fontSize14),
            ),
          ),
          if (_hasEnterError) _EnterErrorText(),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'キャンセル',
            style: TextStyle(
              fontSize: context.textTheme.fontSize16,
              color: context.colorScheme.primary,
            ),
          ),
          onPressed: () => context.pop(),
        ),
        TextButton(
          child: Text(
            '追加',
            style: TextStyle(
              fontSize: context.textTheme.fontSize16,
              color: context.colorScheme.primary,
            ),
          ),
          onPressed: () {
            final text = _controller.text.trim();
            text.isEmpty
                ? setState(() => _hasEnterError = true)
                : context.pop(text);
          },
        ),
      ],
    );
  }
}

/// Todo削除ダイアログ
class _TodoRemoveDialog extends ConsumerWidget {
  const _TodoRemoveDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseDialog(
      content: Text(
        'Todoリストを一括削除します。\nよろしいですか？',
        style: TextStyle(
          fontSize: context.textTheme.fontSize18,
          color: context.colorScheme.warningTextColor,
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            'やめておく',
            style: TextStyle(fontSize: context.textTheme.fontSize16),
          ),
          onPressed: () => context.pop(),
        ),
        TextButton(
          child: Text(
            '削除する',
            style: TextStyle(fontSize: context.textTheme.fontSize16),
          ),
          onPressed: () {
            ref.read(todoListStateNotifierProvider.notifier).clear();
            context.pop();
          },
        ),
      ],
    );
  }
}

/// 入力エラーテキストウィジェット。
class _EnterErrorText extends StatelessWidget {
  const _EnterErrorText();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '※未入力のTodoは追加できません！',
          style: TextStyle(
            fontSize: context.textTheme.fontSize14,
            color: context.colorScheme.warningTextColor,
          ),
        ),
      ),
    );
  }
}
