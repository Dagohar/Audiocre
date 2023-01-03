import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileOperations {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/sequence.txt');
  }

  static Future<File> writeSequence(String sequence) async {
    final file = await _localFile;

    return file.writeAsString(sequence);
  }

  static Future<String> readSequence() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();

      return contents;
    }
    catch(e) {
      return '';
    }
  }

  static Future deleteSequence() async {
    try {
      final file = await _localFile;

      if(await file.exists()) {
        file.delete();
      }
    }
    catch(e) {
      print('Failed to get any sequence!');
    }
  }
}