class MenuItem {
  final String name;
  final double price;
  final String category;

  MenuItem(this.name, this.price, this.category);

  void displayItemDetail() {
    print(
        "Item Name: $name\n Price: \$${price.toStringAsFixed(2)}\n Category: $category");
  }
}

class Menu {
  final List<MenuItem> menuItems = [];

  void addItem(MenuItem item) => menuItems.add(item);
  void removeItem(MenuItem item) => menuItems.remove(item);
  List<MenuItem> findItem(String name) {
    return menuItems.where((item) => item.name == name).toList();
  }
  //should have display all items in the menu
}

class Customer {
  final int customerID;
  final String name;
  final String phoneNum;

  Customer(this.customerID, this.name, this.phoneNum);

  void placeOrder(List<MenuItem> items) {
    //
  }

  void reserveTable(TableReservation tableReservation) {
    //
  }
}

class TableReservation {
  final int reservationID;
  final Customer customer;
  final int tableNum;
  final DateTime reservationDate;
  String status;

  TableReservation(
      this.reservationID, this.customer, this.tableNum, this.reservationDate,
      {this.status = "Table has Reserved"});

  void cancelReservation() =>
      status = "Table has cancel"; //should check hour for cancel
}

class Order {
  final int orderID;
  final Customer customer;
  final List<MenuItem> items;
  String status;
  bool paymentStatus;
  double totalPrice = 0;

  Order(this.orderID, this.customer, this.items,
      {this.status = "Order was Placed.", this.paymentStatus = false}) {
    priceCalulate();
  }

  void priceCalulate() {
    for (int i = 0; i < items.length; i++) {
      totalPrice += items[i].price;
    }
  }

  void updateStatus(String newStatus) {
    status = newStatus;
  }

  void makePayment() => paymentStatus = true;
}

class Restaurant {
  final Menu menu = Menu();
  final List<MenuItem> order = [];
  final List<TableReservation> reservation = [];
  final Map<int, bool> tables = {};

  void addMenuItem(MenuItem item) => menu.addItem(item);
  void createOrder(Customer customer, List<MenuItem> items){
    //
  }
  void reserveTable(Customer customer, int tableNum, DateTime date){
    //
  }
  void checkAvailableTable(int tableNum){
    //
  }
}

void main(){
  //
}