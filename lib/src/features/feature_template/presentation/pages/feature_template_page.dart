import 'package:app_template/core/generated/localizations/locale_keys.g.dart';
import 'package:app_template/core/theme/text_theme.dart';
import 'package:app_template/src/features/feature_template/presentation/bloc/feature_template_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureTemplatePage extends StatelessWidget {
  const FeatureTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FeatureTemplateBloc()..add(FeatureTemplateInitialEvent()),
      child: const _FeatureTemplatePageView(),
    );
  }
}

class _FeatureTemplatePageView extends StatelessWidget {
  const _FeatureTemplatePageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.feature_template_page_title.tr(),
          style: AppFonts.b5s26mediumInter,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Здесь можно будет диспатчить event в Bloc,
          // когда у фичи появится реальная логика загрузки.
          // Сейчас просто маленькая задержка для демонстрации.
          await Future<void>.delayed(const Duration(milliseconds: 300));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
            child: Center(
              child: Text(
                LocaleKeys.feature_template_page_description.tr(),
                style: AppFonts.b4s22regularInter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
