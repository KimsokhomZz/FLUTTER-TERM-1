import 'package:uuid/uuid.dart';

import 'grocery_category.dart';

const uuid = Uuid();

class GroceryItem {


  GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  }) ;


  // named - builid new : id = uuid.v4() ### Maybe not need
  
  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;
}
