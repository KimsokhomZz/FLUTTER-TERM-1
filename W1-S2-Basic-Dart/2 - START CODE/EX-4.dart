void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example orders
  const orders = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double totalPrice = 0;
  for (int i = 0; i < orders.length; i++) {
    if (pizzaPrices.containsKey(orders[i])) {
      totalPrice += pizzaPrices[orders[i]]!;
    } else {
      print("${orders[i]} is not exists");
    }
  }
  print(totalPrice);
}
