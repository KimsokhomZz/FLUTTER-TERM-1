import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/models/grocery_item.dart';
import 'package:flutter_workspace/WEEK%209/1%20-%20Code%20Grocery%20-%20Start/1%20-%20Code%20Grocery%20-%20Start/widgets/grocery_list.dart';
import '../models/grocery_category.dart';

class NewItem extends StatefulWidget {
  final Mode mode;
  final GroceryItem? initialItem;
  const NewItem({super.key, required this.mode, this.initialItem});

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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing && widget.initialItem != null) {
      _name = widget.initialItem!.name;
      _quantity = widget.initialItem!.quantity;
      _selectedCategory = widget.initialItem!.category;

      //initial form with item data while in editing mode
      _nameController.text = _name;
      _quantityController.text = _quantity.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  //add item
  void _onAdd() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      //print save data to the console
      print(
          'Grocery Item Saved: Name=$_name, Quantity=$_quantity, Category=${_selectedCategory?.label}');
      //create new item
      GroceryItem groceryItem = GroceryItem(
          name: _name, quantity: _quantity, category: _selectedCategory!);
      //close form & pass added item to grocery_list screen
      Navigator.pop(context, groceryItem);
      //confirm message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(widget.mode == Mode.editing
            ? 'Grocery item edited successfully'
            : 'Grocery item added successfully'),
      ));
    }
  }

  //reset form
  void _formReset() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _quantityController.clear();
    setState(() {
      _selectedCategory = null;
    });
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
        title:
            Text(widget.mode == Mode.editing ? 'Edit Item' : 'Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
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
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      // initialValue: '1',
                      validator: _quantityValidation,
                      onSaved: (value) {
                        _quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
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
                    child:
                        Text(widget.mode == Mode.editing ? 'Edit' : 'Add Item'),
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
