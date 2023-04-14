import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({Key? key, required this.text, required this.image, this.onPressed}) : super(key: key);
  final String text;
  final AssetImage image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 31,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.contain),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
