# コードの自動生成
run_build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

# キャッシュの削除
clean_runner:
	flutter pub run build_runner clean
	