import 'package:app_template/core/generated/assets/assets.gen.dart';
import 'package:app_template/core/generated/localizations/locale_keys.g.dart';
import 'package:app_template/core/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.home_page_title.tr(),
          style: AppFonts.b5s30mediumInter,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.testImage.svg(width: 150, height: 150),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.hello_world.tr(),
                  style: AppFonts.b4s22regularInter,
                ),
                const SizedBox(width: 8),
                Assets.icons.testIcon.svg(width: 24, height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
