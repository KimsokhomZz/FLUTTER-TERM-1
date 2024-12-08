import 'package:uuid/uuid.dart';

import 'grocery_category.dart';

const uuid = Uuid();

class GroceryItem {
  GroceryItem({
    required this.name,
    required this.quantity,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;
}
