import 'package:flutter/material.dart';
import 'package:islamy/myTheme.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbeehTab extends StatefulWidget {
  @override
  State<TasbeehTab> createState() => _TasbeehTabState();
}

class _TasbeehTabState extends State<TasbeehTab> {
  int counter = 0;
  String text = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if (counter >= 132) {
                  counter = 0;
                }
                buildCounter();
                changeTasbeeh();
              },
              child: Transform.rotate(
                angle: 3.14 * counter / 16.5,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Image.asset(
                        provider.isDarkMode()
                            ? 'assets/images/head_sebha_dark.png'
                            : 'assets/images/head_sebha_logo.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * .2),
                      child: Image.asset(provider.isDarkMode()
                          ? 'assets/images/body_sebha_dark.png'
                          : 'assets/images/body_sebha_logo.png'),
                    ),
                  ],
                ),
              ),
            ),
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
                text,
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

  buildCounter() {
    counter++;
    setState(() {});
  }

  changeTasbeeh() {
    if (counter <= 33) {
      text = 'سبحان الله';
    } else if (counter > 33 && counter <= 66) {
      text = 'الحمد لله';
    } else if (counter > 66 && counter <= 99) {
      text = 'الله أكبر';
    } else if (counter > 99 && counter <= 132) {
      text = 'لا اله الا الله';
    }
    setState(() {});
  }
}
