import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'style.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(this.pageScreen, {super.key});

  final Widget pageScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 85,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal.shade300),
                child: Text(
                  'Item Header',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelMedium,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Item 1',
                style: listTextStyle,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.android),
              title: Text(
                'Item 2',
                style: listTextStyle,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.android),
              title: Text(
                'Item 3',
                style: listTextStyle,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: pageScreen,
        // FeedBackForm(),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle(this.title, {super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          title == null ? 'Programming' : title!,
          style: title == null
              ? Theme.of(context).textTheme.titleSmall
              : const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 40,
                ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar(this.index, this.total, {super.key});

  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    double progress = (index/total);
    double percent = progress*100;
    // double total = percent*100;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 50,
        animation: true,
        lineHeight: 40,
        percent: progress,
        center: Text('${percent.toStringAsFixed(2)}%',
            style: Theme.of(context).textTheme.titleMedium,),
        progressColor: Colors.teal,
      ),
    );
  }
}

