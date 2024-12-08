import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();
  Category? selectedCategory;

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  //cancel add Expense function
  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  //add new Expense function
  void onAdd() {
    //null safety
    try {
      // 1- Get the values from inputs
      //get title & null check
      String title = _titleController.text.trim();
      if (title.isEmpty) throw Exception('Please give valid title.');

      //get amount & null check
      String amount = _valueController.text.trim();
      // double amount = double.parse(_valueController.text);
      if (amount.isEmpty) throw Exception('Please give valid amount.');

      //null safety on category selection
      if (selectedCategory == null) throw Exception('Please select category.');

      //get dateTime & null check
      String dateTime = _dateController.text;
      if (dateTime.isEmpty) throw Exception('Please give valid date.');

      // 2- Create the expense
      Expense expense = Expense(
          title: title,
          amount: double.parse(amount),
          date: DateTime.parse(dateTime), //  TODO :  For now it s a fake data
          category: selectedCategory!); //  TODO :  For now it s a fake data

      // 3- Ask the parent to add the expense
      widget.onCreated(expense);

      // 4- Close modal
      Navigator.pop(context);
    } catch (e) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Input Error!'),
            content:
                const Text('Failed to add expense. Please check your inputs.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Close'),
              )
            ],
          );
        },
      );
    }
  }

  //Date selection
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    //null safety
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  // maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    labelText: 'Amount',
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Select Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: DropdownButton(
                  value: selectedCategory,
                  dropdownColor: Colors.grey[200],
                  hint: const Text('Select'),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.blue[700],
                    size: 21,
                  ),
                  isExpanded: true,
                  items: Category.values.map((Category category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.value),
                    );
                  }).toList(),
                  onChanged: (Category? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 16,
              ),
              ElevatedButton(
                  onPressed: onAdd, child: const Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}
