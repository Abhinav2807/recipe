import 'package:flutter/material.dart';
import './filter_screen.dart';

class NewDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String text, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(fontFamily: "RobotoCondensed", fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.22,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            Icons.restaurant,
            "Meals",
            () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          buildListTile(
            Icons.settings,
            "Filters",
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
