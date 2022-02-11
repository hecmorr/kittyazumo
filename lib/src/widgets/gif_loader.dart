import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:provider/provider.dart';

class GifLoader extends StatelessWidget {
  const GifLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final gifProvider = Provider.of<GifProvider>(context);

    // gifProvider.draw();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Kitty Azumo',
          style: TextStyle(
              fontSize: 40, color: Colors.white38, fontWeight: FontWeight.bold),
        ),
        const Divider(height: 20),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: SizedBox(
                height: _screenSize.height * 0.55,
                width: _screenSize.width * 0.80,
                child: FadeInImage(
                  image: NetworkImage(gifProvider.gif_url),
                  placeholder: const AssetImage(
                    "assets/loader.gif",
                  ),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/no-image.png',
                        fit: BoxFit.cover);
                  },
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Divider(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              //The # so the call to the API could be refreshed
              gifProvider.draw(gifProvider.gif_url + '#');
              print('Value changed!');
            },
            child: Text('Meeeeowww'))
      ],
    );
  }
}
