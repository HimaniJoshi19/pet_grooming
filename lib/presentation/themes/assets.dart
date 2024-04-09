import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageAssets {
  static String imageEndPoint = 'assets/images/';
  static String iconEndPoint = 'assets/icons/';

  //error images
  static String technicalErrorImagePath = '${imageEndPoint}technical_error.png';
  static String noDataImagePath = '${imageEndPoint}no_data.png';
  static String noInternetPath = '${imageEndPoint}no_internet.png';
  static String warningImagePath = '${imageEndPoint}warning.png';
  static String ankpalDrawerHeaderImagePath =
      '${imageEndPoint}ankpal_drawer_header_image.png';

  //design images
  static String logoPath = '${imageEndPoint}logo.png';
  static String bottomRectPath = '${imageEndPoint}bottom_rect.png';
  static String onboardingBackgroundPath =
      '${imageEndPoint}onboarding_background.png';
  static String topRectPath = '${imageEndPoint}top_rect.png';
  static String splashBgImagePath = '${imageEndPoint}splash_bg_image.png';
  static String drawerBottomRectImagePath =
      '${imageEndPoint}drawer_bottom_rect.png';
  static String defaultCompanyImagePath =
      '${imageEndPoint}default_company_image.png';

//icons
  static String backIconPath = '${iconEndPoint}back_icon.svg';
  static String drawerIconPath = '${iconEndPoint}drawer_icon.svg';
  static String onboardArrowIconPath = '${iconEndPoint}onboard_arrow_icon.svg';
  static String bankBalanceIconPath = '${iconEndPoint}bank_balance_icon.svg';
  static String blueChartSignIconPath =
      '${iconEndPoint}blue_chart_sign_icon.svg';
  static String greenChartSignIconPath =
      '${iconEndPoint}green_chart_sign_icon.svg';
  static String redChartSignIconPath = '${iconEndPoint}red_chart_sign_icon.svg';
  static String calenderIconPath = '${iconEndPoint}calender_icon.svg';
  static String calenderIcon2Path = '${iconEndPoint}calender_icon_2.svg';
  static String calenderIcon3Path = '${iconEndPoint}calender_icon_3.svg';
  static String cashbalanceIconPath = '${iconEndPoint}cash_balance_icon.svg';
  static String fullScreenIconPath = '${iconEndPoint}full_screen_icon.svg';
  static String fullScreenIcon2Path = '${iconEndPoint}full_screen_icon_2.svg';
  static String stretchIconPath = '${iconEndPoint}stretch_icon.svg';
  static String leftArrowCalenderIconPath =
      '${iconEndPoint}left_arrow_calender_icon.svg';
  static String rightArrowCalenderIconPath =
      '${iconEndPoint}right_arrow_calender_icon.svg';
  static String rocketIconPath = '${iconEndPoint}rocket_icon.svg';
  static String saleXmasIconPath = '${iconEndPoint}sale_xmas_icon.svg';
  static String shoppingBagIconPath = '${iconEndPoint}shopping_bag_icon.svg';
  static String stockValueIconPath = '${iconEndPoint}stock_value_icon.svg';
  static String filterIconPath = '${iconEndPoint}filter_icon.svg';
  static String closeRoundIconPath = '${iconEndPoint}close_round_icon.svg';
  static String searchIconPath = '${iconEndPoint}search_icon.svg';
  static String highToLowIconPath = '${iconEndPoint}high_to_low_icon.svg';
  static String lowToHighIconPath = '${iconEndPoint}low_to_high_icon.svg';
  static String shareIconPath = '${iconEndPoint}share_icon.svg';
  // static String sortIconPath = '${iconEndPoint}sort_icon.svg';
  static String filterSelectedIconPath =
      '${iconEndPoint}filter_selected_icon.svg';
  static String tickIconPath = '${iconEndPoint}tick_icon.svg';
  static String alphabetSortIconPath = '${iconEndPoint}alphabet_sort_icon.svg';
  static String amountSortIconPath = '${iconEndPoint}amount_sort_icon.svg';
  static String dateSortIconPath = '${iconEndPoint}date_sort_icon.svg';
  static String logoutIconPath = '${iconEndPoint}logout_icon.svg';

  //drawer icons
  static String dashboarDrawerIconPath =
      '${iconEndPoint}dashboard_drawer_icon.svg';
  static String salesDrawerIconPath = '${iconEndPoint}sales_drawer_icon.svg';
  static String purchaseDrawerIconPath =
      '${iconEndPoint}purchase_drawer_icon.svg';
  static String ledgerDrawerIconPath = '${iconEndPoint}ledger_drawer_icon.svg';
  static String myAccountDrawerIconPath =
      '${iconEndPoint}my_account_drawer_icon.svg';
  static String switchCompanyDrawerIconPath =
      '${iconEndPoint}switch_company_drawer_icon.svg';
  static String rightDirectionIconPath =
      '${iconEndPoint}right_direction_icon.svg';
  static String crossDrawerIconPath = '${iconEndPoint}cross_drawer_icon.svg';
  static String sortAscIconPath = '${iconEndPoint}sort_asc.svg';
  static String sortDescIconPath = '${iconEndPoint}sort_desc.svg';
  static String receivableDrawerIconPath =
      '${iconEndPoint}receivable_drawer_icon.svg';
  static String payableDrawerIconPath =
      '${iconEndPoint}payable_drawer_icon.svg';

  static Image setImage({
    required String imagePath,
    BoxFit boxFit = BoxFit.contain,
    double? height,
    double? width,
    Color? iconColor,
  }) {
    return Image.asset(
      imagePath,
      fit: boxFit,
      height: height,
      width: width,
      color: iconColor,
    );
  }

  //icons

  static SvgPicture setIcon({
    required String path,
    double? size = 20,
    double? width,
    double? height,
    Color? iconColor,
  }) =>
      SvgPicture.asset(
        path,
        width: width ?? size,
        height: height ?? size,
        color: iconColor,
      );
}
