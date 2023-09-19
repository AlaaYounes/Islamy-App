import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class QuranContent extends StatefulWidget {
  String name;
  int index;

  QuranContent({required this.name, required this.index});

  @override
  State<QuranContent> createState() => _QuranContentState();
}

class _QuranContentState extends State<QuranContent> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadAsset();
    } else {
      CircularProgressIndicator();
    }

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
              'Islami',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  widget.name,
                  style: Theme.of(context).textTheme.bodySmall,
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
                      horizontal: MediaQuery.of(context).size.width * .02,
                      vertical: MediaQuery.of(context).size.width * .02),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      '${verses[index]}{${index + 1}}',
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    itemCount: verses.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void loadAsset() async {
    String content = await rootBundle
        .loadString('assets/files/quran/${widget.index + 1}.txt');
    List<String> lines = content.split('\n');
    print(lines);
    verses = lines;
    setState(() {});
  }
}
