import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethContent extends StatefulWidget {
  // String name;
  int index;

  HadethContent({required this.index});

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
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
                  verses[0],
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
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Visibility(
                        visible: index == 0 ? false : true,
                        child: Text(
                          verses[index],
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      );
                    },
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
        .loadString('assets/files/ahadeeth/h${widget.index + 1}.txt');
    List<String> lines = content.split('\n');
    print(lines);
    verses = lines;
    setState(() {});
  }
}
