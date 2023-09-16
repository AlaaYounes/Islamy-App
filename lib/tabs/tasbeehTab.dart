import 'package:flutter/material.dart';

class TasbeehTab extends StatefulWidget {
  @override
  State<TasbeehTab> createState() => _TasbeehTabState();
}

class _TasbeehTabState extends State<TasbeehTab> {
  @override
  Widget build(BuildContext context) {
    double currentPostion = 0;
    int counter = 1;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Transform.rotate(
                angle: currentPostion,
                child: Image.asset('assets/images/head_sebha_logo.png')),
            Image.asset('assets/images/body_sebha_logo.png'),
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
                color: Color(0x91B7935F),
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
            InkWell(
              onTap: () {
                if (counter < 34)
                  currentPostion = currentPostion - 360 / counter;
                else {
                  counter = 0;
                }
                setState(() {});
              },
              child: Container(
                height: 51,
                width: 137,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  'سبحان الله',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Color(0xffFFFFFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
