import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionCodeWidget extends StatelessWidget {
  const VersionCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacings.medium),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FutureBuilder<String?>(
          future: getVersionCode(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (ConnectionState.done == snapshot.connectionState) {
              return TextLabel(
                text: snapshot.data ?? '',
                textStyle: TextStyles.normal(),
              );
            } else {
              return const Offstage();
            }
          },
        ),
      ),
    );
  }
}

Future<String?> getVersionCode() async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}
