import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/data/local/database.dart';

part 'database_provider.g.dart';

@riverpod
Database database(Ref ref) {
  final db = Database();

  ref.onDispose(() async {
    await db.close();
  });
  return db;
}
