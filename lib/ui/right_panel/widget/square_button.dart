import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TexturedContainerButton extends StatefulWidget {
  final Widget? buttonContent;
  final bool isBorder;

  TexturedContainerButton({
    this.buttonContent,
    this.isBorder = true,
  });

  @override
  _TexturedContainerButtonState createState() => _TexturedContainerButtonState();
}

class _TexturedContainerButtonState extends State<TexturedContainerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.0,
      width: 58.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        border: widget.isBorder ? Border.all(color: Colors.grey.shade300, width: 2.0) : null,
      ),
      child: Center(
        child: widget.buttonContent,
      ),
    );
  }
}
