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
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.png'),
              image: NetworkImage('${gifProvider.getOnDisplayGif()}'),
            ),
          ),
        ),
      ],
    );
  }
}
