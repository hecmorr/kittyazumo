import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GifProvider extends ChangeNotifier {
  String? _baseUrl = 'cataas.com';
  String? _gif = '/cat/gif';

  String? onDisplayGif;

  GifProvider() {
    print('Gif provider initialized');
    draw();

    // getOnDisplayGif('');
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

  void draw() {
    notifyListeners();
    getOnDisplayGif();
  }
}
