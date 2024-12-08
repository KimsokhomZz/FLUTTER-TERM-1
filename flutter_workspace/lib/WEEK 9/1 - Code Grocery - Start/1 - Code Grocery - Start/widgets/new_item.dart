import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/models/grocery_item.dart';
import '../models/grocery_category.dart';

class NewItem extends StatefulWidget {
  final Function(GroceryItem) onCreated;
  const NewItem({super.key, required this.onCreated});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _quantity = 0;
  GroceryCategory? _selectedCategory;

  //add item
  void _onAdd() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      // print(
      //     'Grocery Item Saved: Name=$_name, Quantity=$_quantity, Category=${_selectedCategory?.label}');

      //create new item
      GroceryItem groceryItem = GroceryItem(
          name: _name, quantity: _quantity, category: _selectedCategory!);
      //add to grocery list
      widget.onCreated(groceryItem);
      //close form
      Navigator.pop(context);
      //confirm message
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Grocery item added successfully!'),
      ));
    }
  }

  //reset form
  void _formReset() {
    _formKey.currentState!.reset();
  }

  String? _nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name should contain 1 to 50 characters";
    }
    return null;
  }

  String? _quantityValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please input quantity';
    } else if (int.tryParse(value) == null || int.tryParse(value)! < 1) {
      return 'Invalid quantity';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: _nameValidator,
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      validator: _quantityValidation,
                      onSaved: (value) {
                        _quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      validator: (value) =>
                          value == null ? "Please select a category" : null,
                      onSaved: (value) {
                        _selectedCategory = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _formReset,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _onAdd,
                    child: const Text('Add Item'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
