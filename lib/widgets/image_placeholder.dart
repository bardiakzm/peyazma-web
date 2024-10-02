import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    super.key,
    required this.image,
    required this.placeholder,
  });
  final ImageProvider image;
  final Widget placeholder;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool? wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded == true) {
          return child;
        } else {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: frame != null ? child : placeholder,
          );
        }
      },
    );
  }
}
