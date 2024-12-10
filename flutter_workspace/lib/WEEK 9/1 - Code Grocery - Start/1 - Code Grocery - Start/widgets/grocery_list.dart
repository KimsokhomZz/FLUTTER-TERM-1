import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/models/grocery_item.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/widgets/new_item.dart';
import '../data/dummy_items.dart';

enum Mode { editing, creating }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
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
              return GroceryTile(
                groceryItem: item,
                tapToEdit: () => _navigateToAddItemScreen(item: item),  //edit existing item
              );
            }),
      ); // TODO
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _navigateToAddItemScreen, //add new item
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(
      {super.key, required this.groceryItem, required this.tapToEdit});

  final GroceryItem groceryItem;
  final VoidCallback tapToEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
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
      onTap: tapToEdit,
    );
  }
}
