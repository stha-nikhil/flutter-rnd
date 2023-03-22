import 'package:flutter/material.dart';

import 'style.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 85,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal.shade300),
              child: Text(
                'Item Header',
                style: Theme.of(context).textTheme.labelMedium,
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
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
       child: Text(
           'Programming',
           style: Theme.of(context).textTheme.titleSmall,
       ),
      )
    );
  }
}
