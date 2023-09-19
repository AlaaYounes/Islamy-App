import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/tabs/HadethScreens/hadethContent.dart';
import 'package:islamy/tabs/HadethScreens/hadethModel.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadAsset();
    }

    return Scaffold(
      body: Column(
        children: [
          Center(child: Image.asset('assets/images/hadeth_logo.png')),
          Divider(),
          Text('${AppLocalizations.of(context)!.hadeth_name}',
              style: Theme.of(context).textTheme.bodyLarge),
          Divider(),
          hadethList.isEmpty
              ? CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )
              : Expanded(
                  flex: 3,
                  child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HadethContent(
                                      title: hadethList[index].title,
                                      content: hadethList[index].content,
                                    )));
                      },
                      child: Text(
                        '${hadethList[index].title}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      thickness: 1,
                    ),
                    itemCount: hadethList.length,
                  )),
        ],
      ),
    );
  }

  void loadAsset() async {
    String content =
        await rootBundle.loadString('assets/files/hadeth/ahadeth.txt');
    List<String> ahadeth = content.split('#\r\n');
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].split('\n');

      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadeth = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadeth);
    }

    setState(() {});
  }
}
