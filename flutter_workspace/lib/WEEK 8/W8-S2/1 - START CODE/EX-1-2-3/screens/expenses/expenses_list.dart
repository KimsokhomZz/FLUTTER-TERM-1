import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onExpenseRemoved,
      });

  final List<Expense> expenses;
  final Function(Expense, int) onExpenseRemoved;
  // final Function(Expense, int) onUndo;

  //snack bar
  // void _showUndoSnackBar(
  //     BuildContext context, Expense removedExpense, int index) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: const Text(
  //         'Expense deleted.',
  //       ),
  //       duration: const Duration(seconds: 2),
  //       action: SnackBarAction(
  //         label: 'Undo',
  //         onPressed: () {
  //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //           onUndo(removedExpense, index);
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //check the expense list is empty to display message
    if (expenses.isEmpty) {
      return const Center(
        child: Text('No expenses found. Start adding some!'),
      );
    }

    //render expense items if the list is not empty
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            onDismissed: (direction) {
              //save dismissed expense
              final Expense removedExpense = expenses[index];
              //remove expense
              onExpenseRemoved(removedExpense, index); 
              // _showUndoSnackBar(context, removedExpense, index);
            },
            key: Key(expenses[index].id),
            child: ExpenseItem(expenses[index])),
      ),
    );
  }
}
