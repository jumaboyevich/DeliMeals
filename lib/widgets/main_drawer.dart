import 'package:deli_meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tabHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tabHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.amber,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
