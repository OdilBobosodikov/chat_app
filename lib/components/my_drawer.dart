import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        dividerTheme: DividerThemeData(color: Colors.transparent),
      ),
      child: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: Icon(
                      Icons.telegram,
                      color: Theme.of(context).colorScheme.primary,
                      size: 80,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("H O M E"),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("S E T T I N G S"),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/settings");
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("L O G O U T"),
                onTap: logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
