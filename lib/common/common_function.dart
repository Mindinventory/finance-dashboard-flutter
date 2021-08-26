import '../constant/constant_public.dart';

import '../model/drawer_tiles_model.dart';

class CommonFunction {
  List<DrawerTilesModel> getTilesData() {
    return [
      DrawerTilesModel(
          title: kDashboard, icons: AssetImages.menuIcon, isPressed: false),
      DrawerTilesModel(
          title: kCards, icons: AssetImages.cardIcon, isPressed: false),
      DrawerTilesModel(
          title: kStatistics,
          icons: AssetImages.statisticsIcon,
          isPressed: false),
      DrawerTilesModel(
          title: kPremium, icons: AssetImages.premiumIcon, isPressed: false),
      DrawerTilesModel(
          title: kProfile, icons: AssetImages.userIcon, isPressed: false),
      DrawerTilesModel(
          title: kSettings, icons: AssetImages.settingsIcon, isPressed: false),
    ];
  }
}
