import 'package:flutter/material.dart';
import 'package:kitty_azumo/src/widgets/glass_morphism.dart';

class ButtonMeow extends StatelessWidget {
  const ButtonMeow({
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
          padding: EdgeInsets.only(left: 8, top: 4),
          child: Text(
            'Meeooww',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
