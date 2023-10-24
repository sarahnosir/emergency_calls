import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.emergency,
              size: 60,
            ),
            Text(
              "Emergency Calls",
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        )),
        ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => context.go('/')),
        ListTile(
          onTap: () {
            context.go('/requests');
          },
          leading: const Icon(Icons.list),
          title: const Text('Requests'),
        ),
      ]),
    );
  }
}
