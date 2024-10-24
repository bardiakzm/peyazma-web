import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    super.key,
    required this.image,
    required this.placeholder,
    this.fit = BoxFit.cover,
    this.errorBuilder,
  });

  final ImageProvider image;
  final Widget placeholder;
  final BoxFit fit;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      fit: fit,
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
      errorBuilder: errorBuilder ??
          (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.error_outline, color: Colors.red),
              ),
            );
          },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder;
      },
    );
  }
}

class ImageWidgetPlaceholderWithFrame extends StatelessWidget {
  const ImageWidgetPlaceholderWithFrame({
    super.key,
    required this.image,
    required this.placeholder,
    this.fit = BoxFit.cover,
    this.borderRadius = 8.0,
    this.errorBuilder,
  });

  final ImageProvider image;
  final Widget placeholder;
  final BoxFit fit;
  final double borderRadius;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: Colors.grey.shade200,
        child: Image(
          image: image,
          fit: fit,
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
          errorBuilder: errorBuilder ??
              (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.error_outline, color: Colors.red),
                  ),
                );
              },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return placeholder;
          },
        ),
      ),
    );
  }
}

class ImageWidgetPlaceholderWithImageProvider extends StatefulWidget {
  const ImageWidgetPlaceholderWithImageProvider({
    super.key,
    required this.image,
    required this.placeholder,
    this.errorBuilder,
  });

  final ImageProvider image;
  final Widget placeholder;
  final ImageErrorWidgetBuilder? errorBuilder;

  ImageProvider get imageProvider => image;

  @override
  State<ImageWidgetPlaceholderWithImageProvider> createState() =>
      _ImageWidgetPlaceholderWithImageProviderState();
}

class _ImageWidgetPlaceholderWithImageProviderState
    extends State<ImageWidgetPlaceholderWithImageProvider> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;
  bool _isLoaded = false;
  dynamic _error;
  bool _mounted = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getImage();
  }

  @override
  void didUpdateWidget(ImageWidgetPlaceholderWithImageProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image != oldWidget.image) {
      _getImage();
    }
  }

  void _getImage() {
    final ImageStream? oldImageStream = _imageStream;
    _imageStream = widget.image.resolve(createLocalImageConfiguration(context));

    if (_imageStream?.key != oldImageStream?.key) {
      // Remove old listener
      final listener = ImageStreamListener(
        _updateImage,
        onError: _handleError,
      );
      oldImageStream?.removeListener(listener);

      // Add new listener
      _imageStream?.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    if (!_mounted) return;
    setState(() {
      _imageInfo = imageInfo;
      _isLoaded = true;
      _error = null;
    });
  }

  void _handleError(dynamic error, StackTrace? stackTrace) {
    if (!_mounted) return;
    setState(() {
      _error = error;
      _isLoaded = false;
    });
  }

  @override
  void dispose() {
    _mounted = false;
    final listener = ImageStreamListener(
      _updateImage,
      onError: _handleError,
    );
    _imageStream?.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return widget.errorBuilder?.call(context, _error, null) ??
          Container(
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.error_outline, color: Colors.red),
            ),
          );
    }

    return Image(
      image: widget.image,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool? wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded == true || _isLoaded) {
          return child;
        } else {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: frame != null ? child : widget.placeholder,
          );
        }
      },
      errorBuilder: widget.errorBuilder,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null && _isLoaded) return child;
        return widget.placeholder;
      },
    );
  }
}
