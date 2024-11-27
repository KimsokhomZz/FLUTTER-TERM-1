import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType {
  food,
  travel,
  leisure,
  work,
}

extension ExpenseTypeIcon on ExpenseType {
  IconData get icon {
    switch (this) {
      case ExpenseType.food:
        return Icons.fastfood;
      case ExpenseType.travel:
        return Icons.airplanemode_active;
      case ExpenseType.leisure:
        return Icons.shopping_bag;
      case ExpenseType.work:
        return Icons.work;
    }
  }
}

const Uuid uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;

  Expense({required this.title, required this.amount, required this.date, required this.type})
      : id = uuid.v4();
}
