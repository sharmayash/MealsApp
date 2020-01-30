import 'package:flutter/material.dart';

import '../widgets/ourDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFunction;
  final Map<String, bool> currentFilters;

  FilterScreen(this.saveFunction, this.currentFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentval, Function updateVal) {
    return SwitchListTile(
        title: Text(title),
        value: currentval,
        subtitle: Text(description),
        onChanged: updateVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OurDrawer(),
      appBar: AppBar(
        title: Text("Settings"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFunction(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten-Free",
                    "Only include gluten free meals", _isGlutenFree, (newVal) {
                  setState(() {
                    _isGlutenFree = newVal;
                  });
                }),
                _buildSwitchListTile("Lactose-Free",
                    "Only include Lactose free meals", _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include veg. meals", _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan",
                    "Only include meals for vegan i.e no eggs and milk",
                    _vegan, (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
