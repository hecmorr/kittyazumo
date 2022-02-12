import 'package:flutter/material.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Kitty Azumo',
          style: TextStyle(
              fontSize: 40, color: Colors.white70, fontWeight: FontWeight.bold),
        ),
        const Divider(height: 20),
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: SizedBox(
                height: _screenSize.height * 0.55,
                width: _screenSize.width * 0.80,
                child: FadeInImage(
                  image: NetworkImage(gifProvider.gif_url),
                  placeholder: const AssetImage(
                    "assets/cool.gif",
                  ),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/no-image.png',
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                )),
          ),
        ),
        const Divider(
          height: 20,
        ),
        Center(
            child: GestureDetector(
          onTap: () {
            //The # so the call to the API could be refreshed
            gifProvider.draw(gifProvider.gif_url + '#');
            print('Value changed!');
            _isBlur = !_isBlur;
          },
          child: GlassMorphism(
            blur: _isBlur ? 20 : 0,
            opacity: 0.4,
            child: const SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  'Meeooww',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              height: 50,
              width: 130,
            ),
          ),
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
