import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    if (verses.isEmpty) {
      loadAsset();
    } else {
      CircularProgressIndicator();
    }

    return Stack(
      children: [
        Image.asset(
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
                      horizontal: MediaQuery.of(context).size.width * .01,
                      vertical: MediaQuery.of(context).size.width * .01),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Text(
                      verses[index],
                      textDirection: TextDirection.rtl,
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
