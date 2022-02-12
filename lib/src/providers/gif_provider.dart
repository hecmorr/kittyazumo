import 'package:flutter/material.dart';

class GifProvider extends ChangeNotifier {
  GifProvider() {
    _gifUrl = getOnDisplayGif();
  }

  final String _baseUrl = 'cataas.com';
  final String _gif = '/cat/gif';

  String _gifUrl = '';

  //Method that will get the gifs from the API
  String getOnDisplayGif() {
    var url = Uri.https(_baseUrl, _gif);
    return url.toString();
  }

  String get gifUrl => _gifUrl;

  void draw(String url) {
    _gifUrl = url;
    notifyListeners();
  }
}
