import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/widgets/background_painter.dart';
import 'package:kitty_azumo/src/widgets/gif_loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();

    return Scaffold(
      body: CustomPaint(
        key: key,
        painter: BackgroundPainter(),
        child: const GifLoader(),
      ),
    );
  }
}
