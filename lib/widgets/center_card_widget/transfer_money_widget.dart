import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/background_widget.dart';
import '../../constant/app_assets.dart';
import '../../constant/const_value.dart';
import '../../constant/decoration_constant.dart';
import '../../constant/font_style.dart';

class TransferMoney extends StatelessWidget {
  const TransferMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Stack(
        children: [
          _showRightUserImage(),
          _widgetBlurView(),
          _widgetTransferMoneyTextColumn(),
        ],
      ),
    );
  }

  Widget _widgetTransferMoneyTextColumn() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            kTransfermoneytoYourBank,
            style: textWhite500_24,
          ),
          const SizedBox(
            height: 18,
          ),
          Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(AssetImages.icCard),
              Positioned(
                left: 20,
                child: SvgPicture.asset(AssetImages.icVisa),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showRightUserImage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 40.0,
          top: 10.0
        ),
        child: Image.asset(
          AssetImages.imgUser,
          fit: BoxFit.cover,
          height: 190,
        ),
      ),
    );
  }

  Widget _widgetBlurView() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(backgroundBorderRadius),
            bottomRight: Radius.circular(backgroundBorderRadius),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Container(
              height: 62,
            ),
          ),
        ),
      ),
    );
  }
}
