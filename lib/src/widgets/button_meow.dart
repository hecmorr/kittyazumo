import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/providers/gif_provider.dart';
import 'package:kitty_azumo/src/widgets/glass_morphism.dart';
import 'package:provider/provider.dart';

class ButtonMeow extends StatelessWidget {
  const ButtonMeow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gifProvider = context.read<GifProvider>();

    return GestureDetector(
      onTap: () {
        //The # so the call to the API could be refreshed
        gifProvider.draw(gifProvider.gifUrl + '#');
      },
      child: const GlassMorphism(
        blur: 20,
        opacity: 0.3,
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 8, top: 4),
            child: Text(
              'Meeooww',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
