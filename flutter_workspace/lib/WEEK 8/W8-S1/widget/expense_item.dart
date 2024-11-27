import 'package:flutter/material.dart';
import 'package:flutter_workspace/WEEK%208/W8-S1/model/expense.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  expense.amount.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  expense.type.icon,
                  size: 40,
                ),
                Text(
                  DateFormat.yMd().format(expense.date),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
