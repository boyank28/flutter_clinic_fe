// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

class Base64Formatter {
  static String convertImage(String? imagePath) {
    final extension = path.extension(imagePath!.substring(imagePath.lastIndexOf('/')).replaceAll('/', ''));
    final bytes = File(imagePath).readAsBytesSync();
    String base64 = "data:image/${extension.replaceAll('.', '')};base64,${base64Encode(bytes)}";
    return base64;
  }
}
