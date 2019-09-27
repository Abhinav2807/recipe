import 'package:flutter/material.dart';
import 'package:recipe/screens/new_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String,bool> filter;
  FilterScreen(this.setFilters,this.filter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;

  var vegan = false;

  var vegetarian = false;

  var lactoseFree = false;
   
   
   @override
   initState()
   {
     glutenFree=widget.filter['gluten'];
     vegan=widget.filter['vegan'];
     lactoseFree=widget.filter['lactose'];
     vegetarian=widget.filter['vegetarian'];
     super.initState();

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.setFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: NewDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Choose your meal selection ",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  value: glutenFree,
                  title: Text("Gluten Free"),
                  subtitle: Text("Only include gluten free meals"),
                  onChanged: (newVal) {
                    setState(() {
                      glutenFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  value: vegan,
                  title: Text("Vegan"),
                  subtitle: Text("Only include Vegan meals"),
                  onChanged: (newVal) {
                    setState(() {
                      vegan = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  value: lactoseFree,
                  title: Text("Lactose Free"),
                  subtitle: Text("Only include Lactose free meals"),
                  onChanged: (newVal) {
                    setState(() {
                      lactoseFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  value: vegetarian,
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include Vegetarian meals"),
                  onChanged: (newVal) {
                    setState(() {
                      vegetarian = newVal;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
