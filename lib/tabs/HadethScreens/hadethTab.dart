import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/tabs/HadethScreens/hadethContent.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) {
      loadAsset();
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child:
                  Center(child: Image.asset('assets/images/hadeth_logo.png'))),
          Divider(),
          Text('Al-Ahadeth', style: Theme.of(context).textTheme.bodyLarge),
          Divider(),
          Expanded(
              flex: 3,
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HadethContent(
                                  index: index,
                                )));
                  },
                  child: Text(
                    'الحديث رقم ${index + 1}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 1,
                ),
                itemCount: verses.length,
              )),
        ],
      ),
    );
  }

  void loadAsset() async {
    String content =
        await rootBundle.loadString('assets/files/hadeth/ahadeth.txt');
    List<String> lines = content.split('#');
    List<String> hadeth = [];
    for (int i = 0; i < lines.length; i++) {
      List<String> x = lines[i].split('\n');
      hadeth.add(x[0]);
    }
    // lines.forEach((element) {
    //   List<String> x = element.split('\n');
    //   hadeth.add(x[0]);
    // });
    print(hadeth);
    verses = hadeth;
    print(verses.length);
    setState(() {});
  }
}
