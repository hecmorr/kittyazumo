import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:kitty_azumo/src/widgets/gif_loader.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);

    print(gifProvider.getOnDisplayGif());

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
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          onPressed: () => gifProvider.draw(),
          child: Text('Meow'),
        ),
      ),
    );
  }
}
