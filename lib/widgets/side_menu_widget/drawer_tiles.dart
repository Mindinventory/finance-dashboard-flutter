import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/app_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../model/drawer_tiles_model.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({required this.pressFunction, required this.tileData, Key? key}) : super(key: key);

  final DrawerTilesModel tileData;
  final VoidCallback pressFunction;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: _width * 0.01,
          ),
          /*padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),*/
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: tileData.isPressed ? AppColors.customBlueColor : Colors.transparent,
          ),
          child: Stack(
            children: [
              tileData.isPressed
                  ? const Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Image(
                          image: AssetImage(AssetImages.imgNoise),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListTile(
                  onTap: pressFunction,
                  leading: SvgPicture.asset(
                    tileData.icons,
                  ),
                  title: Text(
                    tileData.title,
                    style: tileData.isPressed ? visibleDrawerListStyle : drawerListStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        /*tileData.isPressed
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.01,
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    child: Image(
                      image: AssetImage(AssetImages.imgNoise),
                    ),
                  ),
                ),
              )
            : Container(),*/
        //tileData.isPressed ? Image.asset(AssetImages.imgLeftSelectedCardNoise):null,
      ],
    );
  }
}
