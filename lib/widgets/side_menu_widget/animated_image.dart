import 'package:flutter/material.dart';

import '../../constant/app_assets.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(begin: Offset.zero, end: const Offset(0, 0.08)).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetImages.imgCloud),
        SlideTransition(
          position: _animation,
          child: Image.asset(AssetImages.imgRocketPerson),
        ),
      ],
    );
  }
}
