import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/router/app_routes.dart';

void main() {
  runApp(const MyApp());
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
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}
