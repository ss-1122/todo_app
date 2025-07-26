import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/features/todo_page.dart';

part 'app_routes.g.dart';

// このクラスをルートとして使うことを示すアノテーション
@TypedGoRoute<HomeRoute>(
  path: '/todo', // この画面のURLパス
  routes: [], // このルートの下にネストした子ルートをおけるが、今回は空
)
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TodoPage();
  }
}
