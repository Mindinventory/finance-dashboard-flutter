import 'package:flutter/cupertino.dart';

import 'app_assets.dart';
import 'color_constant.dart';
import 'const_value.dart';

final blurDecoration = BoxDecoration(
  borderRadius: const BorderRadius.only(
    bottomLeft: Radius.circular(backgroundBorderRadius),
    bottomRight: Radius.circular(backgroundBorderRadius),
  ),
  color: AppColors.greyBlack.withOpacity(0.5),
);

final kBackgroundWidgetGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    colors: [
      AppColors.white.withOpacity(0.3),
      AppColors.greyBlack.withOpacity(0.3),
    ],
  ),
  borderRadius: BorderRadius.circular(backgroundBorderRadius),
);
final kBackgroundWidgetInnerDecoration = BoxDecoration(
  image: const DecorationImage(
    filterQuality: FilterQuality.high,
    image: AssetImage(AssetImages.imgNoise),
    fit: BoxFit.fill,
  ),
  color: AppColors.greyBlack,
  borderRadius: BorderRadius.circular(backgroundBorderRadius),
);
