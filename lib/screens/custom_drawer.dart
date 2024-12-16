import 'package:flutter/material.dart';
import 'logout.dart';

class CustomDrawer extends StatelessWidget {
  final String username;

  const CustomDrawer({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('customDrawer'),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            key: const Key('drawerHeader'),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  username,
                  key: const Key('drawerUsername'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _drawerItem(
              context, Icons.person, 'My Details', '/my-details', 'myDetails'),
          _drawerItem(
              context, Icons.folder, 'Documents', '/documents', 'documents'),
          _drawerItem(context, Icons.school, 'My Trainings', '/my-trainings',
              'myTrainings'),
          _drawerItem(context, Icons.description, 'Contracts', '/contracts',
              'contracts'),
          _drawerItem(
              context, Icons.settings, 'Settings', '/settings', 'settings'),
          Divider(),
          ListTile(
            key: const Key('logoutTile'),
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LogoutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String title,
      String routeName, String keySuffix) {
    return ListTile(
      key: Key('${keySuffix}Tile'),
      leading: Icon(icon),
      title: Text(title, key: Key('${keySuffix}Title')),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
