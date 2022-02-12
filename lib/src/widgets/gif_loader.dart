import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:kitty_azumo/src/widgets/glass_morphism.dart';
import 'package:provider/provider.dart';

class GifLoader extends StatelessWidget {
  const GifLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final gifProvider = Provider.of<GifProvider>(context);
    bool _isBlur = false;

    return Column(
      //
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'Kitty Azumo',
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          child: Container(
              height: _screenSize.height * 0.55,
              width: _screenSize.width * 0.80,
              child: FadeInImage(
                image: NetworkImage(gifProvider.gif_url),
                placeholder: const AssetImage(
                  "assets/loader.gif",
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/no-image.png', fit: BoxFit.cover);
                },
                fit: BoxFit.cover,
              )),
        ),
        Center(
            child: GestureDetector(
          onTap: () {
            //The # so the call to the API could be refreshed
            gifProvider.draw(gifProvider.gif_url + '#');
            print('Value changed!');
            _isBlur = !_isBlur;
          },
          child: button_meow(isBlur: _isBlur),
          // ElevatedButton(
          //     onPressed: () {
          //       //The # so the call to the API could be refreshed
          //       gifProvider.draw(gifProvider.gif_url + '#');
          //       print('Value changed!');
          //     },
          //     child: const Text('Meeeeowww'))
        ))
      ],
    );
  }
}

class button_meow extends StatelessWidget {
  const button_meow({
    Key? key,
    required bool isBlur,
  })  : _isBlur = isBlur,
        super(key: key);

  final bool _isBlur;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      blur: _isBlur ? 20 : 0,
      opacity: 0.3,
      child: const SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Text(
            'Meeooww',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        height: 50,
        width: 200,
      ),
    );
  }
}
