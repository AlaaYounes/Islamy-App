import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/myTheme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              provider.changeLanguage(Locale('ar'));
            },
            child: provider.isEnglish()
                ? getUnselectedWidget(AppLocalizations.of(context)!.arabic)
                : getSelectedWidget(AppLocalizations.of(context)!.arabic),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              provider.changeLanguage(Locale('en'));
            },
            child: provider.isEnglish()
                ? getSelectedWidget(AppLocalizations.of(context)!.english)
                : getUnselectedWidget(AppLocalizations.of(context)!.english),
          ),
        ),
      ],
    );
  }

  Widget getSelectedWidget(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyTheme.yellowColor)),
          Icon(
            Icons.check,
            color: MyTheme.yellowColor,
          ),
        ],
      ),
    );
  }

  Widget getUnselectedWidget(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyTheme.blackColor)),
        ],
      ),
    );
  }
}
