import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:kitty_azumo/src/widgets/background_painter.dart';
import 'package:kitty_azumo/src/widgets/gif_loader.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);

    final GlobalKey key = GlobalKey();

    print(gifProvider.getOnDisplayGif());

    return Scaffold(
      body: CustomPaint(
        key: key,
        painter: BackgroundPainter(),
        child: GifLoader(),
      ),
    );
  }
}
