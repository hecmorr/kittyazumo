import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GifProvider extends ChangeNotifier {
  String? _baseUrl = 'cataas.com';
  String? _gif = '/cat/gif';

  GifProvider() {
    print('Gif provider initialized');

    getOnDisplayGif();
  }

  //Method that will get the gifs from the API
  getOnDisplayGif() async {
    var url = Uri.https(_baseUrl!, _gif!);
    final response = await http.get(url);
    // final decodedData = json.decode(response.body);
    print(response.body);
  }
}
