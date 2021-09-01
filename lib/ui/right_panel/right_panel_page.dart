import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/background_widget.dart';
import '../../common/images_path.dart';
import '../../constant/app_assets.dart';
import '../../common/screen_type.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../cubit/theme/theme_cubit.dart';
import 'widget/spline_graph.dart' show SplineGraph;
import 'widget/square_button.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    return _buildBody()!;
  }

  Widget? _buildBody() {
    var appTheme = BlocProvider.of<ThemeCubit>(context, listen: false).appTheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
       decoration: BoxDecoration(
         color: appTheme.primaryColor,
         border: const Border(
           left: BorderSide(width: 3.0, color: AppColors.greyWhite),
         ),
       ),
        child: Stack(
          children: [
            Image.asset(
              AssetImages.imgBackNoise,
              height: 950.0,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _mailButton()!,
                        _profilePicture()!,
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    BackgroundWidget(
                      child: _reportSplineGraph()!,
                    ),
                    const SizedBox(height: 15.0),
                    BackgroundWidget(
                      child: _reportDoughnutTitle()!,
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _mailButton() {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(ImagesPath.mailIconPath),
      ),
    );
  }

  Widget? _profilePicture() {
    return TexturedContainerButton(
      buttonContent: Image.asset(
        ImagesPath.profileImagePath,
        height: 58.0,
        width: 58.0,
      ),
      isBorder: false,
    );
  }

  Widget? _reportSplineGraph() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Reports',
                  style: customReportTitle,
                ),
                GestureDetector(
                  child: Container(
                    height: (ScreenType.isDesktop(context)) ? 53.0.h : 53.0,
                    width: (ScreenType.isDesktop(context))  ? 138.0.w : 138.0,
                    decoration: const BoxDecoration(
                      color: AppColors.reportDropDownColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              'Month',
                              style: (ScreenType.isDesktop(context)) ? customDropDownTitle.copyWith(
                                fontSize: 16.0.sp,
                              ) : customDropDownTitle,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const SplineGraph(),
        ],
      ),
    );
  }

  Widget? _reportDoughnutTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(text: '85', style: percentageStyle),
                  TextSpan(text: '%', style: percentageIconStyle),
                ]),
              ),
              _doughnutChatSvg()!, //DoughnutGraph(),
            ],
          ),
          const SizedBox(height: 25.0),
          _getDoughnutData()!,
        ],
      ),
    );
  }

  Widget? _doughnutChatSvg() {
    return SvgPicture.asset(
      ImagesPath.doughnutChartPath,
    );
  }

  Widget? _getDoughnutData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: <Widget>[
          _commonDoughnutData('Utility', '\$ 847.00', AppColors.blue)!,
          const SizedBox(height: 20.0),
          _commonDoughnutData('Taxi', '\$ 568.50', AppColors.purple)!,
          const SizedBox(height: 20.0),
          _commonDoughnutData('Food', '\$ 685.50', AppColors.orange)!,
        ],
      ),
    );
  }

  Widget? _commonDoughnutData(String title, String value, Color colour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.circle,
              color: colour,
              size: 10.0,
            ),
            const SizedBox(width: 10.0),
            Text(
              title,
              style: doughnutDataStyle,
            ),
          ],
        ),
        Text(
          value,
          style: doughnutDataStyle,
        ),
      ],
    );
  }
}
