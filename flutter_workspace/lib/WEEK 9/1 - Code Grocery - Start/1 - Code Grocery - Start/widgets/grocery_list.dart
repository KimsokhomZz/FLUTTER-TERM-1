import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/models/grocery_item.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/widgets/new_item.dart';
import '../data/dummy_items.dart';

enum Mode { editing, creating, normal, selection }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  //normal mode and selection mode handle
  Mode _currentMode = Mode.normal;
  final Set<GroceryItem> _selectedItems = {};

  //exit selection mode
  void _exitSelectionMode() {
    setState(() {
      _currentMode = Mode.normal;
      _selectedItems.clear();
    });
  }

  //remove item in the selection mode
  void _removeSelectedItem() {
    setState(() {
      dummyGroceryItems.removeWhere((item) => _selectedItems.contains(item));
      _selectedItems.clear();
      _currentMode = Mode.normal;
    });
  }

  //toggling checkBox
  void checkBoxToggle(bool value, GroceryItem item) {
    setState(() {
      if (value == true) {
        _selectedItems.add(item); //if the item have been checked
      } else {
        _selectedItems.remove(item); //if the item have been unchecked
      }
    });
  }

  //add new item and edit existing item handler
  Future<void> _navigateToAddItemScreen({GroceryItem? item}) async {
    final groceryItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
          builder: (context) => NewItem(
                mode: item != null ? Mode.editing : Mode.creating,
                initialItem: item,
              )),
    );

    if (groceryItem != null) {
      setState(() {
        if (item != null) {
          final int index = dummyGroceryItems.indexOf(item);
          dummyGroceryItems[index] =
              groceryItem; //in this case "groceryItem" means "updatedItem"
        } else if (item == null) {
          dummyGroceryItems
              .add(groceryItem); //in this case "groceryItem" means "newItem"
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: dummyGroceryItems.length,
            itemBuilder: (context, index) {
              //save each groceryItem into "item"
              final GroceryItem item = dummyGroceryItems[index];
              final bool isSelected = _selectedItems.contains(item);
              return GroceryTile(
                groceryItem: item,
                isChecked: isSelected, //check groceryTile is selected
                tapToEdit: () {
                  if (_currentMode == Mode.normal) {
                    _navigateToAddItemScreen(item: item); //edit existing item
                  }
                },
                onToggle: checkBoxToggle,
                longPress: () {
                  setState(() {
                    _currentMode = Mode.selection;
                  });
                },
                isInSelectionMode: _currentMode ==
                    Mode.selection, // Pass the current mode to GroceryTile
              );
            }),
      ); // TODO
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentMode == Mode.selection
            ? '${_selectedItems.length} selected Item(s)'
            : 'Your Groceries'),
        leading: _currentMode == Mode.selection
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _exitSelectionMode,
              )
            : null,
        actions: _currentMode == Mode.selection
            ? [
                IconButton(
                  onPressed: _selectedItems.isEmpty
                      ? null
                      : _removeSelectedItem, //delete item
                  icon: const Icon(Icons.delete),
                  tooltip: 'Delete selected items',
                ),
              ]
            : [
                IconButton(
                  onPressed: _navigateToAddItemScreen, //add new item
                  icon: const Icon(Icons.add),
                  tooltip: 'Add new item',
                ),
              ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(
      {super.key,
      required this.groceryItem,
      required this.isChecked,
      required this.tapToEdit,
      required this.onToggle,
      required this.longPress,
      required this.isInSelectionMode});

  final GroceryItem groceryItem;
  final bool isChecked;
  final VoidCallback tapToEdit;
  final void Function(bool, GroceryItem) onToggle;
  final VoidCallback longPress;
  final bool isInSelectionMode;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isInSelectionMode
          ? Checkbox(
              value: isChecked,
              onChanged: (value) {
                onToggle(value ?? false, groceryItem);
              })
          : Container(
              width: 24,
              height: 24,
              color: groceryItem.category.color,
            ),
      title: Text(groceryItem.name),
      subtitle: Text(
        groceryItem.category.label,
        style: const TextStyle(
            fontSize: 13, fontWeight: FontWeight.w300, color: Colors.grey),
      ),
      trailing: Text(groceryItem.quantity.toString()),
      onTap: () {
        if (isInSelectionMode) {
          onToggle(!isChecked, groceryItem); //Toggle selection
        } else {
          tapToEdit(); //Edit item
        }
      },
      onLongPress: longPress,
    );
  }
}

//ort der