import 'package:flutter/material.dart';

import '../../constant/app_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../model/top_activities_tile_model.dart';

class TopActivitiesTile extends StatelessWidget {
  final TopActivitiesTileModel topActivity;

  const TopActivitiesTile({
    required this.topActivity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topActivity.title,
                style: customDropDownTitle,
              ),
              const SizedBox(height: 5.0),
              Text(
                topActivity.details,
                style: topActivitiesDetailsTitleStyle.copyWith(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          Container(
            decoration: _getOuterGradient(),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: _getCenterGradient(),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    width: 50.0,
                    height: 50.0,
                    decoration: _getInnerGradient(),
                    child: Text(
                      '${topActivity.percent}%',
                      style: topActivitiesDetailsTitleStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _getOuterGradient() {
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: SweepGradient(
        center: FractionalOffset.topCenter,
        colors: [
          topActivity.bgColor,
          topActivity.bgColor.withOpacity(0.0),
        ],
        stops: [0.0, 0.5],
      ),
    );
  }

  BoxDecoration _getCenterGradient() {
    return const BoxDecoration(
      color: AppColors.greyBlack,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(AssetImages.imgNoise),
        fit: BoxFit.fill,
      ),
    );
  }

  BoxDecoration _getInnerGradient() {
    return BoxDecoration(
      color: topActivity.bgColor,
      shape: BoxShape.circle,
    );
  }
}
