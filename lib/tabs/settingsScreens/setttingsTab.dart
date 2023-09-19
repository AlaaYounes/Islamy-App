import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/myTheme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:islamy/tabs/settingsScreens/languageBottomSheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.theme}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.blackColor),
                ),
                IconButton(
                  onPressed: () {
                    provider.changeTheme(ThemeMode.dark);
                  },
                  icon: provider.isDarkMode()
                      ? Icon(
                          Icons.dark_mode,
                          color: MyTheme.yellowColor,
                        )
                      : Icon(
                          Icons.light_mode,
                          color: MyTheme.blackColor,
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.isDarkMode()
                          ? MyTheme.yellowColor
                          : MyTheme.blackColor),
                ),
                InkWell(
                  onTap: () {
                    showLanguageBottomSheet(context);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          provider.isEnglish()
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: provider.isDarkMode()
                                      ? MyTheme.yellowColor
                                      : MyTheme.blackColor),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: provider.isDarkMode()
                              ? MyTheme.yellowColor
                              : MyTheme.blackColor,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
