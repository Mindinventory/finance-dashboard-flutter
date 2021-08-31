import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../common/screen_type.dart';
import '../../widgets/side_menu_widget/side_menu.dart';
import '../../widgets/top_activites_widget/top_activities.dart';
import '../../widgets/user_cards/credit_card_slider.dart';
import '../right_panel/right_panel_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var _width = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const SideMenu(),
      body: _buildDashboardSections(context),
    );
  }

  Widget _buildDashboardSections(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: (_width >= 1150),
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
            _getMidSection(),
            (ScreenType.isMobile(context))
                ? const SizedBox(height: 16.0)
                : Container(),
            (constraints.maxWidth < 1230) ? _buildChartView() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _getMidSection() {
    return (!ScreenType.isMobile(context))
        ? Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopActivities(),
                  const CreditCardSlider(
                      isMobile: false) /*_buildCardSection(false)*/
                ],
              )
            ],
          )
        : Column(
            children: [
              const CreditCardSlider(isMobile: true),
              const SizedBox(height: 16.0),
              TopActivities()
            ],
          );
  }

  Widget _buildChartView() {
    return const RightPanel();
  }
}
