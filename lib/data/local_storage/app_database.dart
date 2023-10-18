import 'package:news/data/local_storage/file_storage.dart';

final class AppDatabase {
  const AppDatabase._();

  static const AppDatabase instance = AppDatabase._();
  static const FileStorage fileStorage = FileStorage.instance;

  Future<bool> isFirstLaunch() async {
    final bool? isFirst = await fileStorage.readLaunch();
    if (isFirst != null) {
      return false;
    } else {
      await fileStorage.writeLaunch(false);
      return true;
    }
  }
}