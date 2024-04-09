import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';
import 'package:pet_grooming/presentation/widgets/components/common_spacings.dart';

class DynamicVerticalAlignDetailWidget extends StatelessWidget {
  const DynamicVerticalAlignDetailWidget({
    super.key,
    required this.itemDetail,
  });
  final List<Map<String, String?>> itemDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Spacings.custom20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: itemDetail.map((Map<String, String?> item) {
          final String key1 = item.keys.elementAt(0);
          final String value1 = (item[key1] != null && item[key1]!.isNotEmpty)
              ? item[key1]!
              : '-';
          final String key2 = item.keys.length > 1
              ? item.keys.elementAt(1).isNotEmpty
                  ? item.keys.elementAt(1)
                  : '-'
              : '';
          final String? value2 = item.keys.length > 1
              ? (item[key2] != null && item[key2]!.isNotEmpty
                  ? item[key2]
                  : '-')
              : '';

          return Padding(
            padding: const EdgeInsets.only(
              bottom: Spacings.custom15,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //left side title
                    Expanded(
                      child: TextLabel(
                        text: key1,
                        textStyle: TextStyles.normal(
                          size: Spacings.custom14,
                          color: Palette.colorSubtitle,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //right side title
                    if (item.keys.length > 1)
                      Expanded(
                        child: TextLabel(
                          text: key2,
                          textStyle: TextStyles.normal(
                            size: Spacings.custom14,
                            color: Palette.colorSubtitle,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                  ],
                ),
                CommonSpacings.commonSpacingHeight(space: Spacings.custom5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //left side description
                    Expanded(
                      child: TextLabel(
                        text: value1,
                        textStyle: TextStyles.normal(
                          size: Spacings.custom14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //right side description
                    if (item.keys.length > 1)
                      Expanded(
                        child: TextLabel(
                          text: value2,
                          textStyle: TextStyles.normal(
                            size: Spacings.custom14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
