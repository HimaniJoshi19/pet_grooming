// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:pet_grooming/constants/string_constants.dart';
import 'package:pet_grooming/presentation/themes/themes.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

enum ErrorType { noInternet, error, noData }

const String errorNoInternet = 'No Internet';
const String errorNoData = 'No data found';
const String errorErrorView = 'Technical Error';
const String msgNoInternetConnection =
    "You don't seem to have an active internet connection. Please check your connection and try again.";
const String msgNoData =
    'Result which you are looking for is not available currently';
const String msgErrorView =
    "Something went wrong\nSorry, we're having some technical issue here, Try to refresh the page";

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    this.height,
    this.width,
    required this.onReconnect,
    required this.errorType,
    this.buttonText,
    this.errorMsg,
    this.errorTitle,
    this.isShowRefreshButton = true,
    this.showIcon = true,
    this.allowHeightNullable = false,
  });

  final double? height;
  final double? width;
  final Function onReconnect;
  final ErrorType errorType;
  final String? errorTitle;
  final String? buttonText;
  final String? errorMsg;
  final bool isShowRefreshButton;
  final bool showIcon;
  final bool allowHeightNullable;

  @override
  Widget build(BuildContext context) {
    late Widget image;
    late String msg;
    late String errorTitle;
    late String buttonText;

    switch (errorType) {
      case ErrorType.noInternet:
        image = ImageAssets.setImage(imagePath: ImageAssets.noInternetPath);
        msg = msgNoInternetConnection;
        buttonText = StringConstants.labelReconnect;
        errorTitle = errorNoInternet;
        break;
      case ErrorType.error:
        image = ImageAssets.setImage(
          imagePath: ImageAssets.technicalErrorImagePath,
        );
        msg = msgErrorView;
        buttonText = StringConstants.labelRefresh;
        errorTitle = errorErrorView;
        break;
      case ErrorType.noData:
        image = ImageAssets.setImage(imagePath: ImageAssets.noDataImagePath);
        msg = msgNoData;
        buttonText = StringConstants.labelRefresh;
        errorTitle = errorNoData;
        break;
      default:
        image = ImageAssets.setImage(imagePath: ImageAssets.noInternetPath);
        msg = msgErrorView;
        buttonText = StringConstants.labelRefresh;
        errorTitle = errorErrorView;
        break;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (showIcon)
              Expanded(
                flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 7 : 0,
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).viewInsets.bottom == 0
                        ? Spacings.large
                        : Spacings.small,
                  ),
                  child: image,
                ),
              ),
            if (showIcon)
              Expanded(
                flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 1 : 0,
                child: const SizedBox(
                  height: Spacings.xLarge,
                ),
              ),
            Expanded(
              child: TextLabel(
                textAlign: TextAlign.center,
                text: this.errorTitle ?? errorTitle,
                textStyle: TextStyles.titleMedium(
                  size: Spacings.custom30,
                ),
              ),
            ),
            const SizedBox(
              height: Spacings.large,
            ),
            Expanded(
              child: TextLabel(
                textAlign: TextAlign.center,
                text: errorMsg ?? msg,
                textStyle: TextStyles.normal(
                  color: Palette.colorTextLight,
                  size: Spacings.medium,
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: Spacings.xxLarge,
            ),
            if (isShowRefreshButton)
              PrimaryButton(
                onTap: () {
                  onReconnect();
                },
                textStyles: TextStyles.button(color: Palette.white),
                label: this.buttonText ?? buttonText,
              ),
          ],
        ),
      ),
    );
  }
}
