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
          height: 60.0,
          margin: EdgeInsets.symmetric(
            horizontal: _width * 0.01,
          ),
          /*padding: const EdgeInsets.symmetric(
            vertical: 7.0,
          ),*/
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: tileData.isPressed ? AppColors.customBlueColor : Colors.transparent,
          ),
          child: Stack(
            children: [
              tileData.isPressed
                  ? const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      child: Image(
                        image: AssetImage(AssetImages.imgNoise),
                        fit: BoxFit.fill,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    )
                  : Container(),
              Center(
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          tileData.icons,
                        ),
                        const SizedBox(width: 30.0),
                        Text(
                          tileData.title,
                          style: tileData.isPressed ? visibleDrawerListStyle : drawerListStyle,
                        ),
                      ],
                    ),
                  ),
                  onTap: pressFunction,
                ),
              )
              /*ListTile(
                onTap: pressFunction,
                leading: SvgPicture.asset(
                  tileData.icons,
                ),
                title: Text(
                  tileData.title,
                  style: tileData.isPressed ? visibleDrawerListStyle : drawerListStyle,
                ),
              ),*/
            ],
          ),
        ),
        /* tileData.isPressed
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
