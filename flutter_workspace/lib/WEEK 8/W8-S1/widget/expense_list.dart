import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%208/W8-S1/model/expense.dart';
import 'package:flutter_workspace/WEEK%208/W8-S1/widget/expense_Item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key});

  final List<Expense> _registerExpenses = [
    Expense(
        title: "KDMV",
        amount: 150,
        date: DateTime.now(),
        type: ExpenseType.leisure),
    Expense(
        title: "Groceries",
        amount: 15.90,
        date: DateTime.now(),
        type: ExpenseType.food),
    Expense(
        title: "Bus Ticket",
        amount: 290,
        date: DateTime.now(),
        type: ExpenseType.travel),
    Expense(
        title: "Go to Office",
        amount: 2.50,
        date: DateTime.now(),
        type: ExpenseType.work),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _registerExpenses.length,
      itemBuilder: (context, index) {
        return ExpenseItem(
          expense: _registerExpenses[index],
        );
      },
    );
  }
}
