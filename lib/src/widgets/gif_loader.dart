import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:provider/provider.dart';

class GifLoader extends StatelessWidget {
  const GifLoader({Key? key, required this.gif}) : super(key: key);

  final gif;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final gifProvider = Provider.of<GifProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Container(
              color: Colors.red,
              height: _screenSize.height * 0.55,
              width: _screenSize.width * 0.70,
            ),
          ),
        ),
      ],
    );
  }
}
