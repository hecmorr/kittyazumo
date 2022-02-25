import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:kitty_azumo/src/widgets/button_meow.dart';
import 'package:kitty_azumo/src/widgets/loading_gif.dart';
import 'package:provider/provider.dart';

class GifLoader extends StatelessWidget {
  const GifLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final gifProvider = Provider.of<GifProvider>(context);

    return Column(
      //
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'Kitty Azumo',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (gifProvider.isLoading) loadingGif(screenSize: _screenSize),
        if (gifProvider.catGIf != null && !gifProvider.isLoading)
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            ),
            child: SizedBox(
              height: _screenSize.height * 0.55,
              width: _screenSize.width * 0.80,
              child: FadeInImage(
                image: FileImage(gifProvider.catGIf!),
                placeholder: const AssetImage(
                  "assets/loader.gif",
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/no-image.png',
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
        const Align(
          child: ButtonMeow(),
        ),
      ],
    );
  }
}
