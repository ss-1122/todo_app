import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/extensions/color_scheme_extensions.dart';
import 'package:todo_app/extensions/context_extensions.dart';
import 'package:todo_app/extensions/font_size_extensions.dart';
import 'package:todo_app/router/app_routes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // GoRouter のインスタンスを定義
  static final _router = GoRouter(
    routes: $appRoutes, // 自動生成されたルートリスト
    initialLocation: '/todo', // アプリ起動時のルート
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: context.colorScheme.defaultTextColor,
            fontSize: context.textTheme.fontSize12,
          ),
        ),
        fontFamily: 'NotoSansJp',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
