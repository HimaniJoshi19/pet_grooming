import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/themes.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class CommonAppBar {
  CommonAppBar({
    required this.context,
    this.actionList = const <Widget>[],
    required this.appBartitle,
    this.isShowBackArrow = true,
    this.isTitleImage = false,
    this.leadingWidget,
    this.titleWidget,
    this.onBackArrowFunction,
  });

  final BuildContext context;
  final List<Widget> actionList;
  final String appBartitle;
  final Widget? titleWidget;
  final bool isShowBackArrow;
  final bool isTitleImage;
  final Widget? leadingWidget;
  final Function()? onBackArrowFunction;

  AppBar getCommonAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: isShowBackArrow
          ? IconButton(
              icon: ImageAssets.setIcon(
                path: ImageAssets.backIconPath,
                iconColor: Palette.white,
                size: Spacings.custom14,
              ),
              onPressed: () {
                onBackArrowFunction != null
                    ? onBackArrowFunction!()
                    : Navigator.pop(context);
              },
            )
          : leadingWidget,
      actions: actionList,
      backgroundColor: Palette.primary,
      title: isTitleImage
          ? SizedBox(
              height: Spacings.custom30,
              child: ImageAssets.setImage(imagePath: ImageAssets.logoPath),
            )
          : titleWidget ??
              TextLabel(
                text: appBartitle,
                textStyle: TextStyles.normalDrawer(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
    );
  }
}
