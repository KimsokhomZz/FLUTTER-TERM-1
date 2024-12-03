import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food(icon: Icons.lunch_dining, value: 'FOOD'),
  travel(icon: Icons.flight_takeoff, value: 'TRAVEL'),
  leisure(icon: Icons.movie, value: 'LEISURE'),
  work(icon: Icons.work, value: 'WORK');

  final IconData icon;
  final String value;

  const Category({required this.icon, required this.value});
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  @override
  String toString() {
    return "Expense $title , amount $amount";
  }
}
