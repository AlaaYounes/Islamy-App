import 'package:flutter/material.dart';
import 'package:islamy/myTheme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbeehTab extends StatefulWidget {
  @override
  State<TasbeehTab> createState() => _TasbeehTabState();
}

class _TasbeehTabState extends State<TasbeehTab> {
  @override
  Widget build(BuildContext context) {
    int counter = 1;
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(provider.isDarkMode()
                ? 'assets/images/head_sebha_dark.png'
                : 'assets/images/head_sebha_logo.png'),
            Image.asset(provider.isDarkMode()
                ? 'assets/images/body_sebha_dark.png'
                : 'assets/images/body_sebha_logo.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 81,
              width: 69,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyTheme.primaryDark
                    : MyTheme.primaryLight,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 51,
              width: 137,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                'سبحان الله',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.isDarkMode()
                        ? MyTheme.yellowColor
                        : MyTheme.blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
