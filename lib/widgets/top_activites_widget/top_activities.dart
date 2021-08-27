import 'package:flutter/material.dart';

import '../../common/background_widget.dart';
import '../../constant/color_constant.dart';
import '../../constant/const_value.dart';
import '../../constant/font_style.dart';
import '../../model/top_activities_tile_model.dart';
import 'top_activities_tile.dart';

class TopActivities extends StatelessWidget {
  TopActivities({Key? key}) : super(key: key);

  final List<TopActivitiesTileModel> _topActivities = [
    TopActivitiesTileModel(
      title: 'Utility',
      details: '01 Apr, 1:30 pm',
      percent: 50,
      bgColor: AppColors.blue,
    ),
    TopActivitiesTileModel(
      title: 'Transfered',
      details: '10 Apr, 1:30 pm',
      percent: 25,
      bgColor: AppColors.purple,
    ),
    TopActivitiesTileModel(
      title: 'Food',
      details: '15 Apr, 4:30 pm',
      percent: 15,
      bgColor: AppColors.lightOrange,
    ),
    TopActivitiesTileModel(
      title: 'Beauty',
      details: '15 Apr, 7:30 pm',
      percent: 10,
      bgColor: AppColors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BackgroundWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 33.0, left: 27.0, bottom: 5.0),
              child: Text(
                kTopActivities,
                style: customReportTitle,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _topActivities.length,
              itemBuilder: (context, index) => TopActivitiesTile(
                topActivity: _topActivities[index],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
