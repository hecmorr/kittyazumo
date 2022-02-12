import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GifProvider extends ChangeNotifier {
  String? _baseUrl = 'cataas.com';
  String? _gif = '/cat/gif';

  String _gif_url = '';

  GifProvider() {
    _gif_url = getOnDisplayGif();
    print('Gif Provider initialized');
  }

  //Method that will get the gifs from the API
  String getOnDisplayGif() {
    var url = Uri.https(_baseUrl!, _gif!);

    if (url == null) {
      return 'https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-illustration-132483587.jpg';
    } else {
      return url.toString();
    }
  }

  get gif_url => _gif_url;

  void draw(String url) {
    _gif_url = url;
    notifyListeners();
  }
}
