import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common/background_widget.dart';
import 'constant/app_assets.dart';
import 'constant/color_constant.dart';
import 'constant/constant_public.dart';
import 'constant/decoration_constant.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: AppColors.greyBlack,
      child: _widgetCenter(),
    );
  }

  Widget _widgetCenter() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _widgetHeader(),
          _widgetSubHeader(),
          const SizedBox(
            height: 30,
          ),
          _widgetTransferMoneyToBank(),
        ],
      ),
    );
  }

  /// This widget shows a Header Title.
  Widget _widgetHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          kHelloNikky,
          style: headerText,
        ),
        BackgroundWidget(child: _searchView()),
      ],
    );
  }

  /// This widget shows a search view.
  Widget _searchView() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: const [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: kSearch,
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetSubHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          kWelcomeBack,
          style: subHeaderText,
        ),
      ],
    );
  }

  Widget _widgetTransferMoneyToBank() {
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
          height: 210,
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
              height: 75,
              decoration: blurDecoration,
            ),
          ),
        ),
      ),
    );
  }
}
