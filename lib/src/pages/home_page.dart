import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:kitty_azumo/src/widgets/gif_loader.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);

    print(gifProvider.onDisplayGif);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Kitty gifs'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GifLoader(
            gif: gifProvider.onDisplayGif,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Button pressed'),
        child: Text('Meow'),
      ),
    );
  }
}
