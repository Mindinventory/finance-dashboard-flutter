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

          /// This widget is for showing blur view.
          _widgetBlurView(),

          /// This widget shows a transfer money portion.
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                kTransfermoneytoYourBank,
                style: textWhite500_24,
              ),
              const SizedBox(
                height: 30,
                // height: 30.h,
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
        ],
      ),
    );
  }

  Widget _showRightUserImage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 32.0,
        ),
        child: Image.asset(
          AssetImages.imgUser,
          fit: BoxFit.cover,
          height: 200,
          // height: 200.h,
        ),
      ),
    );
  }

  Widget _widgetBlurView() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: Container(
              height: 50,
              decoration: blurDecoration,
            ),
          ),
        ),
      ),
    );
  }
}
