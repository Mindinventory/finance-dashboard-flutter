import 'package:flutter/material.dart';
import '../../common/screen_type.dart';
import '../../widgets/side_menu_widget/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildScreenSections(context));
  }

  Widget _buildScreenSections(BuildContext context) {
    return Row(
      children: [
        Visibility(
            visible: (ScreenType.isDesktop(context)) ||
                (ScreenType.isTablet(context)),
            child: const Expanded(flex: 4, child: SideMenu())),
        Expanded(
          flex: 10,
          child: Container(color: Colors.red),
        ),
        Expanded(
          flex: 5,
          child: Container(color: Colors.blue),
        )
      ],
    );
  }
}
