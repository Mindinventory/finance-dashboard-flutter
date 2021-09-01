import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/background_widget.dart';
import '../../common/common_function.dart';
import '../../constant/app_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/constant_public.dart';
import '../../model/drawer_tiles_model.dart';
import '../side_menu_widget/drawer_tiles.dart';

class SideMenu extends StatefulWidget {
  final bool isFromDrawer;

  const SideMenu({Key? key, this.isFromDrawer = false}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final List<DrawerTilesModel> _tileList = [];

  @override
  void initState() {
    _tileList.addAll(CommonFunction().getTilesData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return widget.isFromDrawer
        ? Container(
            width: 300.0,
            child: _buildSideMenu(_height, _width),
          )
        : _buildSideMenu(_height, _width);
  }

  Widget _buildSideMenu(double _height, double _width) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.sideMenu,
        border: Border(
          right: BorderSide(width: 3.0, color: AppColors.greyWhite),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            AssetImages.imgLeftCardNoise,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                SvgPicture.asset(AssetImages.menuHeader),
                const SizedBox(height: 40.0),
                _buildDrawerList(),
                SizedBox(
                  height: _height * 0.09,
                ),
                _buildImageCard(_width, _height)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerList() {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: _tileList.length,
        itemBuilder: (context, i) {
          return DrawerListTile(tileData: _tileList[i], pressFunction: () => _listSelectAction(i, context));
        });
  }

  void _listSelectAction(int i, BuildContext context) {
    setState(() {
      var index = _tileList.indexWhere((element) => element.isPressed == true);
      if (index >= 0) {
        _tileList[index].isPressed = false;
      }
      _tileList[i].isPressed = true;
    });
  }

  Widget _buildImageCard(double width, double height) {
    return Container(
      height: 350,
      child: Stack(
        children: [
          BackgroundWidget(
            child: Container(
              height: 280.0,
              width: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  kPremiumPurchase,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: width * 0.02,
            left: width * 0.02,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: AppColors.customBlueColor,
                  ),
                  child: Container(
                    child: const Center(
                      child: Text(
                        kPremium,
                        style: visibleDrawerListStyle,
                      ),
                    ),
                    height: 60,
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Image.asset(
                    AssetImages.imgNoise,
                    height: 60.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 30,
            child: Image.asset(AssetImages.silyImage),
          ),
        ],
      ),
    );
  }
}
