import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:islamy/tabs/HadethScreens/hadethTab.dart';
import 'package:islamy/tabs/QuranScreens/quranTab.dart';
import 'package:islamy/tabs/radioScreens/radioTab.dart';
import 'package:islamy/tabs/settingsScreens/setttingsTab.dart';
import 'package:islamy/tabs/tasbeehScreens/tasbeehTab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              'assets/images/background_dark.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/background_light.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${AppLocalizations.of(context)!.app_title}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.quran}'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.hadeth}'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.sebha}'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png'),
                  ),
                  label: '${AppLocalizations.of(context)!.radio}'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: '${AppLocalizations.of(context)!.settings}'),
            ],
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex,
          ),
        ),
        body: screens[selectedIndex],
      ),
    ]);
  }

  List<Widget> screens = [
    QuranTab(),
    HadethTab(),
    TasbeehTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
