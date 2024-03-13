import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Image.asset(
        'assets/images/place_holders/place_holder.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
