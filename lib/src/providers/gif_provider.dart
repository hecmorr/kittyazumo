import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:kitty_azumo/network/api.dart';
import 'package:path/path.dart';

class GifProvider extends ChangeNotifier {
  ///
  GifProvider(this._api);
  final Api _api;

  File? catGIf;
  bool isLoading = false;

  Future<void> fetchGif() async {
    isLoading = true;
    notifyListeners();
    final response = await _api.getGif();

    final Directory appDir = await getApplicationDocumentsDirectory();

    /// Generate Image Name
    const String imageName = 'catgif';

    /// Create Empty File in app dir & fill with new image
    final File file = File(join(appDir.path, imageName));

    file.writeAsBytesSync(response);

    catGIf = file;
    isLoading = false;
    notifyListeners();
  }
}
