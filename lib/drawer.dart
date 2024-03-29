import 'package:flutter/material.dart';

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