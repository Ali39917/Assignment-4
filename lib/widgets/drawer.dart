import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 10,
        width: 250,
        child: Column(
          children: [
            const DrawerHeaderWidget(),

            buildDrawerItem(
              icon: CupertinoIcons.settings_solid,
              title: 'Settings',
              onTap: () {
                Navigator.of(context).pop();

              },
            ),
            const Divider(
              height: 100,
              color: Colors.grey,
            ),
            buildDrawerItem(
              icon: CupertinoIcons.info_circle_fill,
              title: 'Info',
              onTap: () {
                Navigator.of(context).pop();


              },
            ),
          ],
        ),
      ),
    );
  }

  DrawerItem buildDrawerItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return DrawerItem(
      icon: icon,
      title: title,
      onTap: onTap,
    );
  }
}

// Drawer Header Widget
class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Center(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('Assets/images/B1.png'),
            ),
          ],
        ),
      ),
    );
  }
}

// Drawer Item Widget for each ListTile
class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
