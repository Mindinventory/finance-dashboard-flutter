import 'package:flutter/rendering.dart';

import '../right_panel/right_panel_page.dart';
import 'package:flutter/material.dart';

import '../../common/screen_type.dart';
import '../../widgets/side_menu_widget/side_menu.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: _buildDashboardSections(context),
    );
  }

  Widget _buildDashboardSections(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: _visibilityForTabAndWeb(),
              child: const Expanded(
                child: SideMenu(),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCenterView(constraints),
                        (constraints.maxWidth > 1230)
                            ? Expanded(
                                flex: 2,
                                child: _buildChartView(),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  bool _visibilityForTabAndWeb() {
    return (ScreenType.isDesktop(context)) || (ScreenType.isTablet(context));
  }

  Widget _buildCenterView(BoxConstraints constraints) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Container(
              child: const Text('Center Header Widget'),
              alignment: Alignment.center,
              height: 100,
              color: Colors.orange,
            ),
            const SizedBox(height: 16.0),
            Container(
              child: const Text('Transfer Money Widget'),
              alignment: Alignment.center,
              height: 200,
              color: Colors.orange,
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: const Text('Top Activities Widget'),
                        alignment: Alignment.center,
                        height: 420,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            child: const Text('Card 1'),
                            alignment: Alignment.center,
                            height: 210,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            child: const Text('Card 2'),
                            alignment: Alignment.center,
                            height: 210,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            (ScreenType.isMobile(context)) ? const SizedBox(height: 16.0) : Container(),
            //(ScreenType.isMobile(context)) ? _buildChartView() : Container(),
            (constraints.maxWidth < 1230) ? _buildChartView() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildChartView() {
    return const RightPanel();
  }
}
