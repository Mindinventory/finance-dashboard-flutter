import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/background_widget.dart';
import '../../common/menu_controller.dart';
import '../../common/screen_type.dart';
import '../../constant/const_value.dart';
import '../../constant/font_style.dart';

class CenterHeader extends StatefulWidget {
  const CenterHeader({Key? key}) : super(key: key);

  @override
  _CenterHeaderState createState() => _CenterHeaderState();
}

class _CenterHeaderState extends State<CenterHeader> {
  var _width = 0.0;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildHamburgerButton(context),
              _buildHeaderTitleView(context),
              const Spacer(),
              _buildSearchView(context),
            ],
          ),
          (_width >= 1250) ? _widgetSubHeader() : Container(),
        ],
      ),
    );
  }

  BackgroundWidget _buildSearchView(BuildContext context) {
    return (!ScreenType.isMobile(context))
        ? BackgroundWidget(child: _searchView())
        : BackgroundWidget(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12.0),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          );
  }

  Widget _buildHeaderTitleView(BuildContext context) {
    return (_width >= 1250)
        ? FittedBox(
            fit: BoxFit.cover,
            child: Text(
              kHelloNikky,
              style: headerText.copyWith(
                fontSize: 48.0.sp,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    kHelloNikky,
                    style: headerText.copyWith(
                      fontSize: 48.0.sp,
                    ),
                  ),
                ),
                _widgetSubHeader(),
              ],
            ),
          );
  }

  Widget _buildHamburgerButton(BuildContext context) {
    return ((_width < 1250))
        ? BackgroundWidget(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                child: const Icon(Icons.menu, color: Colors.white),
                onTap: context.read<MenuController>().controlMenu,
              ),
            ),
          )
        : Container();
  }

  Widget _widgetSubHeader() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        kWelcomeBack,
        style: subHeaderText,
      ),
    );
  }

  Widget _searchView() {
    return Container(
      width: 200,
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
              width: 145,
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
}
