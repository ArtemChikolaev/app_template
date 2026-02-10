import 'package:app_template/app/di/service_locator.dart';
import 'package:app_template/app/router/app_router.dart';
import 'package:app_template/app/theme/text_theme.dart';
import 'package:app_template/core/generated/assets/assets.gen.dart';
import 'package:app_template/core/generated/localizations/locale_keys.g.dart';
import 'package:app_template/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomePageBloc>()..add(HomePageInitialEvent()),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.home_page_title.tr(),
              style: AppFonts.b5s30mediumInter,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              final bloc = context.read<HomePageBloc>();
              bloc.add(HomePageInitialEvent());
              await bloc.stream
                  .where((HomePageState s) => !s.isLoading)
                  .first
                  .timeout(const Duration(seconds: 30));
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height:
                    MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    MediaQuery.of(context).padding.top,
                child: Center(
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
                            style: AppFonts.b5s24mediumInter,
                          ),
                          const SizedBox(width: 8),
                          Assets.icons.testIcon.svg(width: 24, height: 24),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (state.isLoading) ...[
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20),
                      ] else if (state.errorMessage != null) ...[
                        Text(
                          state.errorMessage!.tr(),
                          style: AppFonts.b4s22regularInter.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ] else if (state.title != null) ...[
                        Text(
                          state.title!,
                          style: AppFonts.b4s22regularInter,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        if (state.description != null)
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              state.description!,
                              style: AppFonts.b4s16regularInter,
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                      ElevatedButton(
                        onPressed: () {
                          context.pushNamed(
                            MobilePages.featureTemplatePage.name,
                          );
                        },
                        child: Text(
                          LocaleKeys.feature_template_page_title.tr(),
                          style: AppFonts.b4s20regularInter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
