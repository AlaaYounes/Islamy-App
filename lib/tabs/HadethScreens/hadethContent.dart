import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethContent extends StatefulWidget {
  String title;
  List<String> content;

  HadethContent({required this.title, required this.content});

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  // List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    // if (verses.isEmpty) {
    //   loadAsset();
    // }
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
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
          body: Column(
            children: [
              Center(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .2),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .01,
                      vertical: MediaQuery.of(context).size.width * .01),
                  child: ListView(children: [
                    Text(
                      '${widget.content}',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

// void loadAsset() async {
//   String content = await rootBundle
//       .loadString('assets/files/ahadeeth/h${widget.index + 1}.txt');
//   List<String> lines = content.split('\n');
//   print(lines);
//   verses = lines;
//   setState(() {});
// }
}
