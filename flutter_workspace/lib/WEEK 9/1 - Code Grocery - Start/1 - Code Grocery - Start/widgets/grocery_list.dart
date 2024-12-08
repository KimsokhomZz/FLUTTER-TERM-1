import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/models/grocery_item.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  void createNewGrocery(GroceryItem newItem) {
    setState(() {
      dummyGroceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: dummyGroceryItems.length,
          itemBuilder: (context, index) =>
              GroceryTile(groceryItem: dummyGroceryItems[index]),
        ),
      ); // TODO
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewItem(onCreated: createNewGrocery,)));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.groceryItem});

  final GroceryItem groceryItem;

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
    );
  }
}
