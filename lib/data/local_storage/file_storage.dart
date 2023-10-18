// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:path_provider/path_provider.dart';

final class FileStorage {
  const FileStorage._();
  static const FileStorage instance = FileStorage._();

  Future<File> get _localFile async {
    final Directory directory = await getTemporaryDirectory();
    final String path = directory.path;
    return File('$path/first_launch.txt');
  }

  Future<bool?> readLaunch() async {
    try {
      final File file = await _localFile;
      final String content = await file.readAsString();
      return content.isNotEmpty ? false : null;
    } catch (e) {
      return null;
    }
  }

  Future<File> writeLaunch(bool launch) async {
    final File file = await _localFile;
    return file.writeAsString('$launch');
  }
}
