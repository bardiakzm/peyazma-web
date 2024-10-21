import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    super.key,
    required this.image,
    required this.placeholder,
    this.fit = BoxFit.cover, // Added fit with default value
  });

  final ImageProvider image;
  final Widget placeholder;
  final BoxFit fit; // Declared fit property

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      fit: fit, // Applied fit to Image widget
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

class ImageWidgetPlaceholderWithFrame extends StatelessWidget {
  const ImageWidgetPlaceholderWithFrame({
    super.key,
    required this.image,
    required this.placeholder,
    this.fit = BoxFit.cover, // Ensuring the image fills the frame
  });

  final ImageProvider image;
  final Widget placeholder;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: Colors.grey.shade200, // Placeholder background color
        child: Image(
          image: image,
          fit: fit, // This ensures the image fills the frame
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
        ),
      ),
    );
  }
}

class ImageWidgetPlaceholderWithImageProvider extends StatelessWidget {
  const ImageWidgetPlaceholderWithImageProvider({
    super.key,
    required this.image,
    required this.placeholder,
    this.fit = BoxFit.cover,
  });

  final ImageProvider image;
  final Widget placeholder;
  final BoxFit fit;

  // Add this method to get the image provider
  ImageProvider get imageProvider => image;

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
