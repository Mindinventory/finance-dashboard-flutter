import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../model/drawer_tiles_model.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key, required this.pressFunction, required this.tileData})
      : super(key: key);

  final DrawerTilesModel tileData;
  final VoidCallback pressFunction;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: _width * 0.01,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color:
            tileData.isPressed ? AppColors.customBlueColor : Colors.transparent,
      ),
      child: ListTile(
        onTap: pressFunction,
        leading: SvgPicture.asset(
          tileData.icons,
        ),
        title: Text(
          tileData.title,
          style: drawerListText,
        ),
      ),
    );
  }
}
