import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key, required this.scaffoldMessengerKey});

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  Expense? _recentlyRemovedExpense;
  int? _recentlyRemovedIndex;

  void onExpenseRemoved(Expense expense, int index) {
    setState(() {
      _recentlyRemovedExpense = expense;
      _recentlyRemovedIndex = index;
      _registeredExpenses.removeAt(index);
    });

    widget.scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: const Text('Expense deleted.'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          onUndoExpense();
        },
      ),
    ));
  }

  // void onExpenseRemoved(Expense expense, int index) {
  //   setState(() {
  //     _registeredExpenses.removeAt(index);
  //   });
  // }

  void onExpenseCreated(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void onUndoExpense() {
    if (_recentlyRemovedIndex != null && _recentlyRemovedExpense != null) {
      setState(() {
        _registeredExpenses.insert(
            _recentlyRemovedIndex!, _recentlyRemovedExpense!);
        // Clear the temporary variables
        _recentlyRemovedExpense = null;
        _recentlyRemovedIndex = null;
      });
    }
  }

  // void onUndoExpense(Expense expense, int index) {
  //   setState(() {
  //     _registeredExpenses.insert(index, expense);
  //   });
  // }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // scaffoldMessengerKey: _scaffoldMessengerKey,
      // key: _scaffoldMessengerKey,
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ExpensesList(
        expenses: _registeredExpenses,
        onExpenseRemoved: onExpenseRemoved,
        // onUndo: onUndoExpense,
      ),
    );
  }
}
