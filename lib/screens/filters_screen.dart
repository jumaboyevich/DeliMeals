import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this._currentFilters,  this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;

  bool _vegetarian = false;

  bool _vegan = false;

  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree=widget._currentFilters['gluten']!;
    _lactoseFree=widget._currentFilters['lactose']!;
    _vegetarian=widget._currentFilters['vegetarian']!;
    _vegan=widget._currentFilters['vegan']!;
    super.initState();
  }
  Widget _buildSwitchListTile(String title, String description, bool value,
      Function(bool) updateValue) {
    return SwitchListTile(
      value: value,
      subtitle: Text(description),
      title: Text(title),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
        actions: [
          IconButton(onPressed: (){
            final _selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(_selectedFilters);

          }, icon: const Icon(Icons.save),

          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-free', 'Only include gluten-free meals', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),_buildSwitchListTile(
                    'Lactose-free', 'Only include lactose-free meals', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),_buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),_buildSwitchListTile(
                    'Vegan', 'Only include vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
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
