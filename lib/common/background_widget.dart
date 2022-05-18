import 'package:flutter/material.dart';

import '../constant/constant_public.dart';
import '../constant/decoration_constant.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(backgroundBorderRadius),
      ),
      elevation: 4,
      color: Colors.transparent,
      child: Container(
        decoration: kBackgroundWidgetGradientDecoration,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: kBackgroundWidgetInnerDecoration,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
