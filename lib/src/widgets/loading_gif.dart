import 'package:flutter/material.dart';

class loadingGif extends StatelessWidget {
  const loadingGif({
    Key? key,
    required Size screenSize,
  })  : _screenSize = screenSize,
        super(key: key);

  final Size _screenSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
      child: SizedBox(
        height: _screenSize.height * 0.55,
        width: _screenSize.width * 0.80,
        child: Image.asset(
          "assets/loader.gif",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
