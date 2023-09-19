import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          SizedBox(
            height: 20,
          ),
          Text(
            'اذاعة القران الكريم',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.skip_previous,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                Icons.play_arrow,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
              Icon(
                Icons.skip_next,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}

