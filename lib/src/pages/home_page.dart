import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/widgets/gif_loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kitty gifs'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GifLoader(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Button pressed'),
        child: Text('Meow'),
      ),
    );
  }
}
