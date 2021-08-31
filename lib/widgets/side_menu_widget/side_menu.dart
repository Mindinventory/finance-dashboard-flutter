import 'package:flutter/material.dart';

import '../../common/common_function.dart';
import '../../constant/app_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/constant_public.dart';
import '../../constant/string_constants.dart';
import '../../model/drawer_tiles_model.dart';
import '../side_menu_widget/drawer_tiles.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

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
    return _buildSideMenu(_height, _width);
  }

  Widget _buildSideMenu(double _height, double _width) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.sideMenu,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: _height * 0.075),
              child: Image.asset(
                AssetImages.menuHeader,
              ),
            ),
            _buildDrawerList(),
            SizedBox(
              height: _height * 0.09,
            ),
            _buildImageCard(_width, _height)
          ],
        ),
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(_tileList[i].title),
        backgroundColor: AppColors.customBlueColor,
        duration: const Duration(milliseconds: 300),
      ));
    });
  }

  Widget _buildImageCard(double width, double height) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: AppColors.greyBlack,
            child: Container(
              height: 230,
              width: 200,
              child: Column(
                children: [
                  Container(
                    child: const Text(
                      kPremiumPurchase,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.04),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 30,
              right: width * 0.02,
              left: width * 0.02,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: AppColors.customBlueColor,
                child: Container(
                  child: const Center(
                      child: Text(
                    kPremium,
                    style: drawerListText,
                  )),
                  height: 60,
                ),
              )),
          Positioned(left: 0, right: 0, top: 0, bottom: 30, child: Image.asset(AssetImages.silyImage)),
        ],
      ),
    );
  }
}
