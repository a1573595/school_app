import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:school_app/l10n/l10n.dart';

Widget buildTestWidget({
  required Widget home,
  List<Override> overrides = const [],
}) =>
    ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            final appLocalizations = AppLocalizations.of(context)!;
            L10n.init(appLocalizations);

            return home;
          },
        ),
      ),
    );
